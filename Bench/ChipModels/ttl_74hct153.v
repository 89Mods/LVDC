module ttl_74hct153(
	input [1:0] S,
	input Eb,
	input Ea,
	input [3:0] Ib,
	input [3:0] Ia,
	output Zb,
	output Za
);

assign #24 Za = Ea ? 1'b0 : Ia[S];
assign #24 Zb = Eb ? 1'b0 : Ib[S];

endmodule
