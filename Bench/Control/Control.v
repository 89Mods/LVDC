
module Control
(
   inout ACCUM_NEGATIVE,
   inout ACCUM_ZERO,
   inout ACCW,
   inout ALU_ISS,
   inout CDS,
   inout CLK,
   inout CSYLLABLE,
   inout DB0,
   inout DB1,
   inout DB10,
   inout DB11,
   inout DB12,
   inout DB13,
   inout DB14,
   inout DB15,
   inout DB16,
   inout DB17,
   inout DB18,
   inout DB19,
   inout DB2,
   inout DB20,
   inout DB21,
   inout DB22,
   inout DB23,
   inout DB24,
   inout DB25,
   inout DB3,
   inout DB4,
   inout DB5,
   inout DB6,
   inout DB7,
   inout DB8,
   inout DB9,
   inout EXM_EXEC_I,
   inout EXM_SECTOR0,
   inout EXM_SECTOR1,
   inout EXM_SECTOR2,
   inout FETCH_CYC,
   inout GND,
   inout HOPW,
   inout HOP_INSTEAD_OF_A,
   inout H_CYC_1,
   inout I0,
   inout I1,
   inout I10,
   inout I11,
   inout I12,
   inout I2,
   inout I3,
   inout I4,
   inout I5,
   inout I6,
   inout I7,
   inout I8,
   inout I9,
   inout INCPC,
   inout INT_IN,
   inout IS_DIV,
   inout IS_EXM_I,
   inout IS_RSU,
   inout LDX,
   inout LDY,
   inout LDZ,
   inout MD_IS_ACTIVE,
   inout MD_RST,
   inout MD_START,
   inout MEM_RD,
   inout MEM_WR,
   inout OUTPUT_PQ,
   inout PQ_ADDR,
   inout TRA,
   inout irupt,
   inout nALU_R,
   inout nIOR,
   inout nIOW,
   inout nRST,
   inout nR_A,
   inout nR_H
);


   wire plus5V;
   assign plus5V = 1;
   wire plus6V;
   assign plus6V = 1;
   wire HI_SYL;
   wire ICLR;
   wire IRUPT_INHIBIT;
   wire IS_IO_OP;
   wire I_A_CLR;
   wire I_R_0;
   wire I_R_1;
   wire I_R_2;
   wire I_R_3;
   wire I_R_4;
   wire I_R_5;
   wire I_R_6;
   wire I_R_7;
   wire I_R_8;
   wire I_R_9;
   wire I_R_10;
   wire I_R_11;
   wire I_R_12;
   wire MUL_LDX_OR_LDZ;
   wire MUL_LDY_AND_START;
   wire Net__D1_A_;
   tri0 Net__D1_K_;
   wire Net__D2_A_;
   tri0 Net__D2_K_;
   tri0 Net__D3_K_;
   tri1 Net__D4_A_;
   wire Net__D4_K_;
   tri1 Net__D5_A_;
   wire Net__D5_K_;
   wire Net__U1_D0_;
   wire Net__U1_D1_;
   wire Net__U1_D2_;
   wire Net__U1_D3_;
   wire Net__U1_D4_;
   wire Net__U1_D5_;
   wire Net__U1_D6_;
   wire Net__U1_D7_;
   wire Net__U2_Pad2_;
   wire Net__U2_Pad6_;
   wire Net__U2_Pad10_;
   wire Net__U2_Pad11_;
   wire Net__U8_I1c_;
   wire Net__U8_I1d_;
   wire Net__U10_Pad9_;
   wire Net__U10_Pad10_;
   wire Net__U10_Pad12_;
   wire Net__U10_Pad13_;
   wire Net__U11_Pad10_;
   wire Net__U12_IslashO1_;
   wire Net__U12_IslashO4_;
   wire Net__U14_nMR_;
   wire Net__U15_Pad2_;
   wire Net__U15_Pad10_;
   wire Net__U15_Pad12_;
   wire Net__U16_Pad4_;
   wire Net__U16_Pad9_;
   wire Net__U16_Pad10_;
   wire Net__U16_Pad11_;
   wire Net__U16_Pad12_;
   wire Net__U16_Pad13_;
   wire Net__U17_Pad8_;
   wire Net__U17_Pad10_;
   wire Net__U17_Pad12_;
   wire Net__U18A_D_;
   wire Net__U18B_D_;
   wire Net__U19A_D_;
   wire Net__U19B_D_;
   wire Net__U21_Pad6_;
   wire Net__U22_Pad5_;
   wire Net__U22_Pad8_;
   wire Net__U22_Pad10_;
   wire Net__U22_Pad11_;
   wire Net__U23_Pad2_;
   wire Net__U23_Pad4_;
   wire Net__U23_Pad6_;
   wire Net__U23_Pad8_;
   wire Net__U23_Pad10_;
   wire Net__U23_Pad12_;
   wire Net__U24_Pad1_;
   wire Net__U25_Pad12_;
   wire Net__U26A_D_;
   wire Net__U26A_Q_;
   wire Net__U26A_nQ_;
   wire Net__U26B_D_;
   wire Net__U27A_D_;
   wire Net__U27A_nQ_;
   wire Net__U27B_D_;
   wire Net__U30_Pad3_;
   wire Net__U32_Oax3db_;
   wire Net__U33A_D_;
   wire Net__U34_Px3dR_;
   wire Net__U35_Pad11_;
   wire Net__U36_I1a_;
   wire Net__U36_I1b_;
   wire Net__U36_I1c_;
   wire Net__U36_I1d_;
   wire Net__U37_I1a_;
   wire Net__U37_I1b_;
   wire Net__U37_I1c_;
   wire Net__U37_I1d_;
   wire Net__U38_I1a_;
   wire Net__U38_Za_;
   wire Net__U38_Zb_;
   wire Net__U38_Zc_;
   wire Net__U38_Zd_;
   wire Net__U39_Zb_;
   wire RST;
   wire SOME_INT_THING;
   wire STEP_0;
   wire STEP_1;
   wire STEP_2;
   wire STEP_3;
   wire unconnected__U6_Zb_Pad7_;
   wire unconnected__U6_Zc_Pad9_;
   wire unconnected__U7_Q5_Pad14_;
   wire unconnected__U7_Q6_Pad13_;
   wire unconnected__U7_Q7_Pad12_;
   wire unconnected__U14_TC_Pad15_;
   wire unconnected__U18A_nQ_Pad6_;
   wire unconnected__U18B_nQ_Pad8_;
   wire unconnected__U19A_nQ_Pad6_;
   wire unconnected__U19B_nQ_Pad8_;
   wire unconnected__U26B_Q_Pad9_;
   wire unconnected__U28_Pad11_;
   wire unconnected__U29_Pad8_;
   wire unconnected__U31_Oax3cb_Pad7_;
   wire unconnected__U31_Oax3eb_Pad5_;
   wire unconnected__U32_Oax3cb_Pad7_;
   wire unconnected__U32_Oax3eb_Pad5_;
   wire unconnected__U33A_Q_Pad5_;
   wire unconnected__U33B_Q_Pad9_;
   wire unconnected__U33B_nQ_Pad8_;
   wire unconnected__U39_Za_Pad4_;
   wire unconnected__U39_Zc_Pad9_;
   wire unconnected__U39_Zd_Pad12_;
   wire nIRQ_LATCH;
   wire nWAIT;


   Control_D1 _D1(Net__D1_K_, Net__D1_A_);

   Control_D2 _D2(Net__D2_K_, Net__D2_A_);

   Control_D3 _D3(Net__D3_K_, EXM_EXEC_I);

   Control_D4 _D4(Net__D4_K_, Net__D4_A_);

   Control_D5 _D5(Net__D5_K_, Net__D5_A_);

   Control_J1 _J1(GND, plus5V, DB0, DB21, DB1, DB22, DB2, DB23, DB3, DB24, DB4,
    DB25, DB5, I0, DB6, I1, DB7, I2, DB8, I3, DB9, I4, DB10, I5, DB11, I6, DB12,
    I7, DB13, I8, DB14, I9, DB15, I10, DB16, I11, DB17, I12, DB18, CLK, DB19,
    plus6V, DB20, nRST);

   Control_J2 _J2(GND, IS_RSU, GND, nALU_R, GND, ALU_ISS, GND, GND);

   Control_J3 _J3(FETCH_CYC, MEM_WR, GND, MEM_RD, PQ_ADDR, IS_EXM_I, irupt,
    EXM_EXEC_I, HOP_INSTEAD_OF_A, EXM_SECTOR2, EXM_SECTOR0,
    EXM_SECTOR1);

   Control_J4 _J4(ACCW, ACCUM_NEGATIVE, nR_A, ACCUM_ZERO, CDS, GND, TRA,
    CSYLLABLE, INCPC, H_CYC_1, nR_H, HOPW);

   Control_J5 _J5(IS_DIV, OUTPUT_PQ, LDZ, MD_RST, MD_START, LDX, MD_IS_ACTIVE,
    LDY);

   Control_J6 _J6(INT_IN);

   Control_J7 _J7(nIOR);

   Control_J8 _J8(nIOW);

   Control_U1 _U1(GND, Net__U1_D0_, Net__U1_D1_, Net__U1_D2_, Net__U1_D3_,
    Net__U1_D4_, Net__U1_D5_, Net__U1_D6_, Net__U1_D7_, CLK, I7, I6, I5, I4, I3,
    I2, I1, I0);

   Control_U2 _U2(Net__U18A_D_, Net__U2_Pad2_, I_A_CLR, Net__U11_Pad10_,
    IS_EXM_I, Net__U2_Pad6_, RST, nRST, Net__U2_Pad10_, Net__U2_Pad11_, nALU_R,
    Net__U12_IslashO1_);

   Control_U3 _U3(HI_SYL, DB0, DB13, I_R_0, DB1, DB14, I_R_1, I_R_2, DB15, DB2,
    I_R_3, DB16, DB3, GND);

   Control_U4 _U4(HI_SYL, DB4, DB17, I_R_4, DB5, DB18, I_R_5, I_R_6, DB19, DB6,
    I_R_7, DB20, DB7, GND);

   Control_U5 _U5(HI_SYL, DB8, DB21, I_R_8, DB9, DB22, I_R_9, I_R_10, DB23,
    DB10, I_R_11, DB24, DB11, GND);

   Control_U6 _U6(HI_SYL, DB12, DB25, I_R_12, plus5V, GND,
    unconnected__U6_Zb_Pad7_, unconnected__U6_Zc_Pad9_, GND, plus5V, Net__D1_A_,
    GND, plus5V, GND);

   Control_U7 _U7(GND, Net__U38_Za_, Net__U38_Zb_, Net__U38_Zc_, Net__U38_Zd_,
    Net__U39_Zb_, GND, GND, GND, CLK, unconnected__U7_Q7_Pad12_,
    unconnected__U7_Q6_Pad13_, unconnected__U7_Q5_Pad14_, I12, I11, I10, I9,
    I8);

   Control_U8 _U8(IS_EXM_I, I_R_5, I5, Net__U37_I1b_, I_R_6, I6, Net__U37_I1c_,
    Net__U37_I1d_, Net__U8_I1c_, I_R_7, Net__U38_I1a_, Net__U8_I1d_, I_R_8,
    GND);

   Control_U9 _U9(I_R_4, Net__U2_Pad6_, Net__U37_I1a_, HOP_INSTEAD_OF_A,
    Net__U17_Pad8_, Net__U15_Pad10_, Net__U10_Pad12_, CSYLLABLE, Net__U17_Pad10_,
    Net__U10_Pad13_, I9, IS_EXM_I);

   Control_U10 _U10(I_R_7, I7, Net__U8_I1c_, I8, I_R_8, Net__U8_I1d_,
    Net__U18A_D_, Net__U10_Pad9_, Net__U10_Pad10_, HI_SYL, Net__U10_Pad12_,
    Net__U10_Pad13_);

   Control_U11 _U11(I_R_0, Net__U11_Pad10_, Net__U36_I1a_, I_R_1,
    Net__U11_Pad10_, Net__U36_I1b_, Net__U36_I1c_, I_R_2, Net__U11_Pad10_,
    Net__U36_I1d_, I_R_3, Net__U11_Pad10_);

   Control_U12 _U12(I4, I3, I2, I1, I0, STEP_2, STEP_1, STEP_0, IS_RSU,
    Net__U12_IslashO1_, ALU_ISS, GND, ACCW, Net__U12_IslashO4_, H_CYC_1, CDS, HOPW,
    GND, ACCUM_NEGATIVE, GND, plus5V, ACCUM_ZERO, I12, plus5V);

   Control_U13 _U13(I4, I3, I2, I1, I0, STEP_2, STEP_1, STEP_0, TRA, MEM_WR,
    FETCH_CYC, GND, MEM_RD, IS_EXM_I, IS_IO_OP, MUL_LDY_AND_START, MUL_LDX_OR_LDZ,
    GND, ACCUM_NEGATIVE, GND, plus5V, ACCUM_ZERO, I12, plus5V);

   Control_U14 _U14(Net__U14_nMR_, CLK, GND, GND, GND, GND, nWAIT, plus5V,
    plus5V, STEP_3, STEP_2, STEP_1, STEP_0, unconnected__U14_TC_Pad15_);

   Control_U15 _U15(Net__U12_IslashO4_, Net__U15_Pad2_, nR_A,
    Net__U12_IslashO4_, Net__U15_Pad10_, nR_H, Net__U15_Pad2_, Net__U15_Pad10_,
    Net__U15_Pad10_, Net__U14_nMR_, Net__U15_Pad12_, Net__U15_Pad12_);

   Control_U16 _U16(RST, H_CYC_1, Net__U15_Pad12_, Net__U16_Pad4_, I1,
    Net__U16_Pad12_, Net__U16_Pad13_, Net__U16_Pad9_, Net__U16_Pad10_,
    Net__U16_Pad11_, Net__U16_Pad12_, Net__U16_Pad13_);

   Control_U17 _U17(I0, Net__U16_Pad4_, I2, Net__U16_Pad9_, I3, Net__U16_Pad10_,
    Net__U17_Pad8_, Net__U16_Pad11_, Net__U17_Pad10_, IS_EXM_I, Net__U17_Pad12_,
    Net__U27B_D_);

   Control_U18 _U18(nRST, Net__U18A_D_, CLK, plus5V, EXM_EXEC_I,
    unconnected__U18A_nQ_Pad6_, unconnected__U18B_nQ_Pad8_, EXM_SECTOR2, plus5V,
    CLK, Net__U18B_D_, nRST);

   Control_U19 _U19(nRST, Net__U19A_D_, CLK, plus5V, EXM_SECTOR0,
    unconnected__U19A_nQ_Pad6_, unconnected__U19B_nQ_Pad8_, EXM_SECTOR1, plus5V,
    CLK, Net__U19B_D_, nRST);

   Control_U20 _U20(IS_EXM_I, EXM_SECTOR0, I_R_4, Net__U19A_D_, EXM_SECTOR1,
    I_R_5, Net__U19B_D_, Net__U18B_D_, I_R_6, EXM_SECTOR2, Net__D2_A_, GND, plus5V,
    GND);

   Control_U21 _U21(EXM_EXEC_I, Net__U2_Pad10_, Net__U10_Pad9_, EXM_EXEC_I,
    H_CYC_1, Net__U21_Pad6_, Net__U10_Pad10_, IS_EXM_I, Net__U2_Pad11_,
    SOME_INT_THING, Net__U2_Pad2_, FETCH_CYC);

   Control_U22 _U22(FETCH_CYC, Net__U21_Pad6_, Net__U2_Pad11_, PQ_ADDR,
    Net__U22_Pad5_, OUTPUT_PQ, Net__U22_Pad8_, Net__U26A_Q_, Net__U22_Pad10_,
    Net__U22_Pad11_, IRUPT_INHIBIT, Net__U27B_D_);

   Control_U23 _U23(STEP_2, Net__U23_Pad2_, MD_IS_ACTIVE, Net__U23_Pad4_,
    IS_EXM_I, Net__U23_Pad6_, Net__U23_Pad8_, MUL_LDY_AND_START, Net__U23_Pad10_,
    MUL_LDX_OR_LDZ, Net__U23_Pad12_, IS_DIV);

   Control_U24 _U24(Net__U24_Pad1_, Net__U23_Pad2_, MD_RST, STEP_2,
    Net__U24_Pad1_, Net__U22_Pad5_, LDY, Net__U23_Pad8_, MUL_LDX_OR_LDZ,
    Net__U24_Pad1_, MUL_LDY_AND_START, MUL_LDX_OR_LDZ);

   Control_U25 _U25(SOME_INT_THING, Net__U26A_Q_, Net__U27B_D_, Net__U22_Pad8_,
    Net__U17_Pad12_, Net__U26A_D_, Net__U25_Pad12_, Net__U26B_D_, Net__U27A_nQ_,
    Net__U22_Pad10_, Net__U25_Pad12_, nIRQ_LATCH);

   Control_U26 _U26(nRST, Net__U26A_D_, CLK, plus5V, Net__U26A_Q_,
    Net__U26A_nQ_, nIRQ_LATCH, unconnected__U26B_Q_Pad9_, plus5V, CLK,
    Net__U26B_D_, nRST);

   Control_U27 _U27(nRST, Net__U27A_D_, CLK, plus5V, IRUPT_INHIBIT,
    Net__U27A_nQ_, Net__D4_K_, irupt, plus5V, CLK, Net__U27B_D_, nRST);

   Control_U28 _U28(INT_IN, Net__U23_Pad4_, Net__U26B_D_, Net__U22_Pad11_, ICLR,
    Net__U27A_D_, INCPC, Net__U23_Pad6_, H_CYC_1, unconnected__U28_Pad11_,
    Net__U38_Za_, Net__U38_Za_);

   Control_U29 _U29(irupt, Net__U27B_D_, I_A_CLR, Net__U26A_nQ_, Net__U26A_nQ_,
    Net__D5_K_, unconnected__U29_Pad8_, RST, GND, MD_START, LDY, LDY);

   Control_U30 _U30(MUL_LDY_AND_START, Net__U23_Pad10_, Net__U30_Pad3_,
    Net__U23_Pad12_, Net__U30_Pad3_, LDX, LDZ, Net__U30_Pad3_, IS_DIV,
    Net__U33A_D_, MD_IS_ACTIVE, Net__U32_Oax3db_);

   Control_U31 _U31(GND, GND, plus5V, GND, unconnected__U31_Oax3eb_Pad5_,
    IS_DIV, unconnected__U31_Oax3cb_Pad7_, plus5V, I0, plus5V, I1, I2, GND,
    I3);

   Control_U32 _U32(GND, GND, plus5V, GND, unconnected__U32_Oax3eb_Pad5_,
    Net__U32_Oax3db_, unconnected__U32_Oax3cb_Pad7_, plus5V, I0, GND, I1, I2,
    plus5V, I3);

   Control_U33 _U33(nRST, Net__U33A_D_, CLK, plus5V, unconnected__U33A_Q_Pad5_,
    nWAIT, unconnected__U33B_nQ_Pad8_, unconnected__U33B_Q_Pad9_, plus5V, CLK,
    plus5V, nRST);

   Control_U34 _U34(GND, I5, GND, I6, plus5V, I7, GND, I8, plus5V, I9, plus5V,
    I10, GND, I11, GND, I12, GND, Net__U34_Px3dR_);

   Control_U35 _U35(plus5V, Net__U34_Px3dR_, ICLR, IS_IO_OP, Net__U35_Pad11_,
    nIOW, nIOR, I4, IS_IO_OP, Net__U35_Pad11_, I4, I4);

   Control_U36 _U36(FETCH_CYC, I0, Net__U36_I1a_, Net__U1_D0_, I1,
    Net__U36_I1b_, Net__U1_D1_, Net__U1_D2_, Net__U36_I1c_, I2, Net__U1_D3_,
    Net__U36_I1d_, I3, RST);

   Control_U37 _U37(FETCH_CYC, I4, Net__U37_I1a_, Net__U1_D4_, I5,
    Net__U37_I1b_, Net__U1_D5_, Net__U1_D6_, Net__U37_I1c_, I6, Net__U1_D7_,
    Net__U37_I1d_, I7, RST);

   Control_U38 _U38(FETCH_CYC, I8, Net__U38_I1a_, Net__U38_Za_, I9, I_R_9,
    Net__U38_Zb_, Net__U38_Zc_, I_R_10, I10, Net__U38_Zd_, I_R_11, I11,
    RST);

   Control_U39 _U39(FETCH_CYC, I12, I_R_12, unconnected__U39_Za_Pad4_, I12,
    I_R_12, Net__U39_Zb_, unconnected__U39_Zc_Pad9_, plus5V, GND,
    unconnected__U39_Zd_Pad12_, plus5V, GND, RST);


