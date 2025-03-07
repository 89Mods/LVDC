module ttl_74hc74(
	input D1,
	input C1,
	input S1b,
	input R1b,
	output Q1,
	output Q1b,
	input D2,
	input C2,
	input S2b,
	input R2b,
	output Q2,
	output Q2b
);

reg state_1;
reg state_2;
assign Q1 = state_1;
assign Q2 = state_2;
assign Q1b = !state_1;
assign Q2b = !state_2;

always @(posedge C1 or S1b or R1b) begin
	if(S1b && !R1b) begin
		state_1 <= 1'b0;
	end else if(!S1b && R1b) begin
		state_1 <= 1'b1;
	end else if(!S1b && !R1b) begin
		state_1 <= 1'b1;
	end else state_1 <= D1;
end

always @(posedge C2 or S2b or R2b) begin
	if(S2b && !R2b) begin
		state_2 <= 1'b0;
	end else if(!S2b && R2b) begin
		state_2 <= 1'b1;
	end else if(!S2b && !S2b) begin
		state_2 <= 1'b1;
	end else state_2 <= D2;
end

endmodule
