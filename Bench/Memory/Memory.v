
module Memory
(
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
   inout EXM_EXEC_I,
   inout EXM_SECTOR0,
   inout EXM_SECTOR1,
   inout EXM_SECTOR2,
   inout FETCH_CYC,
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
   inout HOP_INSTEAD_OF_A,
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
   inout IS_EXM_I,
   inout MEM_RD,
   inout MEM_WR,
   inout PQ_ADDR,
   inout irupt,
   inout nRST
);


   wire plus5V;
   assign plus5V = 1;
   wire plus6V;
   assign plus6V = 1;
   wire A0;
   wire A1;
   wire A2;
   wire A3;
   wire A4;
   wire A5;
   wire A6;
   wire A7;
   wire A8;
   wire A9;
   wire A10;
   wire A11;
   wire A12;
   wire A13;
   wire A14;
   wire D_ADDR0;
   wire D_ADDR1;
   wire D_ADDR2;
   wire D_ADDR3;
   wire D_ADDR4;
   wire D_ADDR5;
   wire D_ADDR6;
   wire D_ADDR7;
   wire D_ADDR8;
   wire D_ADDR9;
   wire D_ADDR10;
   wire D_ADDR11;
   wire GND;
   assign GND = 0;
   wire IS_SPECIAL_ADDR;
   wire M0;
   wire M1;
   wire M2;
   wire M3;
   wire M4;
   wire M5;
   wire M6;
   wire M7;
   wire M8;
   wire M9;
   wire M10;
   wire M11;
   wire M12;
   wire M13;
   wire M14;
   wire M15;
   wire M16;
   wire M17;
   wire M18;
   wire M19;
   wire M20;
   wire M21;
   wire M22;
   wire M23;
   tri0 M24;
   tri0 M25;
   tri0 Net__D1_A_;
   tri0 Net__D1_K_;
   wire Net__U1_Pad6_;
   wire Net__U1_Pad8_;
   wire Net__U1_Pad11_;
   wire Net__U2_Pad12_;
   wire Net__U3_Pad8_;
   wire Net__U4_I0a_;
   wire Net__U4_I0b_;
   wire Net__U4_I0c_;
   wire Net__U4_I0d_;
   wire Net__U4_Za_;
   wire Net__U4_Zb_;
   wire Net__U4_Zc_;
   wire Net__U4_Zd_;
   wire Net__U10_S_;
   wire Net__U13_Px3dR_;
   wire Net__U14_Pad5_;
   wire Net__U14_Pad6_;
   wire Net__U14_Pad10_;
   wire Net__U14_Pad13_;
   wire Net__U15_Pad3_;
   wire Net__U15_Pad5_;
   wire Net__U15_Pad12_;
   wire Net__U18_Pad8_;
   wire Net__U18_Pad9_;
   wire Net__U18_Pad11_;
   wire Net__U18_Pad12_;
   wire Net__U19_Pad1_;
   wire Net__U19_Pad13_;
   tri0 Net__U24_IO5_;
   tri0 Net__U24_IO6_;
   tri0 Net__U24_IO7_;
   tri0 Net__U25_IO3_;
   tri0 Net__U25_IO4_;
   tri0 Net__U25_IO6_;
   wire unconnected__U12_Zd_Pad12_;
   wire nIN_RAM;
   wire nIN_ROM;
   wire nIS_EXM_I;
   wire nRD;
   wire nWR;
   wire nirupt;


   Memory_D1 _D1(Net__D1_K_, Net__D1_A_);

   Memory_J1 _J1(FETCH_CYC, MEM_WR, GND, MEM_RD, PQ_ADDR, IS_EXM_I, irupt,
    EXM_EXEC_I, HOP_INSTEAD_OF_A, EXM_SECTOR2, EXM_SECTOR0,
    EXM_SECTOR1);

   Memory_J2 _J2(HOP_IP0, HOP_IM0, HOP_IP1, HOP_IM1, HOP_IP2, HOP_IM2, HOP_IP3,
    HOP_IS0, HOP_IP4, HOP_IS1, HOP_IP5, HOP_IS2, HOP_IP6, HOP_IS3, HOP_IP7,
    HOP_DS0, GND, HOP_DS1, HOP_DM0, HOP_DS2, HOP_DM1, HOP_DS3, HOP_DM2,
    GND);

   Memory_J3 _J3(GND, plus5V, DB0, DB21, DB1, DB22, DB2, DB23, DB3, DB24, DB4,
    DB25, DB5, I0, DB6, I1, DB7, I2, DB8, I3, DB9, I4, DB10, I5, DB11, I6, DB12,
    I7, DB13, I8, DB14, I9, DB15, I10, DB16, I11, DB17, I12, DB18, CLK, DB19,
    plus6V, DB20, nRST);

   Memory_RN1 _RN1(GND, M0, M1, M2, M3, M4, M5, M6, M6);

   Memory_RN2 _RN2(GND, M8, M9, M10, M11, M12, M13, M14, M15);

   Memory_RN3 _RN3(GND, M16, M17, M18, M19, M20, M21, M22, M23);

   Memory_U1 _U1(irupt, HOP_DS0, Net__U4_I0a_, I4, IS_EXM_I, Net__U1_Pad6_,
    Net__U1_Pad8_, I12, IS_EXM_I, Net__U1_Pad11_, GND, A14);

   Memory_U2 _U2(nirupt, HOP_DS1, Net__U4_I0b_, nirupt, HOP_DS2, Net__U4_I0c_,
    Net__U4_I0d_, nirupt, HOP_DS3, Net__U18_Pad9_, Net__U2_Pad12_,
    Net__U1_Pad6_);

   Memory_U3 _U3(irupt, nirupt, EXM_EXEC_I, Net__U2_Pad12_, IS_EXM_I, nIS_EXM_I,
    Net__U3_Pad8_, Net__U13_Px3dR_, Net__U14_Pad5_, D_ADDR1, Net__U14_Pad13_,
    FETCH_CYC);

   Memory_U4 _U4(EXM_EXEC_I, Net__U4_I0a_, EXM_SECTOR1, Net__U4_Za_,
    Net__U4_I0b_, EXM_SECTOR2, Net__U4_Zb_, Net__U4_Zc_, plus5V, Net__U4_I0c_,
    Net__U4_Zd_, EXM_SECTOR0, Net__U4_I0d_, GND);

   Memory_U5 _U5(Net__U4_Za_, Net__U19_Pad13_, D_ADDR8, Net__U4_Zb_,
    Net__U19_Pad13_, D_ADDR9, D_ADDR10, Net__U4_Zc_, Net__U19_Pad13_, D_ADDR11,
    Net__U4_Zd_, Net__U19_Pad13_);

   Memory_U6 _U6(I5, nIS_EXM_I, I6, nIS_EXM_I, nirupt, D_ADDR1, D_ADDR2, I7,
    nIS_EXM_I, nirupt, D_ADDR0, nirupt);

   Memory_U7 _U7(I8, nIS_EXM_I, I9, nIS_EXM_I, nirupt, D_ADDR4, IS_SPECIAL_ADDR,
    Net__U3_Pad8_, D_ADDR10, D_ADDR11, D_ADDR3, nirupt);

   Memory_U8 _U8(I10, nirupt, D_ADDR5, I11, nirupt, D_ADDR6, D_ADDR7,
    Net__U1_Pad8_, nirupt, Net__U10_S_, FETCH_CYC, nIS_EXM_I);

   Memory_U9 _U9(Net__U10_S_, D_ADDR0, HOP_IP0, A0, D_ADDR1, HOP_IP1, A1, A2,
    HOP_IP2, D_ADDR2, A3, HOP_IP3, D_ADDR3, GND);

   Memory_U10 _U10(Net__U10_S_, D_ADDR4, HOP_IP4, A4, D_ADDR5, HOP_IP5, A5, A6,
    HOP_IP6, D_ADDR6, A7, HOP_IP7, D_ADDR7, GND);

   Memory_U11 _U11(Net__U10_S_, D_ADDR8, HOP_IS0, A8, D_ADDR9, HOP_IS1, A9, A10,
    HOP_IS2, D_ADDR10, A11, HOP_IS3, D_ADDR11, GND);

   Memory_U12 _U12(Net__U10_S_, HOP_DM0, HOP_IM0, A12, HOP_DM1, HOP_IM1, A13,
    A14, HOP_IM2, HOP_DM2, unconnected__U12_Zd_Pad12_, plus5V, GND,
    GND);

   Memory_U13 _U13(GND, D_ADDR8, plus5V, D_ADDR9, plus5V, D_ADDR2, plus5V,
    D_ADDR3, plus5V, D_ADDR4, plus5V, D_ADDR5, plus5V, D_ADDR6, plus5V, D_ADDR7,
    plus5V, Net__U13_Px3dR_);

   Memory_U14 _U14(IS_SPECIAL_ADDR, D_ADDR1, HOP_INSTEAD_OF_A, IS_SPECIAL_ADDR,
    Net__U14_Pad5_, Net__U14_Pad6_, PQ_ADDR, Net__U14_Pad6_, Net__U14_Pad10_,
    Net__U14_Pad10_, D_ADDR0, Net__U14_Pad13_);

   Memory_U15 _U15(A13, A10, Net__U15_Pad3_, Net__U15_Pad3_, Net__U15_Pad5_,
    Net__U15_Pad12_, Net__U15_Pad5_, A11, A12, nIN_ROM, Net__U15_Pad12_,
    Net__U1_Pad11_);

   Memory_U16 _U16(A7, A6, A5, A4, A3, A2, A1, A0, M0, M1, M2, GND, M3, M4, M5,
    M6, M7, nIN_ROM, A10, nRD, plus5V, A9, A8, plus5V);

   Memory_U17 _U17(A7, A6, A5, A4, A3, A2, A1, A0, M8, M9, M10, GND, M11, M12,
    M13, M14, M15, nIN_ROM, A10, nRD, plus5V, A9, A8, plus5V);

   Memory_U18 _U18(PQ_ADDR, PQ_ADDR, Net__U18_Pad12_, MEM_WR, Net__U18_Pad12_,
    nWR, Net__U18_Pad8_, Net__U18_Pad9_, nirupt, Net__U18_Pad11_, Net__U18_Pad12_,
    MEM_RD);

   Memory_U19 _U19(Net__U19_Pad1_, Net__U18_Pad11_, Net__U18_Pad11_, nRD,
    Net__U19_Pad1_, FETCH_CYC, nIN_ROM, nIN_ROM, nIN_RAM, Net__U18_Pad8_,
    Net__U18_Pad8_, Net__U19_Pad13_);

   Memory_U20 _U20(nRD, DB0, DB1, DB2, DB3, DB4, DB5, DB6, DB7, M7, M6, M5, M4,
    M3, M2, M1, M0, GND);

   Memory_U21 _U21(nRD, DB8, DB9, DB10, DB11, DB12, DB13, DB14, DB15, M15, M14,
    M13, M12, M11, M10, M9, M8, GND);

   Memory_U22 _U22(nRD, DB16, DB17, DB18, DB19, DB20, DB21, DB22, DB23, M23,
    M22, M21, M20, M19, M18, M17, M16, GND);

   Memory_U23 _U23(nRD, DB24, DB25, GND, GND, GND, GND, Net__D1_A_, GND, GND,
    GND, GND, GND, GND, GND, M25, M24, GND);

   Memory_U24 _U24(A14, A12, A7, A6, A5, A4, A3, A2, A1, A0, M0, M1, M2, GND,
    M3, M4, Net__U24_IO5_, Net__U24_IO6_, Net__U24_IO7_, nIN_RAM, A10, nRD, A11,
    A9, A8, A13, nWR, plus5V);

   Memory_U25 _U25(A14, A12, A7, A6, A5, A4, A3, A2, A1, A0, M5, M6, M7, GND,
    Net__U25_IO3_, Net__U25_IO4_, M8, Net__U25_IO6_, M9, nIN_RAM, A10, nRD, A11,
    A9, A8, A13, nWR, plus5V);

   Memory_U26 _U26(A14, A12, A7, A6, A5, A4, A3, A2, A1, A0, M10, M11, M12, GND,
    M13, M14, M15, M16, M17, nIN_RAM, A10, nRD, A11, A9, A8, A13, nWR,
    plus5V);

   Memory_U27 _U27(A14, A12, A7, A6, A5, A4, A3, A2, A1, A0, M18, M19, M20, GND,
    M21, M22, M23, M24, M25, nIN_RAM, A10, nRD, A11, A9, A8, A13, nWR,
    plus5V);


