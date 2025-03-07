module ttl_74hct04(
	input [5:0] ins,
	output [5:0] outs
);

assign #16 outs = ~ins;

endmodule
