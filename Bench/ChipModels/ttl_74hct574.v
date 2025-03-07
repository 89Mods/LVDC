module ttl_74hct574(
	input [7:0] D,
	output [7:0] Q,
	input Load,
	input OEb
);

reg [7:0] state;

always @(posedge Load) begin
	state <= D;
end

assign #30 Q = OEb ? 8'hzz : state;

endmodule
