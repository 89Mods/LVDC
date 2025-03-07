module ttl_74hc85(
	input [3:0] A,
	input [3:0] B,
	input IAgtB,
	input IAltB,
	input IAeqB,
	output OAgtB,
	output OAltB,
	output OAeqB
);

reg gt;
reg lt;
reg eq;
always @(*) begin
	if(A == B) begin
		gt = IAgtB;
		lt = IAltB;
		eq = IAeqB;
	end else begin
		gt = A > B;
		lt = A < B;
		eq = 1'b0;
	end
end
assign #30 OAgtB = gt;
assign #30 OAltB = lt;
assign #30 OAeqB = eq;

endmodule
