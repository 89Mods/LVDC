module mem_28C16(
	input [10:0] A,
	input WEb,
	input OEb,
	input CEb,
	output [7:0] IO
);

reg [7:0] memory [2047:0];

assign #150 IO = CEb || OEb ? 8'hzz : memory[A];

endmodule
