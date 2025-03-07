module ttl_74hct245(
	inout [7:0] A,
	inout [7:0] B,
	input nCE,
	input AtoB
);

assign A = nCE || AtoB ? 8'hzz : B;
assign B = nCE || (!AtoB) ? 8'hzz : A;

endmodule
