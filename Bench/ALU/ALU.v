
module ALU
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
   inout ALU_ISS,
   inout CLK,
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
   inout IS_RSU,
   inout nALU_R,
   inout nRST
);


   wire plus5V;
   assign plus5V = 1;
   wire plus6V;
   assign plus6V = 1;
   wire ALU_M;
   wire ALU_S0;
   wire ALU_S1;
   wire ALU_S2;
   wire ALU_S3;
   wire A_A0;
   wire A_A1;
   wire A_A2;
   wire A_A3;
   wire A_A4;
   wire A_A5;
   wire A_A6;
   wire A_A7;
   wire A_A8;
   wire A_A9;
   wire A_A10;
   wire A_A11;
   wire A_A12;
   wire A_A13;
   wire A_A14;
   wire A_A15;
   wire A_A16;
   wire A_A17;
   wire A_A18;
   wire A_A19;
   wire A_A20;
   wire A_A21;
   wire A_A22;
   wire A_A23;
   wire A_A24;
   wire A_A25;
   wire A_B0;
   wire A_B1;
   wire A_B2;
   wire A_B3;
   wire A_B4;
   wire A_B5;
   wire A_B6;
   wire A_B7;
   wire A_B8;
   wire A_B9;
   wire A_B10;
   wire A_B11;
   wire A_B12;
   wire A_B13;
   wire A_B14;
   wire A_B15;
   wire A_B16;
   wire A_B17;
   wire A_B18;
   wire A_B19;
   wire A_B20;
   wire A_B21;
   wire A_B22;
   wire A_B23;
   wire A_B24;
   wire A_B25;
   wire A_R0;
   wire A_R1;
   wire A_R2;
   wire A_R3;
   wire A_R4;
   wire A_R5;
   wire A_R6;
   wire A_R7;
   wire A_R8;
   wire A_R9;
   wire A_R10;
   wire A_R11;
   wire A_R12;
   wire A_R13;
   wire A_R14;
   wire A_R15;
   wire A_R16;
   wire A_R17;
   wire A_R18;
   wire A_R19;
   wire A_R20;
   wire A_R21;
   wire A_R22;
   wire A_R23;
   wire A_R24;
   wire A_R25;
   wire GND;
   assign GND = 0;
   wire IS_NOT_RSU;
   wire Net__D1_A_;
   wire Net__D2_A_;
   wire Net__D3_K_;
   wire Net__R1_Pad1_;
   wire Net__R2_Pad1_;
   wire Net__U1_Pad11_;
   wire Net__U16_Cnplus4_;
   wire Net__U17_Cn_;
   wire Net__U17_Cnplus4_;
   wire Net__U19_Cnplus4_;
   wire Net__U20_Cnplus4_;
   wire Net__U21_Cnplus4_;
   tri0 Net__U22_A2_;
   wire Net__U22_Ax3dB_;
   wire Net__U22_F2_;
   wire Net__U23_Pad11_;
   wire Net__U24_Pad3_;
   wire Net__U24_Pad6_;
   wire Net__U25_Pad12_;
   wire Net__U27_Pad12_;
   wire Net__U40_Za_;
   wire Net__U40_Zb_;
   wire Net__U40_Zc_;
   wire Net__U40_Zd_;
   wire Net__U41_Za_;
   wire Net__U41_Zb_;
   wire Net__U41_Zc_;
   wire Net__U41_Zd_;
   wire Net__U43_Za_;
   wire Net__U43_Zb_;
   wire Net__U43_Zc_;
   wire Net__U43_Zd_;
   wire Net__U44_Za_;
   wire Net__U44_Zb_;
   wire Net__U44_Zc_;
   wire Net__U44_Zd_;
   wire Net__U46_Za_;
   wire Net__U46_Zb_;
   wire Net__U46_Zc_;
   wire Net__U46_Zd_;
   wire Net__U47_Za_;
   wire Net__U47_Zb_;
   wire Net__U47_Zc_;
   wire Net__U47_Zd_;
   wire Net__U49_Za_;
   wire Net__U49_Zb_;
   wire Net__U49_Zc_;
   wire Net__U49_Zd_;
   wire Net__U50_Q6_;
   wire SHIFT_S0;
   wire SHIFT_S1;
   wire S_RES0;
   wire S_RES1;
   wire S_RES2;
   wire S_RES3;
   wire S_RES4;
   wire S_RES5;
   wire S_RES6;
   wire S_RES7;
   wire S_RES8;
   wire S_RES9;
   wire S_RES10;
   wire S_RES11;
   wire S_RES12;
   wire S_RES13;
   wire S_RES14;
   wire S_RES15;
   wire S_RES16;
   wire S_RES17;
   wire S_RES18;
   wire S_RES19;
   wire S_RES20;
   wire S_RES21;
   wire S_RES22;
   wire S_RES23;
   wire S_RES24;
   wire S_RES25;
   wire unconnected__U8_Zc_Pad9_;
   wire unconnected__U8_Zd_Pad12_;
   wire unconnected__U15_Zc_Pad9_;
   wire unconnected__U15_Zd_Pad12_;
   wire unconnected__U16_Ax3dB_Pad14_;
   wire unconnected__U16_X_Pad15_;
   wire unconnected__U16_Y_Pad17_;
   wire unconnected__U17_Ax3dB_Pad14_;
   wire unconnected__U17_X_Pad15_;
   wire unconnected__U17_Y_Pad17_;
   wire unconnected__U18_Ax3dB_Pad14_;
   wire unconnected__U18_X_Pad15_;
   wire unconnected__U18_Y_Pad17_;
   wire unconnected__U19_Ax3dB_Pad14_;
   wire unconnected__U19_X_Pad15_;
   wire unconnected__U19_Y_Pad17_;
   wire unconnected__U20_Ax3dB_Pad14_;
   wire unconnected__U20_X_Pad15_;
   wire unconnected__U20_Y_Pad17_;
   wire unconnected__U21_Ax3dB_Pad14_;
   wire unconnected__U21_X_Pad15_;
   wire unconnected__U21_Y_Pad17_;
   wire unconnected__U22_Cnplus4_Pad16_;
   wire unconnected__U22_F3_Pad13_;
   wire unconnected__U22_X_Pad15_;
   wire unconnected__U22_Y_Pad17_;
   wire unconnected__U50_Q2_Pad17_;
   wire unconnected__U50_Q3_Pad16_;
   wire unconnected__U50_Q4_Pad15_;
   wire unconnected__U50_Q5_Pad14_;
   wire unconnected__U50_Q7_Pad12_;
   wire nALU_C;
   wire nI0;
   wire nI1;
   wire nI2;
   wire nI3;
   wire nSHIFT_EN;


   ALU_D1 _D1(GND, Net__D1_A_);

   ALU_D2 _D2(GND, Net__D2_A_);

   ALU_D3 _D3(Net__D3_K_, plus5V);

   ALU_J1 _J1(A0, A13, A1, A14, GND, A15, A2, A16, A3, A17, A4, GND, A5, A18,
    A6, A19, A7, A20, GND, A21, A8, A22, A9, A23, A10, GND, A11, A24, A12,
    A25);

   ALU_J2 _J2(GND, plus5V, DB0, DB21, DB1, DB22, DB2, DB23, DB3, DB24, DB4,
    DB25, DB5, I0, DB6, I1, DB7, I2, DB8, I3, DB9, I4, DB10, I5, DB11, I6, DB12,
    I7, DB13, I8, DB14, I9, DB15, I10, DB16, I11, DB17, I12, DB18, CLK, DB19,
    plus6V, DB20, nRST);

   ALU_J3 _J3(GND, IS_RSU, GND, nALU_R, GND, ALU_ISS, GND, GND);

   ALU_R1 _R1(Net__R1_Pad1_, Net__D1_A_);

   ALU_R2 _R2(Net__R2_Pad1_, Net__D2_A_);

   ALU_R4 _R4(Net__U49_Zd_, Net__D3_K_);

   ALU_TP1 _TP1(Net__U50_Q6_);

   ALU_U1 _U1(I0, nI0, I1, nI1, I2, nI2, nI3, I3, nSHIFT_EN, Net__U1_Pad11_,
    IS_NOT_RSU, IS_RSU);

   ALU_U2 _U2(IS_RSU, A0, DB0, A_A0, A1, DB1, A_A1, A_A2, DB2, A2, A_A3, DB3,
    A3, GND);

   ALU_U3 _U3(IS_RSU, A4, DB4, A_A4, A5, DB5, A_A5, A_A6, DB6, A6, A_A7, DB7,
    A7, GND);

   ALU_U4 _U4(IS_RSU, A8, DB8, A_A8, A9, DB9, A_A9, A_A10, DB10, A10, A_A11,
    DB11, A11, GND);

   ALU_U5 _U5(IS_RSU, A12, DB12, A_A12, A13, DB13, A_A13, A_A14, DB14, A14,
    A_A15, DB15, A15, GND);

   ALU_U6 _U6(IS_RSU, A16, DB16, A_A16, A17, DB17, A_A17, A_A18, DB18, A18,
    A_A19, DB19, A19, GND);

   ALU_U7 _U7(IS_RSU, A20, DB20, A_A20, A21, DB21, A_A21, A_A22, DB22, A22,
    A_A23, DB23, A23, GND);

   ALU_U8 _U8(IS_RSU, A24, DB24, A_A24, A25, DB25, A_A25,
    unconnected__U8_Zc_Pad9_, plus5V, GND, unconnected__U8_Zd_Pad12_, plus5V, GND,
    GND);

   ALU_U9 _U9(IS_NOT_RSU, A0, DB0, A_B0, A1, DB1, A_B1, A_B2, DB2, A2, A_B3,
    DB3, A3, GND);

   ALU_U10 _U10(IS_NOT_RSU, A4, DB4, A_B4, A5, DB5, A_B5, A_B6, DB6, A6, A_B7,
    DB7, A7, GND);

   ALU_U11 _U11(IS_NOT_RSU, A8, DB8, A_B8, A9, DB9, A_B9, A_B10, DB10, A10,
    A_B11, DB11, A11, GND);

   ALU_U12 _U12(IS_NOT_RSU, A12, DB12, A_B12, A13, DB13, A_B13, A_B14, DB14,
    A14, A_B15, DB15, A15, GND);

   ALU_U13 _U13(IS_NOT_RSU, A16, DB16, A_B16, A17, DB17, A_B17, A_B18, DB18,
    A18, A_B19, DB19, A19, GND);

   ALU_U14 _U14(IS_NOT_RSU, A20, DB20, A_B20, A21, DB21, A_B21, A_B22, DB22,
    A22, A_B23, DB23, A23, GND);

   ALU_U15 _U15(IS_NOT_RSU, A24, DB24, A_B24, A25, DB25, A_B25,
    unconnected__U15_Zc_Pad9_, plus5V, GND, unconnected__U15_Zd_Pad12_, plus5V,
    GND, GND);

   ALU_U16 _U16(A_B0, A_A0, ALU_S3, ALU_S2, ALU_S1, ALU_S0, nALU_C, ALU_M, A_R0,
    A_R1, A_R2, A_R3, unconnected__U16_Ax3dB_Pad14_, unconnected__U16_X_Pad15_,
    Net__U16_Cnplus4_, unconnected__U16_Y_Pad17_, A_B3, A_A3, A_B2, A_A2, A_B1,
    A_A1);

   ALU_U17 _U17(A_B8, A_A8, ALU_S3, ALU_S2, ALU_S1, ALU_S0, Net__U17_Cn_, ALU_M,
    A_R8, A_R9, A_R10, A_R11, unconnected__U17_Ax3dB_Pad14_,
    unconnected__U17_X_Pad15_, Net__U17_Cnplus4_, unconnected__U17_Y_Pad17_, A_B11,
    A_A11, A_B10, A_A10, A_B9, A_A9);

   ALU_U18 _U18(A_B4, A_A4, ALU_S3, ALU_S2, ALU_S1, ALU_S0, Net__U16_Cnplus4_,
    ALU_M, A_R4, A_R5, A_R6, A_R7, unconnected__U18_Ax3dB_Pad14_,
    unconnected__U18_X_Pad15_, Net__U17_Cn_, unconnected__U18_Y_Pad17_, A_B7, A_A7,
    A_B6, A_A6, A_B5, A_A5);

   ALU_U19 _U19(A_B12, A_A12, ALU_S3, ALU_S2, ALU_S1, ALU_S0, Net__U17_Cnplus4_,
    ALU_M, A_R12, A_R13, A_R14, A_R15, unconnected__U19_Ax3dB_Pad14_,
    unconnected__U19_X_Pad15_, Net__U19_Cnplus4_, unconnected__U19_Y_Pad17_, A_B15,
    A_A15, A_B14, A_A14, A_B13, A_A13);

   ALU_U20 _U20(A_B16, A_A16, ALU_S3, ALU_S2, ALU_S1, ALU_S0, Net__U19_Cnplus4_,
    ALU_M, A_R16, A_R17, A_R18, A_R19, unconnected__U20_Ax3dB_Pad14_,
    unconnected__U20_X_Pad15_, Net__U20_Cnplus4_, unconnected__U20_Y_Pad17_, A_B19,
    A_A19, A_B18, A_A18, A_B17, A_A17);

   ALU_U21 _U21(A_B20, A_A20, ALU_S3, ALU_S2, ALU_S1, ALU_S0, Net__U20_Cnplus4_,
    ALU_M, A_R20, A_R21, A_R22, A_R23, unconnected__U21_Ax3dB_Pad14_,
    unconnected__U21_X_Pad15_, Net__U21_Cnplus4_, unconnected__U21_Y_Pad17_, A_B23,
    A_A23, A_B22, A_A22, A_B21, A_A21);

   ALU_U22 _U22(A_B24, A_A24, ALU_S3, ALU_S2, ALU_S1, ALU_S0, Net__U21_Cnplus4_,
    ALU_M, A_R24, A_R25, Net__U22_F2_, unconnected__U22_F3_Pad13_, Net__U22_Ax3dB_,
    unconnected__U22_X_Pad15_, unconnected__U22_Cnplus4_Pad16_,
    unconnected__U22_Y_Pad17_, Net__U22_A2_, Net__U22_A2_, Net__U22_A2_,
    Net__U22_A2_, A_B25, A_A25);

   ALU_U23 _U23(I0, nI3, nALU_C, I2, nI3, ALU_S0, ALU_S3, I1, I2,
    Net__U23_Pad11_, nI0, I2);

   ALU_U24 _U24(I3, I1, Net__U24_Pad3_, nI1, nI2, Net__U24_Pad6_, Net__R1_Pad1_,
    Net__U22_F2_, plus5V, Net__R2_Pad1_, Net__U22_Ax3dB_, plus5V);

   ALU_U25 _U25(nI0, I3, ALU_S1, nI1, nI2, ALU_S2, Net__U25_Pad12_,
    Net__U23_Pad11_, Net__U24_Pad3_, ALU_M, Net__U25_Pad12_,
    Net__U24_Pad6_);

   ALU_U26 _U26(nSHIFT_EN, SHIFT_S1, A1, A2, GND, GND, S_RES0, S_RES1, GND, A0,
    A3, A2, SHIFT_S0, nSHIFT_EN);

   ALU_U27 _U27(I5, I9, SHIFT_S0, I6, I5, SHIFT_S1, Net__U27_Pad12_, I10,
    SHIFT_S1, Net__U1_Pad11_, Net__U27_Pad12_, SHIFT_S0);

   ALU_U28 _U28(nSHIFT_EN, SHIFT_S1, A3, A4, A1, A0, S_RES2, S_RES3, A1, A2, A5,
    A4, SHIFT_S0, nSHIFT_EN);

   ALU_U29 _U29(nSHIFT_EN, SHIFT_S1, A5, A6, A3, A2, S_RES4, S_RES5, A3, A4, A7,
    A6, SHIFT_S0, nSHIFT_EN);

   ALU_U30 _U30(nSHIFT_EN, SHIFT_S1, A7, A8, A5, A4, S_RES6, S_RES7, A5, A6, A9,
    A8, SHIFT_S0, nSHIFT_EN);

   ALU_U31 _U31(nSHIFT_EN, SHIFT_S1, A9, A10, A7, A6, S_RES8, S_RES9, A7, A8,
    A11, A10, SHIFT_S0, nSHIFT_EN);

   ALU_U32 _U32(nSHIFT_EN, SHIFT_S1, A11, A12, A9, A8, S_RES10, S_RES11, A9,
    A10, A13, A12, SHIFT_S0, nSHIFT_EN);

   ALU_U33 _U33(nSHIFT_EN, SHIFT_S1, A13, A14, A11, A10, S_RES12, S_RES13, A11,
    A12, A15, A14, SHIFT_S0, nSHIFT_EN);

   ALU_U34 _U34(nSHIFT_EN, SHIFT_S1, A15, A16, A13, A12, S_RES14, S_RES15, A13,
    A14, A17, A16, SHIFT_S0, nSHIFT_EN);

   ALU_U35 _U35(nSHIFT_EN, SHIFT_S1, A17, A18, A15, A14, S_RES16, S_RES17, A15,
    A16, A19, A18, SHIFT_S0, nSHIFT_EN);

   ALU_U36 _U36(nSHIFT_EN, SHIFT_S1, A19, A20, A17, A16, S_RES18, S_RES19, A17,
    A18, A21, A20, SHIFT_S0, nSHIFT_EN);

   ALU_U37 _U37(nSHIFT_EN, SHIFT_S1, A21, A22, A19, A18, S_RES20, S_RES21, A19,
    A20, A23, A22, SHIFT_S0, nSHIFT_EN);

   ALU_U38 _U38(nSHIFT_EN, SHIFT_S1, A23, A24, A21, A20, S_RES22, S_RES23, A21,
    A22, A25, A24, SHIFT_S0, nSHIFT_EN);

   ALU_U39 _U39(nSHIFT_EN, SHIFT_S1, A25, A25, A23, A22, S_RES24, S_RES25, A23,
    A24, A25, A25, SHIFT_S0, nSHIFT_EN);

   ALU_U40 _U40(ALU_ISS, A_R0, S_RES0, Net__U40_Za_, A_R1, S_RES1, Net__U40_Zb_,
    Net__U40_Zc_, S_RES2, A_R2, Net__U40_Zd_, S_RES3, A_R3, GND);

   ALU_U41 _U41(ALU_ISS, A_R4, S_RES4, Net__U41_Za_, A_R5, S_RES5, Net__U41_Zb_,
    Net__U41_Zc_, S_RES6, A_R6, Net__U41_Zd_, S_RES7, A_R7, GND);

   ALU_U42 _U42(nALU_R, Net__U40_Za_, Net__U40_Zb_, Net__U40_Zc_, Net__U40_Zd_,
    Net__U41_Za_, Net__U41_Zb_, Net__U41_Zc_, Net__U41_Zd_, CLK, DB7, DB6, DB5,
    DB4, DB3, DB2, DB1, DB0);

   ALU_U43 _U43(ALU_ISS, A_R8, S_RES8, Net__U43_Za_, A_R9, S_RES9, Net__U43_Zb_,
    Net__U43_Zc_, S_RES10, A_R10, Net__U43_Zd_, S_RES11, A_R11, GND);

   ALU_U44 _U44(ALU_ISS, A_R12, S_RES12, Net__U44_Za_, A_R13, S_RES13,
    Net__U44_Zb_, Net__U44_Zc_, S_RES14, A_R14, Net__U44_Zd_, S_RES15, A_R15,
    GND);

   ALU_U45 _U45(nALU_R, Net__U43_Za_, Net__U43_Zb_, Net__U43_Zc_, Net__U43_Zd_,
    Net__U44_Za_, Net__U44_Zb_, Net__U44_Zc_, Net__U44_Zd_, CLK, DB15, DB14, DB13,
    DB12, DB11, DB10, DB9, DB8);

   ALU_U46 _U46(ALU_ISS, A_R16, S_RES16, Net__U46_Za_, A_R17, S_RES17,
    Net__U46_Zb_, Net__U46_Zc_, S_RES18, A_R18, Net__U46_Zd_, S_RES19, A_R19,
    GND);

   ALU_U47 _U47(ALU_ISS, A_R20, S_RES20, Net__U47_Za_, A_R21, S_RES21,
    Net__U47_Zb_, Net__U47_Zc_, S_RES22, A_R22, Net__U47_Zd_, S_RES23, A_R23,
    GND);

   ALU_U48 _U48(nALU_R, Net__U46_Za_, Net__U46_Zb_, Net__U46_Zc_, Net__U46_Zd_,
    Net__U47_Za_, Net__U47_Zb_, Net__U47_Zc_, Net__U47_Zd_, CLK, DB23, DB22, DB21,
    DB20, DB19, DB18, DB17, DB16);

   ALU_U49 _U49(ALU_ISS, A_R24, S_RES24, Net__U49_Za_, A_R25, S_RES25,
    Net__U49_Zb_, Net__U49_Zc_, GND, plus5V, Net__U49_Zd_, GND, plus5V,
    GND);

   ALU_U50 _U50(nALU_R, Net__U49_Za_, Net__U49_Zb_, Net__U49_Zc_, Net__U49_Zd_,
    GND, GND, GND, GND, CLK, unconnected__U50_Q7_Pad12_, Net__U50_Q6_,
    unconnected__U50_Q5_Pad14_, unconnected__U50_Q4_Pad15_,
    unconnected__U50_Q3_Pad16_, unconnected__U50_Q2_Pad17_, DB25, DB24);