endmodule


module Memory_D1(
   inout K,
   inout A);

endmodule

module Memory_J1(
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

module Memory_J2(
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

module Memory_J3(
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

module Memory_RN1(
   inout common,
   inout R1,
   inout R2,
   inout R3,
   inout R4,
   inout R5,
   inout R6,
   inout R7,
   inout R8);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define R {R8, R7, R6, R5, R4, R3, R2, R1}

   `undef R

endmodule

module Memory_RN2(
   inout common,
   inout R1,
   inout R2,
   inout R3,
   inout R4,
   inout R5,
   inout R6,
   inout R7,
   inout R8);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define R {R8, R7, R6, R5, R4, R3, R2, R1}

   `undef R

endmodule

module Memory_RN3(
   inout common,
   inout R1,
   inout R2,
   inout R3,
   inout R4,
   inout R5,
   inout R6,
   inout R7,
   inout R8);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define R {R8, R7, R6, R5, R4, R3, R2, R1}

   `undef R

endmodule

module Memory_U1(
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

ttl_74hct32 U1(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Memory_U2(
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

ttl_74hct08 U2(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Memory_U3(
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

ttl_74hct04 U3({_1, _3, _5, _9, _11, _13}, {_2, _4, _6, _8, _10, _12});

endmodule

module Memory_U4(
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

module Memory_U5(
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

ttl_74hct32 U5(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Memory_U6(
   input _1,
   input _2,
   input _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   input _11,
   output _12,
   input _13);

ttl_74hct11 U6(_1, _2, _13, _12, _3, _4, _5, _6, _9, _10, _11, _8);

endmodule

module Memory_U7(
   input _1,
   input _2,
   input _3,
   input _4,
   input _5,
   output _6,
   output _8,
   input _9,
   input _10,
   input _11,
   output _12,
   input _13);

ttl_74hct11 U7(_1, _2, _13, _12, _3, _4, _5, _6, _9, _10, _11, _8);

endmodule

module Memory_U8(
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

ttl_74hct08 U8(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Memory_U9(
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

module Memory_U10(
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

module Memory_U11(
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

module Memory_U12(
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

module Memory_U13(
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

ttl_74hc688 U13(`P, `R, G, Px3dR);

   `undef P
   `undef R

endmodule

module Memory_U14(
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

ttl_74hct08 U14(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Memory_U15(
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

ttl_74hct32 U15(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Memory_U16(
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

mem_28C16 U16(`A, nWE, nOE, nCE, `I_O);

   `undef A
   `undef I_O

endmodule

module Memory_U17(
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

mem_28C16 U17(`A, nWE, nOE, nCE, `I_O);

   `undef A
   `undef I_O

endmodule

module Memory_U18(
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

ttl_74hct00 U18(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Memory_U19(
   output _1,
   input _2,
   input _3,
   output _4,
   input _5,
   input _6,
   input _8,
   input _9,
   output _10,
   input _11,
   input _12,
   output _13);

ttl_74hct02 U19(_1, _2, _3, _4, _5, _6, _9, _10, _8, _12, _13, _11);

endmodule

module Memory_U20(
   input A_x3eB,
   inout A0,
   inout A1,
   inout A2,
   inout A3,
   inout A4,
   inout A5,
   inout A6,
   inout A7,
   inout B7,
   inout B6,
   inout B5,
   inout B4,
   inout B3,
   inout B2,
   inout B1,
   inout B0,
   input CE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A7, A6, A5, A4, A3, A2, A1, A0}
   `define B {B7, B6, B5, B4, B3, B2, B1, B0}

ttl_74hct245 U20(`A, `B, CE, A_x3eB);

   `undef A
   `undef B

endmodule

module Memory_U21(
   input A_x3eB,
   inout A0,
   inout A1,
   inout A2,
   inout A3,
   inout A4,
   inout A5,
   inout A6,
   inout A7,
   inout B7,
   inout B6,
   inout B5,
   inout B4,
   inout B3,
   inout B2,
   inout B1,
   inout B0,
   input CE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A7, A6, A5, A4, A3, A2, A1, A0}
   `define B {B7, B6, B5, B4, B3, B2, B1, B0}

ttl_74hct245 U21(`A, `B, CE, A_x3eB);

   `undef A
   `undef B

endmodule

module Memory_U22(
   input A_x3eB,
   inout A0,
   inout A1,
   inout A2,
   inout A3,
   inout A4,
   inout A5,
   inout A6,
   inout A7,
   inout B7,
   inout B6,
   inout B5,
   inout B4,
   inout B3,
   inout B2,
   inout B1,
   inout B0,
   input CE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A7, A6, A5, A4, A3, A2, A1, A0}
   `define B {B7, B6, B5, B4, B3, B2, B1, B0}

ttl_74hct245 U22(`A, `B, CE, A_x3eB);

   `undef A
   `undef B

endmodule

module Memory_U23(
   input A_x3eB,
   inout A0,
   inout A1,
   inout A2,
   inout A3,
   inout A4,
   inout A5,
   inout A6,
   inout A7,
   inout B7,
   inout B6,
   inout B5,
   inout B4,
   inout B3,
   inout B2,
   inout B1,
   inout B0,
   input CE);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A7, A6, A5, A4, A3, A2, A1, A0}
   `define B {B7, B6, B5, B4, B3, B2, B1, B0}

ttl_74hct245 U23(`A, `B, CE, A_x3eB);

   `undef A
   `undef B

endmodule

module Memory_U24(
   input A14,
   input A12,
   input A7,
   input A6,
   input A5,
   input A4,
   input A3,
   input A2,
   input A1,
   input A0,
   inout IO0,
   inout IO1,
   inout IO2,
   input GND,
   inout IO3,
   inout IO4,
   inout IO5,
   inout IO6,
   inout IO7,
   input nCE,
   input A10,
   input nOE,
   input A11,
   input A9,
   input A8,
   input A13,
   input nWE,
   input VCC);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}
   `define IO {IO7, IO6, IO5, IO4, IO3, IO2, IO1, IO0}

mem_IS61C256 U24(`A, nWE, nOE, nCE, `IO);

   `undef A
   `undef IO

endmodule

module Memory_U25(
   input A14,
   input A12,
   input A7,
   input A6,
   input A5,
   input A4,
   input A3,
   input A2,
   input A1,
   input A0,
   inout IO0,
   inout IO1,
   inout IO2,
   input GND,
   inout IO3,
   inout IO4,
   inout IO5,
   inout IO6,
   inout IO7,
   input nCE,
   input A10,
   input nOE,
   input A11,
   input A9,
   input A8,
   input A13,
   input nWE,
   input VCC);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}
   `define IO {IO7, IO6, IO5, IO4, IO3, IO2, IO1, IO0}

mem_IS61C256 U25(`A, nWE, nOE, nCE, `IO);

   `undef A
   `undef IO

endmodule

module Memory_U26(
   input A14,
   input A12,
   input A7,
   input A6,
   input A5,
   input A4,
   input A3,
   input A2,
   input A1,
   input A0,
   inout IO0,
   inout IO1,
   inout IO2,
   input GND,
   inout IO3,
   inout IO4,
   inout IO5,
   inout IO6,
   inout IO7,
   input nCE,
   input A10,
   input nOE,
   input A11,
   input A9,
   input A8,
   input A13,
   input nWE,
   input VCC);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}
   `define IO {IO7, IO6, IO5, IO4, IO3, IO2, IO1, IO0}

mem_IS61C256 U26(`A, nWE, nOE, nCE, `IO);

   `undef A
   `undef IO

endmodule

module Memory_U27(
   input A14,
   input A12,
   input A7,
   input A6,
   input A5,
   input A4,
   input A3,
   input A2,
   input A1,
   input A0,
   inout IO0,
   inout IO1,
   inout IO2,
   input GND,
   inout IO3,
   inout IO4,
   inout IO5,
   inout IO6,
   inout IO7,
   input nCE,
   input A10,
   input nOE,
   input A11,
   input A9,
   input A8,
   input A13,
   input nWE,
   input VCC);

   // NOTE: The following symbols are MACRO definition(s)!
   // To use them, precede them with a `
   `define A {A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}
   `define IO {IO7, IO6, IO5, IO4, IO3, IO2, IO1, IO0}

mem_IS61C256 U27(`A, nWE, nOE, nCE, `IO);

   `undef A
   `undef IO

endmodule

