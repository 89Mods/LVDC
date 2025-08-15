
module Registers
(
   inout A0,
   inout A1,
   inout A10,
   inout A11,
   inout A12,
   inout A13,
   inout A14,
   inout A15,
   inout A16,
   inout A17,
   inout A18,
   inout A19,
   inout A2,
   inout A20,
   inout A21,
   inout A22,
   inout A23,
   inout A24,
   inout A25,
   inout A3,
   inout A4,
   inout A5,
   inout A6,
   inout A7,
   inout A8,
   inout A9,
   inout ACCUM_ZERO,
   inout ACCW,
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
   inout GND,
   inout HOPW,
   inout HOP_DM0,
   inout HOP_DM1,
   inout HOP_DM2,
   inout HOP_DS0,
   inout HOP_DS1,
   inout HOP_DS2,
   inout HOP_DS3,
   inout HOP_IM0,
   inout HOP_IM1,
   inout HOP_IM2,
   inout HOP_IP0,
   inout HOP_IP1,
   inout HOP_IP2,
   inout HOP_IP3,
   inout HOP_IP4,
   inout HOP_IP5,
   inout HOP_IP6,
   inout HOP_IP7,
   inout HOP_IS0,
   inout HOP_IS1,
   inout HOP_IS2,
   inout HOP_IS3,
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
   inout TRA,
   inout nRST,
   inout nR_A,
   inout nR_H
);


   wire plus5V;
   assign plus5V = 1;
   wire plus6V;
   assign plus6V = 1;
   wire BUFF_A0;
   wire BUFF_A1;
   wire BUFF_A2;
   wire BUFF_A3;
   wire BUFF_A4;
   wire BUFF_A5;
   wire BUFF_A6;
   wire BUFF_A7;
   wire BUFF_A8;
   wire BUFF_A9;
   wire BUFF_A10;
   wire BUFF_A11;
   wire BUFF_A12;
   wire BUFF_A13;
   wire BUFF_A14;
   wire BUFF_A15;
   wire BUFF_A16;
   wire BUFF_A17;
   wire BUFF_A18;
   wire BUFF_A19;
   wire BUFF_A20;
   wire BUFF_A21;
   wire BUFF_A22;
   wire BUFF_A23;
   wire BUFF_A24;
   wire BUFF_A25;
   wire HOP_15;
   wire HOP_DATA_SM;
   wire HOP_INSTR_SM;
   wire INCPC_ACTUAL;
   wire INC_IP0;
   wire INC_IP1;
   wire INC_IP2;
   wire INC_IP3;
   wire INC_IP4;
   wire INC_IP5;
   wire INC_IP6;
   wire NEXT_HOP_CYL;
   wire NEXT_HOP_DATA_SM;
   wire NEXT_HOP_DM0;
   wire NEXT_HOP_DM1;
   wire NEXT_HOP_DM2;
   wire NEXT_HOP_DS0;
   wire NEXT_HOP_DS1;
   wire NEXT_HOP_DS2;
   wire NEXT_HOP_DS3;
   wire NEXT_HOP_IP0;
   wire NEXT_HOP_IP1;
   wire NEXT_HOP_IP2;
   wire NEXT_HOP_IP3;
   wire NEXT_HOP_IP4;
   wire NEXT_HOP_IP5;
   wire NEXT_HOP_IP6;
   wire NEXT_HOP_IP7;
   wire Net__D1_K_;
   wire Net__D2_A_;
   tri0 Net__D2_K_;
   wire Net__D3_K_;
   wire Net__D4_K_;
   wire Net__D5_K_;
   wire Net__D6_A_;
   tri0 Net__D6_K_;
   tri0 Net__D7_K_;
   wire Net__D8_A_;
   wire Net__D9_A_;
   wire Net__D10_A_;
   tri0 Net__D10_K_;
   wire Net__D11_A_;
   wire Net__D12_A_;
   wire Net__D13_A_;
   wire Net__D14_A_;
   wire Net__D15_A_;
   wire Net__U1_D0_;
   wire Net__U1_D1_;
   wire Net__U1_D2_;
   wire Net__U1_D3_;
   wire Net__U1_D4_;
   wire Net__U1_D5_;
   wire Net__U1_D6_;
   wire Net__U1_D7_;
   wire Net__U5_Za_;
   wire Net__U5_Zb_;
   wire Net__U5_Zc_;
   wire Net__U5_Zd_;
   wire Net__U6_Za_;
   wire Net__U6_Zb_;
   wire Net__U6_Zc_;
   wire Net__U6_Zd_;
   wire Net__U10_Za_;
   wire Net__U10_Zb_;
   wire Net__U10_Zc_;
   wire Net__U10_Zd_;
   wire Net__U11_D0_;
   wire Net__U11_D1_;
   wire Net__U11_D2_;
   wire Net__U11_D3_;
   wire Net__U13_Za_;
   wire Net__U13_Zb_;
   wire Net__U13_Zc_;
   wire Net__U16_D0_;
   wire Net__U16_D1_;
   wire Net__U16_D2_;
   wire Net__U16_D3_;
   wire Net__U16_D4_;
   wire Net__U16_D5_;
   wire Net__U16_D6_;
   wire Net__U16_D7_;
   wire Net__U17_D0_;
   wire Net__U17_D1_;
   wire Net__U17_D2_;
   wire Net__U17_D3_;
   wire Net__U17_D4_;
   wire Net__U17_D5_;
   wire Net__U17_D6_;
   wire Net__U17_D7_;
   wire Net__U18_D0_;
   wire Net__U18_D1_;
   wire Net__U18_D2_;
   wire Net__U18_D3_;
   wire Net__U18_D4_;
   wire Net__U18_D5_;
   wire Net__U18_D6_;
   wire Net__U18_D7_;
   wire Net__U19A_D_;
   wire Net__U19B_D_;
   wire Net__U26_Zd_;
   wire Net__U27_Pad4_;
   wire Net__U27_Pad9_;
   wire Net__U27_Pad12_;
   wire Net__U28_Pad2_;
   wire Net__U28_Pad4_;
   wire Net__U28_Pad9_;
   wire Net__U28_Pad12_;
   wire Net__U31A_D_;
   wire Net__U31A_nQ_;
   wire Net__U31B_D_;
   wire Net__U31B_Q_;
   wire Net__U32_Pad6_;
   wire Net__U32_Pad10_;
   wire Net__U36_Q3_;
   wire Net__U37_Px3dR_;
   wire Net__U38_Px3dR_;
   wire Net__U39_Px3dR_;
   wire Net__U40_Px3dR_;
   wire Net__U43_I0a_;
   wire RST;
   wire unconnected__U13_Zd_Pad12_;
   wire unconnected__U14A_nQ_Pad6_;
   wire unconnected__U14B_nQ_Pad8_;
   wire unconnected__U15_1Y2_Pad14_;
   wire unconnected__U15_2Y2_Pad7_;
   wire unconnected__U15_2Y3_Pad9_;
   wire unconnected__U19A_nQ_Pad6_;
   wire unconnected__U19B_nQ_Pad8_;
   wire unconnected__U26_Zc_Pad9_;
   wire unconnected__U31A_Q_Pad5_;
   wire unconnected__U36_Q1_Pad18_;
   wire unconnected__U36_Q2_Pad17_;
   wire unconnected__U36_Q4_Pad15_;
   wire unconnected__U36_Q6_Pad13_;
   wire unconnected__U36_Q7_Pad12_;
   wire unconnected__U43_Zb_Pad7_;
   wire unconnected__U43_Zd_Pad12_;


   Registers_D1 _D1(Net__D1_K_, plus5V);

   Registers_D2 _D2(Net__D2_K_, Net__D2_A_);

   Registers_D3 _D3(Net__D3_K_, plus5V);

   Registers_D4 _D4(Net__D4_K_, plus5V);

   Registers_D5 _D5(Net__D5_K_, plus5V);

   Registers_D6 _D6(Net__D6_K_, Net__D6_A_);

   Registers_D7 _D7(Net__D7_K_, CDS);

   Registers_D8 _D8(Net__D10_K_, Net__D8_A_);

   Registers_D9 _D9(Net__D10_K_, Net__D9_A_);

   Registers_D10 _D10(Net__D10_K_, Net__D10_A_);

   Registers_D11 _D11(Net__D10_K_, Net__D11_A_);

   Registers_D12 _D12(Net__D10_K_, Net__D12_A_);

   Registers_D13 _D13(Net__D10_K_, Net__D13_A_);

   Registers_D14 _D14(Net__D10_K_, Net__D14_A_);

   Registers_D15 _D15(Net__D10_K_, Net__D15_A_);

   Registers_J1 _J1(GND, plus5V, DB0, DB21, DB1, DB22, DB2, DB23, DB3, DB24,
    DB4, DB25, DB5, I0, DB6, I1, DB7, I2, DB8, I3, DB9, I4, DB10, I5, DB11, I6,
    DB12, I7, DB13, I8, DB14, I9, DB15, I10, DB16, I11, DB17, I12, DB18, CLK, DB19,
    plus6V, DB20, nRST);

   Registers_J2 _J2(A0, A13, A1, A14, GND, A15, A2, A16, A3, A17, A4, GND, A5,
    A18, A6, A19, A7, A20, GND, A21, A8, A22, A9, A23, A10, GND, A11, A24, A12,
    A25);
    
    wire bodge = HOPW || TRA;

   Registers_J3 _J3(ACCW, A25, nR_A, ACCUM_ZERO, CDS, GND, TRA, CSYLLABLE,
    INCPC, bodge, nR_H, HOPW);

   Registers_J4 _J4(HOP_IP0, HOP_IM0, HOP_IP1, HOP_IM1, HOP_IP2, HOP_IM2,
    HOP_IP3, HOP_IS0, HOP_IP4, HOP_IS1, HOP_IP5, HOP_IS2, HOP_IP6, HOP_IS3,
    HOP_IP7, HOP_DS0, GND, HOP_DS1, HOP_DM0, HOP_DS2, HOP_DM1, HOP_DS3, HOP_DM2,
    GND);

   Registers_J5 _J5(BUFF_A0, HOP_15, BUFF_A1, GND, BUFF_A2, GND, BUFF_A3,
    ACCUM_ZERO, BUFF_A4, BUFF_A25, BUFF_A5, BUFF_A24, BUFF_A6, BUFF_A23, BUFF_A7,
    BUFF_A22, BUFF_A8, BUFF_A21, BUFF_A9, BUFF_A20, BUFF_A10, BUFF_A19, BUFF_A11,
    BUFF_A18, BUFF_A12, BUFF_A17, BUFF_A13, BUFF_A16, BUFF_A14,
    BUFF_A15);

   Registers_R1 _R1(Net__U13_Zc_, Net__D1_K_);

   Registers_R3 _R3(Net__U26_Zd_, Net__D3_K_);

   Registers_R4 _R4(Net__U36_Q3_, Net__D4_K_);

   Registers_R5 _R5(Net__U31B_Q_, Net__D5_K_);

   Registers_U1 _U1(GND, Net__U1_D0_, Net__U1_D1_, Net__U1_D2_, Net__U1_D3_,
    Net__U1_D4_, Net__U1_D5_, Net__U1_D6_, Net__U1_D7_, CLK, A7, A6, A5, A4, A3,
    A2, A1, A0);

   Registers_U2 _U2(ACCW, A0, DB0, Net__U1_D0_, A1, DB1, Net__U1_D1_,
    Net__U1_D2_, DB2, A2, Net__U1_D3_, DB3, A3, GND);

   Registers_U3 _U3(ACCW, A4, DB4, Net__U1_D4_, A5, DB5, Net__U1_D5_,
    Net__U1_D6_, DB6, A6, Net__U1_D7_, DB7, A7, GND);

   Registers_U4 _U4(nR_A, A0, DB4, A1, DB5, A2, DB6, A3, DB7, A7, DB3, A6, DB2,
    A5, DB1, A4, DB0, nR_A);

   Registers_U5 _U5(ACCW, A8, DB8, Net__U5_Za_, A9, DB9, Net__U5_Zb_,
    Net__U5_Zc_, DB10, A10, Net__U5_Zd_, DB11, A11, GND);

   Registers_U6 _U6(ACCW, A12, DB12, Net__U6_Za_, A13, DB13, Net__U6_Zb_,
    Net__U6_Zc_, DB14, A14, Net__U6_Zd_, DB15, A15, GND);

   Registers_U7 _U7(GND, Net__U5_Za_, Net__U5_Zb_, Net__U5_Zc_, Net__U5_Zd_,
    Net__U6_Za_, Net__U6_Zb_, Net__U6_Zc_, Net__U6_Zd_, CLK, A15, A14, A13, A12,
    A11, A10, A9, A8);

   Registers_U8 _U8(nR_A, A8, DB12, A9, DB13, A10, DB14, A11, DB15, A15, DB11,
    A14, DB10, A13, DB9, A12, DB8, nR_A);

   Registers_U9 _U9(ACCW, A16, DB16, Net__U11_D0_, A17, DB17, Net__U11_D1_,
    Net__U11_D2_, DB18, A18, Net__U11_D3_, DB19, A19, GND);

   Registers_U10 _U10(ACCW, A20, DB20, Net__U10_Za_, A21, DB21, Net__U10_Zb_,
    Net__U10_Zc_, DB22, A22, Net__U10_Zd_, DB23, A23, GND);

   Registers_U11 _U11(GND, Net__U11_D0_, Net__U11_D1_, Net__U11_D2_,
    Net__U11_D3_, Net__U10_Za_, Net__U10_Zb_, Net__U10_Zc_, Net__U10_Zd_, CLK, A23,
    A22, A21, A20, A19, A18, A17, A16);

   Registers_U12 _U12(nR_A, A16, DB20, A17, DB21, A18, DB22, A19, DB23, A23,
    DB19, A22, DB18, A21, DB17, A20, DB16, nR_A);

   Registers_U13 _U13(ACCW, A24, DB24, Net__U13_Za_, A25, DB25, Net__U13_Zb_,
    Net__U13_Zc_, GND, plus5V, unconnected__U13_Zd_Pad12_, GND, plus5V,
    GND);

   Registers_U14 _U14(nRST, Net__U13_Za_, CLK, plus5V, A24,
    unconnected__U14A_nQ_Pad6_, unconnected__U14B_nQ_Pad8_, A25, plus5V, CLK,
    Net__U13_Zb_, nRST);

   Registers_U15 _U15(nR_A, A24, BUFF_A24, A25, BUFF_A25, plus6V,
    unconnected__U15_2Y2_Pad7_, plus6V, unconnected__U15_2Y3_Pad9_, GND,
    Net__D2_A_, GND, unconnected__U15_1Y2_Pad14_, A25, DB25, A24, DB24,
    GND);

   Registers_U16 _U16(GND, Net__U16_D0_, Net__U16_D1_, Net__U16_D2_,
    Net__U16_D3_, Net__U16_D4_, Net__U16_D5_, Net__U16_D6_, Net__U16_D7_, CLK,
    HOP_IP0, CSYLLABLE, HOP_IS3, HOP_IS2, HOP_IS1, HOP_IS0, HOP_IM2,
    HOP_IM1);

   Registers_U17 _U17(GND, Net__U17_D0_, Net__U17_D1_, Net__U17_D2_,
    Net__U17_D3_, Net__U17_D4_, Net__U17_D5_, Net__U17_D6_, Net__U17_D7_, CLK,
    HOP_15, HOP_IP7, HOP_IP6, HOP_IP5, HOP_IP4, HOP_IP3, HOP_IP2,
    HOP_IP1);

   Registers_U18 _U18(GND, Net__U18_D0_, Net__U18_D1_, Net__U18_D2_,
    Net__U18_D3_, Net__U18_D4_, Net__U18_D5_, Net__U18_D6_, Net__U18_D7_, CLK,
    HOP_DS3, HOP_DS2, HOP_DS1, HOP_DS0, HOP_DM2, HOP_DM1, HOP_DM0,
    HOP_DATA_SM);

   Registers_U19 _U19(plus5V, Net__U19A_D_, CLK, plus5V, HOP_INSTR_SM,
    unconnected__U19A_nQ_Pad6_, unconnected__U19B_nQ_Pad8_, HOP_IM0, plus5V, CLK,
    Net__U19B_D_, plus5V);

   Registers_U20 _U20(HOPW, HOP_IM1, DB0, Net__U16_D0_, HOP_IM2, DB1,
    Net__U16_D1_, Net__U16_D2_, DB2, HOP_IS0, Net__U16_D3_, DB3, HOP_IS1,
    RST);

   Registers_U21 _U21(HOPW, HOP_IS2, DB4, Net__U16_D4_, HOP_IS3, DB5,
    Net__U16_D5_, Net__U16_D6_, DB6, NEXT_HOP_CYL, Net__U16_D7_, DB7, NEXT_HOP_IP0,
    RST);

   Registers_U22 _U22(HOPW, NEXT_HOP_IP1, DB8, Net__U17_D0_, NEXT_HOP_IP2, DB9,
    Net__U17_D1_, Net__U17_D2_, DB10, NEXT_HOP_IP3, Net__U17_D3_, DB11,
    NEXT_HOP_IP4, RST);

   Registers_U23 _U23(HOPW, NEXT_HOP_IP5, DB12, Net__U17_D4_, NEXT_HOP_IP6,
    DB13, Net__U17_D5_, Net__U17_D6_, DB14, NEXT_HOP_IP7, Net__U17_D7_, DB15,
    HOP_15, RST);

   Registers_U24 _U24(HOPW, NEXT_HOP_DATA_SM, DB16, Net__U18_D0_, NEXT_HOP_DM0,
    DB17, Net__U18_D1_, Net__U18_D2_, DB18, NEXT_HOP_DM1, Net__U18_D3_, DB19,
    NEXT_HOP_DM2, RST);

   Registers_U25 _U25(HOPW, NEXT_HOP_DS0, DB20, Net__U18_D4_, NEXT_HOP_DS1,
    DB21, Net__U18_D5_, Net__U18_D6_, DB22, NEXT_HOP_DS2, Net__U18_D7_, DB23,
    NEXT_HOP_DS3, RST);

   Registers_U26 _U26(HOPW, HOP_INSTR_SM, DB24, Net__U19A_D_, HOP_IM0, DB25,
    Net__U19B_D_, unconnected__U26_Zc_Pad9_, GND, plus5V, Net__U26_Zd_, GND,
    plus5V, RST);

   Registers_U27 _U27(INCPC_ACTUAL, HOP_IP0, INC_IP0, Net__U27_Pad4_, HOP_IP2,
    INC_IP2, INC_IP1, Net__U27_Pad9_, HOP_IP1, INC_IP3, Net__U27_Pad12_,
    HOP_IP3);

   Registers_U28 _U28(HOP_IP4, Net__U28_Pad2_, INC_IP4, Net__U28_Pad4_, HOP_IP5,
    INC_IP5, INC_IP6, Net__U28_Pad9_, HOP_IP6, Net__U43_I0a_, Net__U28_Pad12_,
    HOP_IP7);

   Registers_U29 _U29(Net__U27_Pad9_, HOP_IP1, Net__U27_Pad4_, Net__U27_Pad4_,
    HOP_IP2, Net__U27_Pad12_, Net__U28_Pad2_, Net__U27_Pad12_, HOP_IP3,
    Net__U28_Pad4_, HOP_IP4, Net__U28_Pad2_);

   Registers_U30 _U30(HOP_IP5, Net__U28_Pad4_, Net__U28_Pad9_, Net__U28_Pad9_,
    HOP_IP6, Net__U28_Pad12_, INCPC_ACTUAL, Net__U31A_nQ_, INCPC, Net__U27_Pad9_,
    INCPC_ACTUAL, HOP_IP0);

   Registers_U31 _U31(nRST, Net__U31A_D_, CLK, plus5V,
    unconnected__U31A_Q_Pad5_, Net__U31A_nQ_, ACCUM_ZERO, Net__U31B_Q_, plus5V,
    CLK, Net__U31B_D_, plus5V);

   Registers_U32 _U32(HOPW, TRA, Net__U31A_D_, Net__U38_Px3dR_, Net__U37_Px3dR_,
    Net__U32_Pad6_, Net__U31B_D_, Net__U32_Pad6_, Net__U32_Pad10_, Net__U32_Pad10_,
    Net__U39_Px3dR_, Net__U40_Px3dR_);

   Registers_U33 _U33(nR_H, HOP_IM1, HOP_IM2, HOP_IS0, HOP_IS1, HOP_IS2,
    HOP_IS3, CSYLLABLE, HOP_IP0, bodge, DB7, DB6, DB5, DB4, DB3, DB2, DB1,
    DB0);

   Registers_U34 _U34(nR_H, HOP_IP1, HOP_IP2, HOP_IP3, HOP_IP4, HOP_IP5,
    HOP_IP6, HOP_IP7, HOP_15, bodge, DB15, DB14, DB13, DB12, DB11, DB10, DB9,
    DB8);

   Registers_U35 _U35(nR_H, HOP_DATA_SM, HOP_DM0, HOP_DM1, HOP_DM2, HOP_DS0,
    HOP_DS1, HOP_DS2, HOP_DS3, bodge, DB23, DB22, DB21, DB20, DB19, DB18, DB17,
    DB16);

   Registers_U36 _U36(nR_H, HOP_INSTR_SM, GND, GND, GND, GND, HOP_IM0, plus6V,
    plus6V, bodge, unconnected__U36_Q7_Pad12_, unconnected__U36_Q6_Pad13_, DB25,
    unconnected__U36_Q4_Pad15_, Net__U36_Q3_, unconnected__U36_Q2_Pad17_,
    unconnected__U36_Q1_Pad18_, DB24);

   Registers_U37 _U37(GND, A0, GND, A1, GND, A2, GND, A3, GND, A4, GND, A5, GND,
    A6, GND, A7, GND, Net__U37_Px3dR_);

   Registers_U38 _U38(GND, A8, GND, A9, GND, A10, GND, A11, GND, A12, GND, A13,
    GND, A14, GND, A15, GND, Net__U38_Px3dR_);

   Registers_U39 _U39(GND, A16, GND, A17, GND, A18, GND, A19, GND, A20, GND,
    A21, GND, A22, GND, A23, GND, Net__U39_Px3dR_);

   Registers_U40 _U40(GND, A24, GND, A25, GND, plus5V, plus5V, plus5V, plus5V,
    plus5V, plus5V, plus5V, plus5V, plus5V, plus5V, plus5V, plus5V,
    Net__U40_Px3dR_);

   Registers_U41 _U41(TRA, CSYLLABLE, I4, NEXT_HOP_CYL, INC_IP0, I5,
    NEXT_HOP_IP0, NEXT_HOP_IP1, I6, INC_IP1, NEXT_HOP_IP2, I7, INC_IP2,
    GND);

   Registers_U42 _U42(TRA, INC_IP3, I8, NEXT_HOP_IP3, INC_IP4, I9, NEXT_HOP_IP4,
    NEXT_HOP_IP5, I10, INC_IP5, NEXT_HOP_IP6, I11, INC_IP6, GND);

   Registers_U43 _U43(TRA, Net__U43_I0a_, I12, NEXT_HOP_IP7, GND, plus5V,
    unconnected__U43_Zb_Pad7_, Net__D6_A_, plus5V, GND, unconnected__U43_Zd_Pad12_,
    plus5V, GND, GND);

   Registers_U44 _U44(CDS, HOP_DATA_SM, I5, NEXT_HOP_DATA_SM, HOP_DM0, I6,
    NEXT_HOP_DM0, NEXT_HOP_DM1, I7, HOP_DM1, NEXT_HOP_DM2, I8, HOP_DM2,
    GND);

   Registers_U45 _U45(CDS, HOP_DS0, I9, NEXT_HOP_DS0, HOP_DS1, I10,
    NEXT_HOP_DS1, NEXT_HOP_DS2, I11, HOP_DS2, NEXT_HOP_DS3, I12, HOP_DS3,
    GND);

   Registers_U46 _U46(GND, A0, BUFF_A4, A1, BUFF_A5, A2, BUFF_A6, A3, BUFF_A7,
    A7, BUFF_A3, A6, BUFF_A2, A5, BUFF_A1, A4, BUFF_A0, GND);

   Registers_U47 _U47(GND, A8, BUFF_A12, A9, BUFF_A13, A10, BUFF_A14, A11,
    BUFF_A15, A15, BUFF_A11, A14, BUFF_A10, A13, BUFF_A9, A12, BUFF_A8,
    GND);

   Registers_U48 _U48(GND, A16, BUFF_A20, A17, BUFF_A21, A18, BUFF_A22, A19,
    BUFF_A23, A23, BUFF_A19, A22, BUFF_A18, A21, BUFF_A17, A20, BUFF_A16,
    GND);

   Registers_U49 _U49(GND, HOP_IP0, Net__D12_A_, HOP_IP1, Net__D13_A_, HOP_IP2,
    Net__D14_A_, HOP_IP3, Net__D15_A_, HOP_IP7, Net__D11_A_, HOP_IP6, Net__D10_A_,
    HOP_IP5, Net__D9_A_, HOP_IP4, Net__D8_A_, GND);

   Registers_U50 _U50(nRST, RST);