endmodule


module ALU_D1(
   inout K,
   inout A);

endmodule

module ALU_D2(
   inout K,
   inout A);

endmodule

module ALU_D3(
   inout K,
   inout A);

endmodule

module ALU_J1(
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

module ALU_J2(
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

module ALU_J3(
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

module ALU_R1(
   inout _1,
   inout _2);

assign _1 = _2;

endmodule

module ALU_R2(
   inout _1,
   inout _2);

assign _1 = _2;

endmodule

module ALU_R4(
   inout _1,
   inout _2);

assign _1 = _2;

endmodule

module ALU_TP1(
   inout _1);

endmodule

module ALU_U1(
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

ttl_74hct04 U1({_1, _3, _5, _9, _11, _13}, {_2, _4, _6, _8, _10, _12});

endmodule

module ALU_U2(
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

module ALU_U3(
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

module ALU_U4(
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

module ALU_U5(
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

module ALU_U6(
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

module ALU_U7(
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

ttl_74hct157 U7({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U8(
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

module ALU_U9(
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

module ALU_U10(
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

module ALU_U11(
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

ttl_74hct157 U11({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U12(
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

ttl_74hct157 U12({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U13(
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

module ALU_U14(
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

ttl_74hct157 U14({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U15(
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

ttl_74hct157 U15({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U16(
   input B0,
   input A0,
   input S3,
   input S2,
   input S1,
   input S0,
   input Cn,
   input M,
   output F0,
   output F1,
   output F2,
   output F3,
   output Ax3dB,
   output X,
   output Cnplus4,
   output Y,
   input B3,
   input A3,
   input B2,
   input A2,
   input B1,
   input A1);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}
   `define S {S3, S2, S1, S0}
   `define F {F3, F2, F1, F0}

ttl_74ls181 U16({A3, A2, A1, A0}, {B3, B2, B1, B0}, {S3, S2, S1, S0}, M, Cn, {F3, F2, F1, F0}, Cnplus4, Ax3dB, Y, X);

   `undef B
   `undef A
   `undef S
   `undef F

endmodule

module ALU_U17(
   input B0,
   input A0,
   input S3,
   input S2,
   input S1,
   input S0,
   input Cn,
   input M,
   output F0,
   output F1,
   output F2,
   output F3,
   output Ax3dB,
   output X,
   output Cnplus4,
   output Y,
   input B3,
   input A3,
   input B2,
   input A2,
   input B1,
   input A1);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}
   `define S {S3, S2, S1, S0}
   `define F {F3, F2, F1, F0}

ttl_74ls181 U17({A3, A2, A1, A0}, {B3, B2, B1, B0}, {S3, S2, S1, S0}, M, Cn, {F3, F2, F1, F0}, Cnplus4, Ax3dB, Y, X);

   `undef B
   `undef A
   `undef S
   `undef F

endmodule

module ALU_U18(
   input B0,
   input A0,
   input S3,
   input S2,
   input S1,
   input S0,
   input Cn,
   input M,
   output F0,
   output F1,
   output F2,
   output F3,
   output Ax3dB,
   output X,
   output Cnplus4,
   output Y,
   input B3,
   input A3,
   input B2,
   input A2,
   input B1,
   input A1);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}
   `define S {S3, S2, S1, S0}
   `define F {F3, F2, F1, F0}

ttl_74ls181 U18({A3, A2, A1, A0}, {B3, B2, B1, B0}, {S3, S2, S1, S0}, M, Cn, {F3, F2, F1, F0}, Cnplus4, Ax3dB, Y, X);

   `undef B
   `undef A
   `undef S
   `undef F

endmodule

module ALU_U19(
   input B0,
   input A0,
   input S3,
   input S2,
   input S1,
   input S0,
   input Cn,
   input M,
   output F0,
   output F1,
   output F2,
   output F3,
   output Ax3dB,
   output X,
   output Cnplus4,
   output Y,
   input B3,
   input A3,
   input B2,
   input A2,
   input B1,
   input A1);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}
   `define S {S3, S2, S1, S0}
   `define F {F3, F2, F1, F0}

ttl_74ls181 U19({A3, A2, A1, A0}, {B3, B2, B1, B0}, {S3, S2, S1, S0}, M, Cn, {F3, F2, F1, F0}, Cnplus4, Ax3dB, Y, X);

   `undef B
   `undef A
   `undef S
   `undef F

endmodule

module ALU_U20(
   input B0,
   input A0,
   input S3,
   input S2,
   input S1,
   input S0,
   input Cn,
   input M,
   output F0,
   output F1,
   output F2,
   output F3,
   output Ax3dB,
   output X,
   output Cnplus4,
   output Y,
   input B3,
   input A3,
   input B2,
   input A2,
   input B1,
   input A1);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}
   `define S {S3, S2, S1, S0}
   `define F {F3, F2, F1, F0}

ttl_74ls181 U20({A3, A2, A1, A0}, {B3, B2, B1, B0}, {S3, S2, S1, S0}, M, Cn, {F3, F2, F1, F0}, Cnplus4, Ax3dB, Y, X);

   `undef B
   `undef A
   `undef S
   `undef F

endmodule

module ALU_U21(
   input B0,
   input A0,
   input S3,
   input S2,
   input S1,
   input S0,
   input Cn,
   input M,
   output F0,
   output F1,
   output F2,
   output F3,
   output Ax3dB,
   output X,
   output Cnplus4,
   output Y,
   input B3,
   input A3,
   input B2,
   input A2,
   input B1,
   input A1);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}
   `define S {S3, S2, S1, S0}
   `define F {F3, F2, F1, F0}

ttl_74ls181 U21({A3, A2, A1, A0}, {B3, B2, B1, B0}, {S3, S2, S1, S0}, M, Cn, {F3, F2, F1, F0}, Cnplus4, Ax3dB, Y, X);

   `undef B
   `undef A
   `undef S
   `undef F

endmodule

module ALU_U22(
   input B0,
   input A0,
   input S3,
   input S2,
   input S1,
   input S0,
   input Cn,
   input M,
   output F0,
   output F1,
   output F2,
   output F3,
   output Ax3dB,
   output X,
   output Cnplus4,
   output Y,
   input B3,
   input A3,
   input B2,
   input A2,
   input B1,
   input A1);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define B {B3, B2, B1, B0}
   `define A {A3, A2, A1, A0}
   `define S {S3, S2, S1, S0}
   `define F {F3, F2, F1, F0}

ttl_74ls181 U22({A3, A2, A1, A0}, {B3, B2, B1, B0}, {S3, S2, S1, S0}, M, Cn, {F3, F2, F1, F0}, Cnplus4, Ax3dB, Y, X);

   `undef B
   `undef A
   `undef S
   `undef F

endmodule

module ALU_U23(
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

ttl_74hct08 U23(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module ALU_U24(
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

module ALU_U25(
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

ttl_74hct32 U25(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module ALU_U26(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U26({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U27(
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

ttl_74hct32 U27(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module ALU_U28(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U28({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U29(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U29({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U30(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U30({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U31(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U31({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U32(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U32({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U33(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U33({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U34(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U34({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U35(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U35({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U36(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U36({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U37(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U37({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U38(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U38({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U39(
   input Ea,
   input S1,
   input I3a,
   input I2a,
   input I1a,
   input I0a,
   output Za,
   output Zb,
   input I0b,
   input I1b,
   input I2b,
   input I3b,
   input S0,
   input Eb);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define S {S1, S0}

ttl_74hct153 U39({S1, S0}, Eb, Ea, {I3b, I2b, I1b, I0b}, {I3a, I2a, I1a, I0a}, Zb, Za);

   `undef S

endmodule

module ALU_U40(
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

ttl_74hct157 U40({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U41(
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

module ALU_U42(
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

ttl_74hct574 U42(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module ALU_U43(
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

module ALU_U44(
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

module ALU_U45(
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

ttl_74hct574 U45(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module ALU_U46(
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

ttl_74hct157 U46({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U47(
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

ttl_74hct157 U47({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U48(
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

ttl_74hct574 U48(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

module ALU_U49(
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

ttl_74hct157 U49({I1d, I0d}, {I1c, I0c}, {I1b, I0b}, {I1a, I0a}, S, E, {Zd, Zc, Zb, Za});

endmodule

module ALU_U50(
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

ttl_74hct574 U50(`D, `Q, Load, OE);

   `undef D
   `undef Q

endmodule

