`default_nettype none
`timescale 1ns/100ps

module tb(
	input clk
);

reg [1:0] rst = 3;
always @(posedge clk) rst <= rst == 0 ? 0 : rst - 1;

wire [14:0] mem_addr;
wire [25:0] mem_wval;
wire [25:0] mem_rval;
wire mem_wen;

reg [25:0] memory [32767:0];
initial begin
	//integer i;
	//for(i = 0; i < 32768; i=i+1) memory[i] = 26'h0;
	
	$readmemh("../test.txt", memory, 0, 32767);
end
assign mem_rval = memory[mem_addr];
always @(posedge clk) if(mem_wen) memory[mem_addr] <= mem_wval;

lvdc lvdc(
	.clk(clk),
	.rst(rst != 0),
	.mem_wen(mem_wen),
	.mem_wval(mem_wval),
	.mem_addr(mem_addr),
	.mem_rval(mem_rval),
	.irupt(1'b0)
);

`ifdef TRACE_ON
initial begin
	$dumpfile("tb.vcd");
	$dumpvars();
end
`endif

endmodule