endmodule


module Registers_D1(
   inout K,
   inout A);

endmodule

module Registers_D2(
   inout K,
   inout A);

endmodule

module Registers_D3(
   inout K,
   inout A);

endmodule

module Registers_D4(
   inout K,
   inout A);

endmodule

module Registers_D5(
   inout K,
   inout A);

endmodule

module Registers_D6(
   inout K,
   inout A);

endmodule

module Registers_D7(
   inout K,
   inout A);

endmodule

module Registers_D8(
   inout K,
   inout A);

endmodule

module Registers_D9(
   inout K,
   inout A);

endmodule

module Registers_D10(
   inout K,
   inout A);

endmodule

module Registers_D11(
   inout K,
   inout A);

endmodule

module Registers_D12(
   inout K,
   inout A);

endmodule

module Registers_D13(
   inout K,
   inout A);

endmodule

module Registers_D14(
   inout K,
   inout A);

endmodule

module Registers_D15(
   inout K,
   inout A);

endmodule

module Registers_J1(
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

module Registers_J2(
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
   inout Pin_30);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define Pin_ {Pin_30, Pin_29, Pin_28, Pin_27, Pin_26, Pin_25, Pin_24, Pin_23, Pin_22, Pin_21, Pin_20, Pin_19, Pin_18, Pin_17, Pin_16, Pin_15, Pin_14, Pin_13, Pin_12, Pin_11, Pin_10, Pin_9, Pin_8, Pin_7, Pin_6, Pin_5, Pin_4, Pin_3, Pin_2, Pin_1}

   `undef Pin_

endmodule

module Registers_J3(
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

module Registers_J4(
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
   inout Pin_24);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define Pin_ {Pin_24, Pin_23, Pin_22, Pin_21, Pin_20, Pin_19, Pin_18, Pin_17, Pin_16, Pin_15, Pin_14, Pin_13, Pin_12, Pin_11, Pin_10, Pin_9, Pin_8, Pin_7, Pin_6, Pin_5, Pin_4, Pin_3, Pin_2, Pin_1}

   `undef Pin_

endmodule

module Registers_J5(
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
   inout Pin_30);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define Pin_ {Pin_30, Pin_29, Pin_28, Pin_27, Pin_26, Pin_25, Pin_24, Pin_23, Pin_22, Pin_21, Pin_20, Pin_19, Pin_18, Pin_17, Pin_16, Pin_15, Pin_14, Pin_13, Pin_12, Pin_11, Pin_10, Pin_9, Pin_8, Pin_7, Pin_6, Pin_5, Pin_4, Pin_3, Pin_2, Pin_1}

   `undef Pin_

endmodule

module Registers_R1(
   inout _1,
   inout _2);

assign _1 = _2;

endmodule

module Registers_R3(
   inout _1,
   inout _2);

assign _1 = _2;

endmodule

module Registers_R4(
   inout _1,
   inout _2);

assign _1 = _2;

endmodule

module Registers_R5(
   inout _1,
   inout _2);

assign _1 = _2;

endmodule

module Registers_U1(
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

module Registers_U2(
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

ttl_74hct157 U2({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U3(
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

module Registers_U4(
   input _1OE,
   input _1A0,
   inout _2Y0,
   input _1A1,
   inout _2Y1,
   input _1A2,
   inout _2Y2,
   input _1A3,
   inout _2Y3,
   input _2A3,
   inout _1Y3,
   input _2A2,
   inout _1Y2,
   input _2A1,
   inout _1Y1,
   input _2A0,
   inout _1Y0,
   input _2OE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define _1A {_1A3, _1A2, _1A1, _1A0}
   `define _2Y {_2Y3, _2Y2, _2Y1, _2Y0}
   `define _2A {_2A3, _2A2, _2A1, _2A0}
   `define _1Y {_1Y3, _1Y2, _1Y1, _1Y0}

ttl_74hc244 U4(`_1A, `_2A, `_1Y, `_2Y, _1OE, _2OE);

   `undef _1A
   `undef _2Y
   `undef _2A
   `undef _1Y

endmodule

module Registers_U5(
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

module Registers_U6(
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

module Registers_U7(
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

module Registers_U8(
   input _1OE,
   input _1A0,
   inout _2Y0,
   input _1A1,
   inout _2Y1,
   input _1A2,
   inout _2Y2,
   input _1A3,
   inout _2Y3,
   input _2A3,
   inout _1Y3,
   input _2A2,
   inout _1Y2,
   input _2A1,
   inout _1Y1,
   input _2A0,
   inout _1Y0,
   input _2OE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define _1A {_1A3, _1A2, _1A1, _1A0}
   `define _2Y {_2Y3, _2Y2, _2Y1, _2Y0}
   `define _2A {_2A3, _2A2, _2A1, _2A0}
   `define _1Y {_1Y3, _1Y2, _1Y1, _1Y0}

ttl_74hc244 U8(`_1A, `_2A, `_1Y, `_2Y, _1OE, _2OE);

   `undef _1A
   `undef _2Y
   `undef _2A
   `undef _1Y

endmodule

module Registers_U9(
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

ttl_74hct157 U9({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U10(
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

ttl_74hct157 U10({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U11(
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

ttl_74hct574 U11(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Registers_U12(
   input _1OE,
   input _1A0,
   inout _2Y0,
   input _1A1,
   inout _2Y1,
   input _1A2,
   inout _2Y2,
   input _1A3,
   inout _2Y3,
   input _2A3,
   inout _1Y3,
   input _2A2,
   inout _1Y2,
   input _2A1,
   inout _1Y1,
   input _2A0,
   inout _1Y0,
   input _2OE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define _1A {_1A3, _1A2, _1A1, _1A0}
   `define _2Y {_2Y3, _2Y2, _2Y1, _2Y0}
   `define _2A {_2A3, _2A2, _2A1, _2A0}
   `define _1Y {_1Y3, _1Y2, _1Y1, _1Y0}

ttl_74hc244 U12(`_1A, `_2A, `_1Y, `_2Y, _1OE, _2OE);

   `undef _1A
   `undef _2Y
   `undef _2A
   `undef _1Y

endmodule

module Registers_U13(
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

ttl_74hct157 U13({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U14(
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

ttl_74hc74 U14(D_2, C_3, nS_4, nR_1, Q_5, nQ_6, D_12, C_11, nS_10, nR_13, Q_9, nQ_8);

endmodule

module Registers_U15(
   input _1OE,
   input _1A0,
   inout _2Y0,
   input _1A1,
   inout _2Y1,
   input _1A2,
   inout _2Y2,
   input _1A3,
   inout _2Y3,
   input _2A3,
   inout _1Y3,
   input _2A2,
   inout _1Y2,
   input _2A1,
   inout _1Y1,
   input _2A0,
   inout _1Y0,
   input _2OE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define _1A {_1A3, _1A2, _1A1, _1A0}
   `define _2Y {_2Y3, _2Y2, _2Y1, _2Y0}
   `define _2A {_2A3, _2A2, _2A1, _2A0}
   `define _1Y {_1Y3, _1Y2, _1Y1, _1Y0}

ttl_74hc244 U15(`_1A, `_2A, `_1Y, `_2Y, _1OE, _2OE);

   `undef _1A
   `undef _2Y
   `undef _2A
   `undef _1Y

endmodule

module Registers_U16(
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

ttl_74hct574 U16(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Registers_U17(
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

ttl_74hct574 U17(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Registers_U18(
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

ttl_74hct574 U18(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Registers_U19(
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

module Registers_U20(
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

module Registers_U21(
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

ttl_74hct157 U21({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U22(
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

ttl_74hct157 U22({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U23(
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

ttl_74hct157 U23({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U24(
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

ttl_74hct157 U24({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U25(
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

ttl_74hct157 U25({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U26(
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

ttl_74hct157 U26({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U27(
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

ttl_74hct86 U27(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Registers_U28(
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

ttl_74hct86 U28(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Registers_U29(
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

ttl_74hct08 U29(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Registers_U30(
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

module Registers_U31(
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

ttl_74hc74 U31(D_2, C_3, nS_4, nR_1, Q_5, nQ_6, D_12, C_11, nS_10, nR_13, Q_9, nQ_8);

endmodule

module Registers_U32(
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

ttl_74hct32 U32(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Registers_U33(
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

ttl_74hct574 U33(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Registers_U34(
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

ttl_74hct574 U34(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Registers_U35(
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

ttl_74hct574 U35(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Registers_U36(
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

ttl_74hct574 U36(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module Registers_U37(
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

ttl_74hc688 U37(`P, `R, G, Px3dR);

   `undef P
   `undef R

endmodule

module Registers_U38(
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

ttl_74hc688 U38(`P, `R, G, Px3dR);

   `undef P
   `undef R

endmodule

module Registers_U39(
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

ttl_74hc688 U39(`P, `R, G, Px3dR);

   `undef P
   `undef R

endmodule

module Registers_U40(
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

ttl_74hc688 U40(`P, `R, G, Px3dR);

   `undef P
   `undef R

endmodule

module Registers_U41(
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

ttl_74hct157 U41({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U42(
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

ttl_74hct157 U42({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U43(
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

ttl_74hct157 U43({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U44(
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

ttl_74hct157 U44({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U45(
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

ttl_74hct157 U45({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module Registers_U46(
   input _1OE,
   input _1A0,
   inout _2Y0,
   input _1A1,
   inout _2Y1,
   input _1A2,
   inout _2Y2,
   input _1A3,
   inout _2Y3,
   input _2A3,
   inout _1Y3,
   input _2A2,
   inout _1Y2,
   input _2A1,
   inout _1Y1,
   input _2A0,
   inout _1Y0,
   input _2OE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define _1A {_1A3, _1A2, _1A1, _1A0}
   `define _2Y {_2Y3, _2Y2, _2Y1, _2Y0}
   `define _2A {_2A3, _2A2, _2A1, _2A0}
   `define _1Y {_1Y3, _1Y2, _1Y1, _1Y0}

ttl_74hc244 U46(`_1A, `_2A, `_1Y, `_2Y, _1OE, _2OE);

   `undef _1A
   `undef _2Y
   `undef _2A
   `undef _1Y

endmodule

module Registers_U47(
   input _1OE,
   input _1A0,
   inout _2Y0,
   input _1A1,
   inout _2Y1,
   input _1A2,
   inout _2Y2,
   input _1A3,
   inout _2Y3,
   input _2A3,
   inout _1Y3,
   input _2A2,
   inout _1Y2,
   input _2A1,
   inout _1Y1,
   input _2A0,
   inout _1Y0,
   input _2OE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define _1A {_1A3, _1A2, _1A1, _1A0}
   `define _2Y {_2Y3, _2Y2, _2Y1, _2Y0}
   `define _2A {_2A3, _2A2, _2A1, _2A0}
   `define _1Y {_1Y3, _1Y2, _1Y1, _1Y0}

ttl_74hc244 U47(`_1A, `_2A, `_1Y, `_2Y, _1OE, _2OE);

   `undef _1A
   `undef _2Y
   `undef _2A
   `undef _1Y

endmodule

module Registers_U48(
   input _1OE,
   input _1A0,
   inout _2Y0,
   input _1A1,
   inout _2Y1,
   input _1A2,
   inout _2Y2,
   input _1A3,
   inout _2Y3,
   input _2A3,
   inout _1Y3,
   input _2A2,
   inout _1Y2,
   input _2A1,
   inout _1Y1,
   input _2A0,
   inout _1Y0,
   input _2OE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define _1A {_1A3, _1A2, _1A1, _1A0}
   `define _2Y {_2Y3, _2Y2, _2Y1, _2Y0}
   `define _2A {_2A3, _2A2, _2A1, _2A0}
   `define _1Y {_1Y3, _1Y2, _1Y1, _1Y0}

ttl_74hc244 U48(`_1A, `_2A, `_1Y, `_2Y, _1OE, _2OE);

   `undef _1A
   `undef _2Y
   `undef _2A
   `undef _1Y

endmodule

module Registers_U49(
   input _1OE,
   input _1A0,
   inout _2Y0,
   input _1A1,
   inout _2Y1,
   input _1A2,
   inout _2Y2,
   input _1A3,
   inout _2Y3,
   input _2A3,
   inout _1Y3,
   input _2A2,
   inout _1Y2,
   input _2A1,
   inout _1Y1,
   input _2A0,
   inout _1Y0,
   input _2OE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define _1A {_1A3, _1A2, _1A1, _1A0}
   `define _2Y {_2Y3, _2Y2, _2Y1, _2Y0}
   `define _2A {_2A3, _2A2, _2A1, _2A0}
   `define _1Y {_1Y3, _1Y2, _1Y1, _1Y0}

ttl_74hc244 U49(`_1A, `_2A, `_1Y, `_2Y, _1OE, _2OE);

   `undef _1A
   `undef _2Y
   `undef _2A
   `undef _1Y

endmodule

module Registers_U50(
   input _2,
   output _4);

ttl_74ahc1g04 U50(_2, _4);

endmodule

