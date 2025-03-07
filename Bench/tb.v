`default_nettype none
`timescale 1ns/1ns

module tb(
	input clk,
	input irq
);

virtual_backplane computer(
	.clk(clk),
	.irq(irq)
);

initial begin
	$readmemh("../microcode_verilog_lo.txt", computer.Control._U12.U12.memory, 0, 2047);
	$readmemh("../microcode_verilog_hi.txt", computer.Control._U13.U13.memory, 0, 2047);
	$readmemh("../rom_lo.txt", computer.Memory._U16.U16.memory, 0, 2047);
	$readmemh("../rom_hi.txt", computer.Memory._U17.U17.memory, 0, 2047);
`ifdef TRACE_ON
	$dumpfile("tb.vcd");
	$dumpvars(0, computer);
`endif
end

wire [14:0] mem_addr = computer.Memory._U24.U24.A;
wire [25:0] mem_val = {computer.Memory._U27.U27.IO, computer.Memory._U26.U26.IO, computer.Memory._U25.U25.IO[7], computer.Memory._U25.U25.IO[5], computer.Memory._U25.U25.IO[2:0], computer.Memory._U24.U24.IO[4:0]};

endmodule
