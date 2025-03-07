module ttl_74hct02(
	output y1,
	input a1,
	input b1,
	output y2,
	input a2,
	input b2,
	input b3,
	output y3,
	input a3,
	input b4,
	output y4,
	input a4
);

assign #16 y1 = !(a1 || b1);
assign #16 y2 = !(a2 || b2);
assign #16 y3 = !(a3 || b3);
assign #16 y4 = !(a4 || b4);

endmodule
