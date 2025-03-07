module ttl_74hct163(
	input [3:0] D,
	input PEb,
	input CEP,
	input CET,
	input CP,
	input MRb,
	output [3:0] Q,
	output TC
);

assign #4 TC = state == 4'hF;
assign #4 Q = state;

reg [3:0] state;
always @(posedge CP) begin
	if(!MRb) state <= 4'h0;
	else if(!PEb) state <= D;
	else if(CEP && CET) state <= state + 1;
end

endmodule
