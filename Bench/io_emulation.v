`default_nettype none

module io_emulation(
	inout [25:0] DB,
	input [12:0] I,
	output clockout,
	output rstb,
	input clockin,
	input nIOR,
	input nIOW,
	output reg booted = 0,
	input KEY_CLEARb,
	output INTERRUPT_OUT
);

reg V3_rstb;
initial begin
	V3_rstb = 1'b0;
	#8700;
	V3_rstb = 1'b1;
end

reg [1:0] clockdiv;
assign clockout = clockdiv[1];
always @(posedge clockin) begin
	clockdiv <= clockdiv + 1;
end

ttl_74lv1t34 U9(
	.A(V3_rstb),
	.Y(rstb)
);

wire BDIR;
wire [15:0] V3_DB;
ttl_74alvc164245 U10(
	.A1(V3_DB[7:0]),
	.B1(DB[7:0]),
	.A2(V3_DB[15:8]),
	.B2(DB[15:8]),
	.nOE1(1'b0),
	.nOE2(1'b0),
	.AtoB1(BDIR),
	.AtoB2(BDIR)
);

wire V3_I5;
ttl_74lv1t34 U11(
	.A(I[5]),
	.Y(V3_I5)
);

wire V3_I6;
ttl_74lv1t34 U12(
	.A(I[6]),
	.Y(V3_I6)
);

wire V3_I7;
ttl_74lv1t34 U13(
	.A(I[7]),
	.Y(V3_I7)
);

wire V3_I8;
ttl_74lv1t34 U14(
	.A(I[8]),
	.Y(V3_I8)
);

wire V3_nIOR;
ttl_74lv1t34 U27(
	.A(nIOR),
	.Y(V3_nIOR)
);

wire V3_nIOW;
ttl_74lv1t34 U28(
	.A(nIOW),
	.Y(V3_nIOW)
);

wire V3_clockin;
ttl_74lv1t34 U8(
	.A(clockin),
	.Y(V3_clockin)
);

ttl_74lv1t34 U24(
	.A(V3_INTERRUPT),
	.Y(INTERRUPT_OUT)
);

wire GPIO_READb;
ttl_74hc244 U6(
	.A1(4'h0),
	.A2(4'h0),
	.Y1(DB[3:0]),
	.Y2(DB[7:4]),
	.OE1b(GPIO_READb),
	.OE2b(GPIO_READb)
);

wire BODGE1;
ttl_74hc244 U26(
	.A1(4'h0),
	.A2(4'h0),
	.Y1(DB[3:0]),
	.Y2(DB[7:4]),
	.OE1b(BODGE1),
	.OE2b(BODGE1)
);

wire BODGE0;
ttl_74hc244 U25(
	.A1(4'h0),
	.A2(4'h0),
	.Y1(DB[3:0]),
	.Y2(DB[7:4]),
	.OE1b(BODGE0),
	.OE2b(BODGE0)
);

wire SIGN_R2;
wire LAMP_TEMP;
wire SIGN_R1;
wire LAMP_RESTART;
wire LAMP_OPR_ERR;
wire LAMP_COMP_ACTY;
wire INT_INHIBIT;
wire FLASH_CS;
wire GPIO_LOAD;
ttl_74hct574 U5(
	.D(DB[7:0]),
	.Q({FLASH_CS, INT_INHIBIT, LAMP_COMP_ACTY, LAMP_OPR_ERR, LAMP_RESTART, SIGN_R1, LAMP_TEMP, SIGN_R2}),
	.Load(GPIO_LOAD),
	.OEb(1'b0)
);

always @(posedge LAMP_RESTART) $display("RESTART");
always @(posedge LAMP_OPR_ERR) $display("OPERATOR ERROR");
always @(posedge INT_INHIBIT) $display("INTERRUPT INHIBIT SET");
always @(negedge INT_INHIBIT) $display("INTERRUPT INHIBIT CLEAR");
always @(negedge LAMP_RESTART) booted <= 1;

ttl_74hct574 U30(
	.D(DB[15:8]),
	.Q(),
	.Load(GPIO_LOAD),
	.OEb(1'b0)
);

wire V3_INTERRUPT;
wire LED;
wire SDO;
tri0 SDI;
wire SCK_FLASH;
awawawawa CPLD(
	.IORb(V3_nIOR),
	.IOWb(V3_nIOW),
	.RPULSE(1'b0),
	.RD0(1'b0),
	.RD1(1'b0),
	.RPULSE_OUT(),
	.RD0_OUT(),
	.RD1_OUT(),
	.RCHECK(1'b0),
	.BDIR(BDIR),
	.bus(V3_DB),
	.KEY_CLEARb(KEY_CLEARb),
	.GPIO_LOAD(GPIO_LOAD),
	.GPIO_READb(GPIO_READb),
	.INT_INHIBIT(INT_INHIBIT),
	.I({V3_I8, V3_I7, V3_I6, V3_I5}),
	.SSEL_R1(),
	.R1_SEGS(),
	.R2_SEGS(),
	
	.SDO(SDO),
	.SDI(SDI),
	.SCK_FLASH(SCK_FLASH),
	.SCK_LED1(),
	
	.SID_CEb(),
	.INTERRUPT(V3_INTERRUPT),
	.LED(LED),
	.BODGE0(BODGE0),
	.BODGE1(BODGE1),
	
	.clk(V3_clockin),
	
	.TEMP(1'b0)
);

tri1 io2;
tri1 io3;
spiflash flash(
	.csb(FLASH_CS),
	.clk(SCK_FLASH),
	.io0(SDO),
	.io1(SDI),
	.io2(io2),
	.io3(io3)
);

endmodule
