module mem_IS61C256(
	input [14:0] A,
	input WEb,
	input OEb,
	input CEb,
	inout [7:0] IO
);

reg [7:0] memory [32767:0];

wire disabled = CEb || OEb || !WEb;
assign IO = disabled ? 8'hzz : memory[A];

always @(posedge WEb) begin
	if(!CEb) #10 memory[A] <= IO;
end

endmodule
