module ttl_74alvc164245(
	inout [7:0] A1,
	inout [7:0] B1,
	inout [7:0] A2,
	inout [7:0] B2,
	input nOE1,
	input nOE2,
	input AtoB1,
	input AtoB2
);

assign A1 = nOE1 || AtoB1 ? 8'hzz : B1;
assign B1 = nOE1 || (!AtoB1) ? 8'hzz : A1;

assign A2 = nOE2 || AtoB2 ? 8'hzz : B2;
assign B2 = nOE2 || (!AtoB2) ? 8'hzz : A2;

endmodule
