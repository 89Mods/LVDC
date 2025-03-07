`default_nettype none
`timescale 1ns/100ps

module lvdc(
	output [14:0] mem_addr, //8 modules, 16 sectors, 256 words
	input [25:0] mem_rval,
	output [25:0] mem_wval,
	output mem_wen,
	input irupt,
	input clk,
	input rst
);

assign mem_wen = is_sto && step == 1;
assign mem_addr = fetch ? {instr_module, instr_sector, PC} : ({data_module, irupt ? 4'h1 : (exm_exec ? {exm_sector[0], 1'b1, exm_sector[2:1]} : (data_sector | {4{residual || is_exm}})), is_exm ? {1'b1, opaddr[6:5], 5'h0} : (opaddr & {8{~irupt_masked}})});
assign mem_wval = (mem_addr[11:0] == 12'hFFF || mem_addr[11:0] == 12'hFFE) ? HOP_saver : A;
wire is_prod_quot_address = mem_addr[11:0] == 12'hFFD;
wire [25:0] mem_rval_actual = is_prod_quot_address ? prod_quot : mem_rval;

reg irupt_mask;
reg [25:0] prod_quot;
reg [25:0] A;
reg [12:0] insin;
reg step;
reg exm_exec;
reg [2:0] exm_sector;
wire fetch = step == 0;
wire accum_zero = A == 26'h0;
wire accum_negative = A[25];
wire irupt_masked = !irupt_mask & irupt;

//HOP register
reg [25:0] HOP_saver;
reg [25:0] HOP;
wire [2:0] instr_module = {HOP[1:0], HOP[25]};
wire [3:0] data_sector = HOP[23:20];
wire [2:0] data_module = HOP[19:17];
wire [7:0] PC = HOP[14:7];
wire curr_syllable = HOP[6];
wire [3:0] instr_sector = HOP[5:2];

wire [12:0] next_instr = curr_syllable ? mem_rval_actual[25:13] : mem_rval_actual[12:0];
wire [3:0] opcode = insin[3:0];
wire residual = insin[4];
wire [7:0] opaddr = insin[12:5];

//ALU
//74LS181 codes (all active-high data):
//C M S[3:0]
//Subtract: 0 0 0110
//AND: x 1 1011
//Add: 1 0 1001
//XOR: x 1 0110
//Nothing: x 1 1010

//a = opcode[3]
//b = opcode[2]
//c = opcode[1]
//d = opcode[0]
//S0 = ~a & b
//S1 = (~d) | a;
//S2 = ~b | ~c
//S3 = b & c
//M = (b & ~d) | (a & c) | (~b & ~c)
//C = ~a & d
wire [25:0] ALU_in1 = A;
wire [25:0] ALU_in2 = mem_rval_actual;
reg [25:0] ALU_out;
always @(*) begin
	case(opcode)
		default: ALU_out = ALU_in2;
		15: ALU_out = ALU_in2;
		2: ALU_out = ALU_in1 - ALU_in2;
		6: ALU_out = ALU_in1 & ALU_in2;
		7: ALU_out = ALU_in1 + ALU_in2;
		9: ALU_out = ALU_in1 ^ ALU_in2;
		13: ALU_out = ALU_in2 - ALU_in1; //Great...need to conditionally swap operands
	endcase
end

//Shifter
//In real hardware, should be implementable by addr bits activating three-state drivers
wire [25:0] shifter_in = ALU_in1;
reg [25:0] shifter_out;
always @(*) begin
	case({opaddr[5], opaddr[4], opaddr[1], opaddr[0]})
		default: shifter_out = 26'h0;
		1: shifter_out = {shifter_in[25], shifter_in[25:1]};
		2: shifter_out = {shifter_in[25], shifter_in[25], shifter_in[25:2]};
		4: shifter_out = {shifter_in[24:0], 1'b0};
		8: shifter_out = {shifter_in[23:0], 2'b00};
	endcase
end

wire is_alu_op = opcode == 2 || opcode == 6 || opcode == 7 || opcode == 9 || opcode == 15 || opcode == 13;
wire is_sto = opcode == 11;
wire is_tnz = opcode == 4;
wire is_tra = opcode == 8;
wire is_tmi = opcode == 12;
wire is_pio = opcode == 10;

wire is_extended = opcode == 14;
wire [1:0] ext_op = {opaddr[7], residual};
wire is_exm = is_extended && ext_op == 3;
wire [12:0] modified_instr = {next_instr[12:9], next_instr[8] | insin[8], next_instr[7] | insin[7], insin[6:5], 1'b0, next_instr[3:0]}; //In hardware, probably better to modify insin in-flight with ANDs and ORs rather than multiplexing the whole thing

always @(posedge clk) begin
	if(rst) begin
		step <= 0;
		HOP <= 0;
		A <= 0;
		exm_exec <= 0;
		irupt_mask <= 0;
	end else begin
		step <= step + 1;
		if(fetch) begin
			insin <= irupt_masked ? 0 : (is_exm ? modified_instr : next_instr);
			exm_exec <= is_exm;
			exm_sector <= next_instr[6:4];
			if(!is_exm && !irupt_masked) begin
				HOP[14:7] <= PC + 1;
				HOP_saver <= HOP;
			end
			irupt_mask <= irupt;
		end
		if(step == 1) begin
			if(opcode == 4'b0000) begin
				HOP <= mem_rval_actual;
			end
			if(is_alu_op) begin
				A <= ALU_out;
			end
			if(is_sto && is_prod_quot_address) prod_quot <= A;
			if((is_tnz && !accum_zero) || (is_tmi && accum_negative) || is_tra) begin
				HOP[14:7] <= opaddr;
				HOP[6] <= residual;
			end
			if(is_extended) begin
				if(ext_op == 0 || ext_op == 2) HOP[23:16] <= opaddr;
				if(ext_op == 1) A <= shifter_out;
			end
			if(is_pio) begin
				//Here, we can finally do whatever we want to talk to the outside world
				if(opaddr == 26) irupt_mask <= 1'b0;
			end
		end
	end
end

endmodule
