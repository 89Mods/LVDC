`default_nettype none

module virtual_backplane(
	input clk,
	input irq
);

wire rstb_wire;
assign rstb_wire = rstb;

tri0 [25:0] databus;
wire [12:0] instruction;
wire [25:0] accumulator;

tri0 INT_IN;
assign INT_IN = irq;

//ALU <-> Control
wire IS_RSU;
wire nALU_R;
wire ALU_ISS;

//Registers <-> Control
wire ACCW;
wire ACCUM_NEGATIVE = accumulator[25];
wire ACCUM_ZERO;
wire nR_A;
wire CDS;
wire TRA;
wire CSYLLABLE;
wire INCPC;
wire H_CYC_1;
wire nR_H;
wire HOPW;

//Registers -> Memory
wire [7:0] HOP_IP;
wire [3:0] HOP_IS;
wire [2:0] HOP_IM;
wire [3:0] HOP_DS;
wire [2:0] HOP_DM;

//Control <-> Memory
wire MEM_WR;
wire MEM_RD;
tri0 irupt;
wire IS_EXM_I;
wire EXM_EXEC_I;
wire HOP_INSTEAD_OF_A;
wire [2:0] EXM_SECTOR;
wire PQ_ADDR;
wire FETCH_CYC;

//Control <-> Muldiv
wire IS_DIV;
wire OUTPUT_PQ;
wire LDZ;
wire MD_RST;
wire MD_START;
tri0 MD_IS_ACTIVE;
wire LDX;
wire LDY;

//Control -> IO
wire nIOR;
wire nIOW;

wire GND;
assign GND = 1'b0;

wire gen_clk;
wire rstb;

ALU ALU(
	//Backplane connections
	.DB0(databus[0]), .DB1(databus[1]), .DB2(databus[2]), .DB3(databus[3]), .DB4(databus[4]),
	.DB5(databus[5]), .DB6(databus[6]), .DB7(databus[7]), .DB8(databus[8]), .DB9(databus[9]),
	.DB10(databus[10]), .DB11(databus[11]), .DB12(databus[12]), .DB13(databus[13]), .DB14(databus[14]),
	.DB15(databus[15]), .DB16(databus[16]), .DB17(databus[17]), .DB18(databus[18]), .DB19(databus[19]),
	.DB20(databus[20]), .DB21(databus[21]), .DB22(databus[22]), .DB23(databus[23]), .DB24(databus[24]), .DB25(databus[25]),
	.I0(instruction[0]), .I1(instruction[1]), .I2(instruction[2]), .I3(instruction[3]), .I4(instruction[4]), .I5(instruction[5]),
	.I6(instruction[6]), .I7(instruction[7]), .I8(instruction[8]), .I9(instruction[9]), .I10(instruction[10]),
	.I11(instruction[11]), .I12(instruction[12]),
	.nRST(rstb_wire), .CLK(gen_clk),
	//ALU <-> Control
	.IS_RSU(IS_RSU), .nALU_R(nALU_R), .ALU_ISS(ALU_ISS),
	//Registers -> ALU
	.A0(accumulator[0]), .A1(accumulator[1]), .A2(accumulator[2]), .A3(accumulator[3]), .A4(accumulator[4]),
	.A5(accumulator[5]), .A6(accumulator[6]), .A7(accumulator[7]), .A8(accumulator[8]), .A9(accumulator[9]),
	.A10(accumulator[10]), .A11(accumulator[11]), .A12(accumulator[12]), .A13(accumulator[13]), .A14(accumulator[14]),
	.A15(accumulator[15]), .A16(accumulator[16]), .A17(accumulator[17]), .A18(accumulator[18]), .A19(accumulator[19]),
	.A20(accumulator[20]), .A21(accumulator[21]), .A22(accumulator[22]), .A23(accumulator[23]), .A24(accumulator[24]), .A25(accumulator[25])
);

Registers Registers(
	//Backplane connections
	.DB0(databus[0]), .DB1(databus[1]), .DB2(databus[2]), .DB3(databus[3]), .DB4(databus[4]),
	.DB5(databus[5]), .DB6(databus[6]), .DB7(databus[7]), .DB8(databus[8]), .DB9(databus[9]),
	.DB10(databus[10]), .DB11(databus[11]), .DB12(databus[12]), .DB13(databus[13]), .DB14(databus[14]),
	.DB15(databus[15]), .DB16(databus[16]), .DB17(databus[17]), .DB18(databus[18]), .DB19(databus[19]),
	.DB20(databus[20]), .DB21(databus[21]), .DB22(databus[22]), .DB23(databus[23]), .DB24(databus[24]), .DB25(databus[25]),
	.I0(instruction[0]), .I1(instruction[1]), .I2(instruction[2]), .I3(instruction[3]), .I4(instruction[4]), .I5(instruction[5]),
	.I6(instruction[6]), .I7(instruction[7]), .I8(instruction[8]), .I9(instruction[9]), .I10(instruction[10]),
	.I11(instruction[11]), .I12(instruction[12]),
	.nRST(rstb_wire), .CLK(gen_clk), .GND(GND),
	//Registers -> ALU
	.A0(accumulator[0]), .A1(accumulator[1]), .A2(accumulator[2]), .A3(accumulator[3]), .A4(accumulator[4]),
	.A5(accumulator[5]), .A6(accumulator[6]), .A7(accumulator[7]), .A8(accumulator[8]), .A9(accumulator[9]),
	.A10(accumulator[10]), .A11(accumulator[11]), .A12(accumulator[12]), .A13(accumulator[13]), .A14(accumulator[14]),
	.A15(accumulator[15]), .A16(accumulator[16]), .A17(accumulator[17]), .A18(accumulator[18]), .A19(accumulator[19]),
	.A20(accumulator[20]), .A21(accumulator[21]), .A22(accumulator[22]), .A23(accumulator[23]), .A24(accumulator[24]), .A25(accumulator[25]),
	//Registers <-> Control
	.ACCW(ACCW), /*.ACCUM_NEGATIVE(ACCUM_NEGATIVE),*/ .ACCUM_ZERO(ACCUM_ZERO), .nR_A(nR_A), .CDS(CDS), .TRA(TRA), .CSYLLABLE(CSYLLABLE),
	.INCPC(INCPC), .H_CYC_1(H_CYC_1), .nR_H(nR_H), .HOPW(HOPW),
	//Registers -> Memory
	.HOP_IP0(HOP_IP[0]), .HOP_IP1(HOP_IP[1]), .HOP_IP2(HOP_IP[2]), .HOP_IP3(HOP_IP[3]), .HOP_IP4(HOP_IP[4]),
	.HOP_IP5(HOP_IP[5]), .HOP_IP6(HOP_IP[6]), .HOP_IP7(HOP_IP[7]),
	.HOP_IS0(HOP_IS[0]), .HOP_IS1(HOP_IS[1]), .HOP_IS2(HOP_IS[2]), .HOP_IS3(HOP_IS[3]),
	.HOP_IM0(HOP_IM[0]), .HOP_IM1(HOP_IM[1]), .HOP_IM2(HOP_IM[2]),
	.HOP_DS0(HOP_DS[0]), .HOP_DS1(HOP_DS[1]), .HOP_DS2(HOP_DS[2]), .HOP_DS3(HOP_DS[3]),
	.HOP_DM0(HOP_DM[0]), .HOP_DM1(HOP_DM[1]),. HOP_DM2(HOP_DM[2])
);

Memory Memory(
	//Backplane connections
	.DB0(databus[0]), .DB1(databus[1]), .DB2(databus[2]), .DB3(databus[3]), .DB4(databus[4]),
	.DB5(databus[5]), .DB6(databus[6]), .DB7(databus[7]), .DB8(databus[8]), .DB9(databus[9]),
	.DB10(databus[10]), .DB11(databus[11]), .DB12(databus[12]), .DB13(databus[13]), .DB14(databus[14]),
	.DB15(databus[15]), .DB16(databus[16]), .DB17(databus[17]), .DB18(databus[18]), .DB19(databus[19]),
	.DB20(databus[20]), .DB21(databus[21]), .DB22(databus[22]), .DB23(databus[23]), .DB24(databus[24]), .DB25(databus[25]),
	.I0(instruction[0]), .I1(instruction[1]), .I2(instruction[2]), .I3(instruction[3]), .I4(instruction[4]), .I5(instruction[5]),
	.I6(instruction[6]), .I7(instruction[7]), .I8(instruction[8]), .I9(instruction[9]), .I10(instruction[10]),
	.I11(instruction[11]), .I12(instruction[12]),
	.nRST(rstb_wire), .CLK(gen_clk),
	//Registers -> Memory
	.HOP_IP0(HOP_IP[0]), .HOP_IP1(HOP_IP[1]), .HOP_IP2(HOP_IP[2]), .HOP_IP3(HOP_IP[3]), .HOP_IP4(HOP_IP[4]),
	.HOP_IP5(HOP_IP[5]), .HOP_IP6(HOP_IP[6]), .HOP_IP7(HOP_IP[7]),
	.HOP_IS0(HOP_IS[0]), .HOP_IS1(HOP_IS[1]), .HOP_IS2(HOP_IS[2]), .HOP_IS3(HOP_IS[3]),
	.HOP_IM0(HOP_IM[0]), .HOP_IM1(HOP_IM[1]), .HOP_IM2(HOP_IM[2]),
	.HOP_DS0(HOP_DS[0]), .HOP_DS1(HOP_DS[1]), .HOP_DS2(HOP_DS[2]), .HOP_DS3(HOP_DS[3]),
	.HOP_DM0(HOP_DM[0]), .HOP_DM1(HOP_DM[1]),. HOP_DM2(HOP_DM[2]),
	//Control <-> Memory
	.FETCH_CYC(FETCH_CYC), .MEM_WR(MEM_WR), .MEM_RD(MEM_RD), .IS_EXM_I(IS_EXM_I), .irupt(irupt), .PQ_ADDR(PQ_ADDR),
	.EXM_EXEC_I(EXM_EXEC_I), .HOP_INSTEAD_OF_A(HOP_INSTEAD_OF_A), .EXM_SECTOR0(EXM_SECTOR[0]), .EXM_SECTOR1(EXM_SECTOR[1]), .EXM_SECTOR2(EXM_SECTOR[2])
);

Control Control(
	.INT_IN(INT_IN),
	//Backplane connections
	.DB0(databus[0]), .DB1(databus[1]), .DB2(databus[2]), .DB3(databus[3]), .DB4(databus[4]),
	.DB5(databus[5]), .DB6(databus[6]), .DB7(databus[7]), .DB8(databus[8]), .DB9(databus[9]),
	.DB10(databus[10]), .DB11(databus[11]), .DB12(databus[12]), .DB13(databus[13]), .DB14(databus[14]),
	.DB15(databus[15]), .DB16(databus[16]), .DB17(databus[17]), .DB18(databus[18]), .DB19(databus[19]),
	.DB20(databus[20]), .DB21(databus[21]), .DB22(databus[22]), .DB23(databus[23]), .DB24(databus[24]), .DB25(databus[25]),
	.I0(instruction[0]), .I1(instruction[1]), .I2(instruction[2]), .I3(instruction[3]), .I4(instruction[4]), .I5(instruction[5]),
	.I6(instruction[6]), .I7(instruction[7]), .I8(instruction[8]), .I9(instruction[9]), .I10(instruction[10]),
	.I11(instruction[11]), .I12(instruction[12]),
	.nRST(rstb_wire), .CLK(gen_clk), .GND(GND),
	//ALU <-> Control
	.IS_RSU(IS_RSU), .nALU_R(nALU_R), .ALU_ISS(ALU_ISS),
	//Registers <-> Control
	.ACCW(ACCW), .ACCUM_NEGATIVE(ACCUM_NEGATIVE), .ACCUM_ZERO(ACCUM_ZERO), .nR_A(nR_A), .CDS(CDS), .TRA(TRA), .CSYLLABLE(CSYLLABLE),
	.INCPC(INCPC), .H_CYC_1(H_CYC_1), .nR_H(nR_H), .HOPW(HOPW),
	//Control <-> Memory
	.FETCH_CYC(FETCH_CYC), .MEM_WR(MEM_WR), .MEM_RD(MEM_RD), .IS_EXM_I(IS_EXM_I), .irupt(irupt), .PQ_ADDR(PQ_ADDR),
	.EXM_EXEC_I(EXM_EXEC_I), .HOP_INSTEAD_OF_A(HOP_INSTEAD_OF_A), .EXM_SECTOR0(EXM_SECTOR[0]), .EXM_SECTOR1(EXM_SECTOR[1]), .EXM_SECTOR2(EXM_SECTOR[2]),
	//Control <-> Muldiv
	.IS_DIV(IS_DIV), .OUTPUT_PQ(OUTPUT_PQ), .LDZ(LDZ), .MD_RST(MD_RST), .MD_START(MD_START), .LDX(LDX), .LDY(LDY), .MD_IS_ACTIVE(MD_IS_ACTIVE),
	//Control -> IO
	.nIOR(nIOR),
	.nIOW(nIOW)
);

io_emulation IO(
	.DB(databus),
	.I(instruction),
	.clockout(gen_clk),
	.rstb(rstb),
	.clockin(clk),
	.nIOR(nIOR),
	.nIOW(nIOW)
);

endmodule
