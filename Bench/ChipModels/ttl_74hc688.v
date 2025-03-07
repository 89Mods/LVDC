module ttl_74hc688(
	input [7:0] P,
	input [7:0] R,
	input Gb,
	output PeqR
);

assign #20 PeqR = Gb ? 1'b1 : P != R;

endmodule
