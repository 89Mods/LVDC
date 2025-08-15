`default_nettype none
`timescale 1ns/1ns

module tb(
	input clk
);

wire booted;
wire keyrupt = countdown == 4096 || countdown == 2048 || countdown == 1024;
virtual_backplane computer(
	.clk(clk),
	.booted(booted),
	.keyrupt(keyrupt)
);

initial begin
	$readmemh("../microcode_verilog_lo.txt", computer.Control._U12.U12.memory, 0, 2047);
	$readmemh("../microcode_verilog_hi.txt", computer.Control._U13.U13.memory, 0, 2047);
	$readmemh("../rom_lo.txt", computer.Memory._U16.U16.memory, 0, 2047);
	$readmemh("../rom_hi.txt", computer.Memory._U17.U17.memory, 0, 2047);
end

integer countdown = 0;

reg booted_edge = 0;
always @(posedge clk) begin
	booted_edge <= booted;
	if(booted && !booted_edge) begin
		$display("Boot complete");
	`ifdef TRACE_ON
		$dumpfile("tb.vcd");
		$dumpvars(0, computer);
	`endif
		countdown <= 8192;
	end
	if(countdown) begin
		countdown <= countdown - 1;
	end
	if(countdown == 1) $finish();
end

wire [14:0] mem_addr = computer.Memory._U24.U24.A;
wire [25:0] mem_val = {computer.Memory._U27.U27.IO, computer.Memory._U26.U26.IO, computer.Memory._U25.U25.IO[7], computer.Memory._U25.U25.IO[5], computer.Memory._U25.U25.IO[2:0], computer.Memory._U24.U24.IO[4:0]};

endmodule
