module ttl_74hct11(
	input a1,
	input b1,
	input c1,
	output y1,
	input a2,
	input b2,
	input c2,
	output y2,
	input a3,
	input b3,
	input c3,
	output y3
);

assign #16 y1 = a1 & b1 & c1;
assign #16 y2 = a2 & b2 & c2;
assign #16 y3 = a3 & b3 & c3;

endmodule