endmodule


module Control_D1(
   inout K,
   inout A);

endmodule

module Control_D2(
   inout K,
   inout A);

endmodule

module Control_D3(
   inout K,
   inout A);

endmodule

module Control_D4(
   inout K,
   inout A);

endmodule

module Control_D5(
   inout K,
   inout A);

endmodule

module Control_J1(
   inout Pin_1,
   inout Pin_2,
   inout Pin_3,
   inout Pin_4,
   inout Pin_5,
   inout Pin_6,
   inout Pin_7,
   inout Pin_8,
   inout Pin_9,
   inout Pin_10,
   inout Pin_11,
   inout Pin_12,
   inout Pin_13,
   inout Pin_14,
   inout Pin_15,
   inout Pin_16,
   inout Pin_17,
   inout Pin_18,
   inout Pin_19,
   inout Pin_20,
   inout Pin_21,
   inout Pin_22,
   inout Pin_23,
   inout Pin_24,
   inout Pin_25,
   inout Pin_26,
   inout Pin_27,
   inout Pin_28,
   inout Pin_29,
   inout Pin_30,
   inout Pin_31,
   inout Pin_32,
   inout Pin_33,
   inout Pin_34,
   inout Pin_35,
   inout Pin_36,
   inout Pin_37,
   inout Pin_38,
   inout Pin_39,
   inout Pin_40,
   inout Pin_41,
   inout Pin_42,
   inout Pin_43,
   inout Pin_44);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define Pin_ {Pin_44, Pin_43, Pin_42, Pin_41, Pin_40, Pin_39, Pin_38, Pin_37, Pin_36, Pin_35, Pin_34, Pin_33, Pin_32, Pin_31, Pin_30, Pin_29, Pin_28, Pin_27, Pin_26, Pin_25, Pin_24, Pin_23, Pin_22, Pin_21, Pin_20, Pin_19, Pin_18, Pin_17, Pin_16, Pin_15, Pin_14, Pin_13, Pin_12, Pin_11, Pin_10, Pin_9, Pin_8, Pin_7, Pin_6, Pin_5, Pin_4, Pin_3, Pin_2, Pin_1}

   `undef Pin_

endmodule

module Control_J2(
   inout Pin_1,
   inout Pin_2,
   inout Pin_3,
   inout Pin_4,
   inout Pin_5,
   inout Pin_6,
   inout Pin_7,
   inout Pin_8);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define Pin_ {Pin_8, Pin_7, Pin_6, Pin_5, Pin_4, Pin_3, Pin_2, Pin_1}

   `undef Pin_

