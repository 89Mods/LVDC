module ttl_74hc244(
	input [3:0] A1,
	input [3:0] A2,
	output [3:0] Y1,
	output [3:0] Y2,
	input OE1b,
	input OE2b
);

assign #14 Y1 = OE1b ? 4'hz : A1;
assign #14 Y2 = OE2b ? 4'hz : A2;

endmodule
