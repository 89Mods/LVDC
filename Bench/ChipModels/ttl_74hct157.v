module ttl_74hct157(
	input [1:0] d,
	input [1:0] c,
	input [1:0] b,
	input [1:0] a,
	input S,
	input Eb,
	output [3:0] out
);

assign #18 out = Eb ? 4'h0 : (S ? {d[1], c[1], b[1], a[1]} : {d[0], c[0], b[0], a[0]});

endmodule