endmodule

module Control_J3(
   inout Pin_1,
   inout Pin_2,
   inout Pin_3,
   inout Pin_4,
   inout Pin_5,
   inout Pin_6,
   inout Pin_7,
   inout Pin_8,
   inout Pin_9,
   inout Pin_10,
   inout Pin_11,
   inout Pin_12);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define Pin_ {Pin_12, Pin_11, Pin_10, Pin_9, Pin_8, Pin_7, Pin_6, Pin_5, Pin_4, Pin_3, Pin_2, Pin_1}

   `undef Pin_

endmodule

module Control_J4(
   inout Pin_1,
   inout Pin_2,
   inout Pin_3,
   inout Pin_4,
   inout Pin_5,
   inout Pin_6,
   inout Pin_7,
   inout Pin_8,
   inout Pin_9,
   inout Pin_10,
   inout Pin_11,
   inout Pin_12);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define Pin_ {Pin_12, Pin_11, Pin_10, Pin_9, Pin_8, Pin_7, Pin_6, Pin_5, Pin_4, Pin_3, Pin_2, Pin_1}

   `undef Pin_

endmodule

module Control_J5(
   inout Pin_1,
   inout Pin_2,
   inout Pin_3,
   inout Pin_4,
   inout Pin_5,
   inout Pin_6,
   inout Pin_7,
   inout Pin_8);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define Pin_ {Pin_8, Pin_7, Pin_6, Pin_5, Pin_4, Pin_3, Pin_2, Pin_1}

   `undef Pin_

endmodule

module Control_J6(
   inout Pin_1);

endmodule

module Control_J7(
   inout Pin_1);

endmodule

module Control_J8(
   inout Pin_1);

endmodule

module Control_U1(
   input OE,
   input D0,
   input D1,
   input D2,
   input D3,
   input D4,
   input D5,
   input D6,
   input D7,
   input Load,
   inout Q7,
   inout Q6,
   inout Q5,
   inout Q4,
   inout Q3,
   inout Q2,
   inout Q1,
   inout Q0);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define D {D7, D6, D5, D4, D3, D2, D1, D0}
   `define Q {Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0}

ttl_74hct574 U1(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Control_U2(
   input _1,
   output _2,
   input _3,
   output _4,
   input _5,
   output _6,
   output _8,
   input _9,
   output _10,
   input _11,
   output _12,
   input _13);

ttl_74hct04 U2({_1, _3, _5, _9, _11, _13}, {_2, _4, _6, _8, _10, _12});

endmodule

module Control_U3(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U3({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U4(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U4({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U5(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U5({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U6(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U6({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U7(
   input OE,
   input D0,
   input D1,
   input D2,
   input D3,
   input D4,
   input D5,
   input D6,
   input D7,
   input Load,
   inout Q7,
   inout Q6,
   inout Q5,
   inout Q4,
   inout Q3,
   inout Q2,
   inout Q1,
   inout Q0);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define D {D7, D6, D5, D4, D3, D2, D1, D0}
   `define Q {Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0}

ttl_74hct574 U7(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Control_U8(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U8({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U9(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct08 U9(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U10(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct32 U10(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U11(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct08 U11(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U12(
   input A7,
   input A6,
   input A5,
   input A4,
   input A3,
   input A2,
   input A1,
   input A0,
   inout I_O0,
   inout I_O1,
   inout I_O2,
   input GND,
   inout I_O3,
   inout I_O4,
   inout I_O5,
   inout I_O6,
   inout I_O7,
   input nCE,
   input A10,
   input nOE,
   input nWE,
   input A9,
   input A8,
   input Vcc);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}
   `define I_O {I_O7, I_O6, I_O5, I_O4, I_O3, I_O2, I_O1, I_O0}

mem_28C16 U12(`A, nWE, nOE, nCE, `I_O);

   `undef A
   `undef I_O

endmodule

module Control_U13(
   input A7,
   input A6,
   input A5,
   input A4,
   input A3,
   input A2,
   input A1,
   input A0,
   inout I_O0,
   inout I_O1,
   inout I_O2,
   input GND,
   inout I_O3,
   inout I_O4,
   inout I_O5,
   inout I_O6,
   inout I_O7,
   input nCE,
   input A10,
   input nOE,
   input nWE,
   input A9,
   input A8,
   input Vcc);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}
   `define I_O {I_O7, I_O6, I_O5, I_O4, I_O3, I_O2, I_O1, I_O0}

mem_28C16 U13(`A, nWE, nOE, nCE, `I_O);

   `undef A
   `undef I_O

endmodule

module Control_U14(
   input nMR,
   input CP,
   input D0,
   input D1,
   input D2,
   input D3,
   input CEP,
   input nPE,
   input CET,
   output Q3,
   output Q2,
   output Q1,
   output Q0,
   output TC);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define D {D3, D2, D1, D0}
   `define Q {Q3, Q2, Q1, Q0}

ttl_74hct163 U14(`D, nPE, CEP, CET, CP, nMR, `Q, TC);

   `undef D
   `undef Q

endmodule

module Control_U15(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct00 U15(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U16(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct32 U16(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U17(
   input _1,
   output _2,
   input _3,
   output _4,
   input _5,
   output _6,
   output _8,
   input _9,
   output _10,
   input _11,
   output _12,
   input _13);

ttl_74hct04 U17({_1, _3, _5, _9, _11, _13}, {_2, _4, _6, _8, _10, _12});

endmodule

module Control_U18(
   input nR_1,
   input D_2,
   input C_3,
   input nS_4,
   output Q_5,
   output nQ_6,
   output nQ_8,
   output Q_9,
   input nS_10,
   input C_11,
   input D_12,
   input nR_13);

ttl_74hc74 U18(D_2, C_3, nS_4, nR_1, Q_5, nQ_6, D_12, C_11, nS_10, nR_13, Q_9, nQ_8);

endmodule

module Control_U19(
   input nR_1,
   input D_2,
   input C_3,
   input nS_4,
   output Q_5,
   output nQ_6,
   output nQ_8,
   output Q_9,
   input nS_10,
   input C_11,
   input D_12,
   input nR_13);

ttl_74hc74 U19(D_2, C_3, nS_4, nR_1, Q_5, nQ_6, D_12, C_11, nS_10, nR_13, Q_9, nQ_8);

endmodule

module Control_U20(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U20({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U21(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct08 U21(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U22(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct32 U22(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U23(
   input _1,
   output _2,
   input _3,
   output _4,
   input _5,
   output _6,
   output _8,
   input _9,
   output _10,
   input _11,
   output _12,
   input _13);

ttl_74hct04 U23({_1, _3, _5, _9, _11, _13}, {_2, _4, _6, _8, _10, _12});

endmodule

module Control_U24(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct08 U24(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U25(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct08 U25(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U26(
   input nR_1,
   input D_2,
   input C_3,
   input nS_4,
   output Q_5,
   output nQ_6,
   output nQ_8,
   output Q_9,
   input nS_10,
   input C_11,
   input D_12,
   input nR_13);

ttl_74hc74 U26(D_2, C_3, nS_4, nR_1, Q_5, nQ_6, D_12, C_11, nS_10, nR_13, Q_9, nQ_8);

endmodule

module Control_U27(
   input nR_1,
   input D_2,
   input C_3,
   input nS_4,
   output Q_5,
   output nQ_6,
   output nQ_8,
   output Q_9,
   input nS_10,
   input C_11,
   input D_12,
   input nR_13);

ttl_74hc74 U27(D_2, C_3, nS_4, nR_1, Q_5, nQ_6, D_12, C_11, nS_10, nR_13, Q_9, nQ_8);

endmodule

module Control_U28(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct08 U28(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U29(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct32 U29(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U30(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct08 U30(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U31(
   input B3,
   input Iax3cb,
   input Iax3db,
   input Iax3eb,
   output Oax3eb,
   output Oax3db,
   output Oax3cb,
   input B0,
   input A0,
   input B1,
   input A1,
   input A2,
   input B2,
   input A3);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}

ttl_74hc85 U31(`A, `B, Iax3eb, Iax3cb, Iax3db, Oax3eb, Oax3cb, Oax3db);

   `undef B
   `undef A

endmodule

module Control_U32(
   input B3,
   input Iax3cb,
   input Iax3db,
   input Iax3eb,
   output Oax3eb,
   output Oax3db,
   output Oax3cb,
   input B0,
   input A0,
   input B1,
   input A1,
   input A2,
   input B2,
   input A3);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}

ttl_74hc85 U32(`A, `B, Iax3eb, Iax3cb, Iax3db, Oax3eb, Oax3cb, Oax3db);

   `undef B
   `undef A

endmodule

module Control_U33(
   input nR_1,
   input D_2,
   input C_3,
   input nS_4,
   output Q_5,
   output nQ_6,
   output nQ_8,
   output Q_9,
   input nS_10,
   input C_11,
   input D_12,
   input nR_13);

ttl_74hc74 U33(D_2, C_3, nS_4, nR_1, Q_5, nQ_6, D_12, C_11, nS_10, nR_13, Q_9, nQ_8);

endmodule

module Control_U34(
   input G,
   input P0,
   input R0,
   input P1,
   input R1,
   input P2,
   input R2,
   input P3,
   input R3,
   input P4,
   input R4,
   input P5,
   input R5,
   input P6,
   input R6,
   input P7,
   input R7,
   output Px3dR);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define P {P7, P6, P5, P4, P3, P2, P1, P0}
   `define R {R7, R6, R5, R4, R3, R2, R1, R0}

ttl_74hc688 U34(`P, `R, G, Px3dR);

   `undef P
   `undef R

endmodule

module Control_U35(
   input _1,
   input _2,
   output _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   output _11,
   input _12,
   input _13);

ttl_74hct00 U35(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Control_U36(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U36({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U37(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U37({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U38(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U38({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Control_U39(
   input S,
   input I0a,
   input I1a,
   output Za,
   input I0b,
   input I1b,
   output Zb,
   output Zc,
   input I1c,
   input I0c,
   output Zd,
   input I1d,
   input I0d,
   input E);

ttl_74hct157 U39({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

