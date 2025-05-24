#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#define ALU_SWAPOPS (1 << 0)
#define ALU_OUTPUT (1 << 1)
#define ALU_IS_SHIFT (1 << 2)
#define ACCUM_WRITE (1 << 3)
#define ACCUM_OUTPUT (1 << 4)
#define INC_PC (1 << 5)
#define CDS_EXEC (1 << 6)
#define HOP_WRITE (1 << 7)
#define TRA_EXEC (1 << 8)
#define MEM_WR (1 << 9)
#define FETCH_CYC (1 << 10)
#define MEM_RD (1 << 11)
#define IS_EXM (1 << 12)
#define IS_IOEXEC (1 << 13)
#define MUL_RST ((1 << 14) | (1 << 15))
#define MUL_LDY_AND_START (1 << 15)
#define MUL_LDX_OR_LDZ (1 << 14)

#define STEP_0 0
#define STEP_1 1
#define STEP_2 2
#define STEP_3 3
#define STEP_4 4
#define STEP_5 5
#define STEP_6 6
#define STEP_7 7
#define A9 (1 << 7)
#define A8 (1 << 8)
#define ACCUM_ZERO (1 << 9)
#define ACCUM_NEG (1 << 10)

void wr_string(FILE *outfile, char *str) {
	while(1) {
		if(*str == 0) return;
		fwrite(str, 1, 1, outfile);
		str++;
	}
}

static uint16_t res[2048];

void instr_simple(uint8_t opcode, uint8_t step, uint16_t signals) {
	res[step + (opcode << 3)] = signals;
	res[step + (opcode << 3) + A9] = signals;
	res[step + (opcode << 3) + A8] = signals;
	res[step + (opcode << 3) + A8 + A9] = signals;
	res[step + (opcode << 3) + ACCUM_ZERO] = signals;
	res[step + (opcode << 3) + ACCUM_ZERO + A9] = signals;
	res[step + (opcode << 3) + ACCUM_ZERO + A8] = signals;
	res[step + (opcode << 3) + ACCUM_ZERO + A8 + A9] = signals;
	res[step + (opcode << 3) + ACCUM_NEG] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + A9] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + A8] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + A8 + A9] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + ACCUM_ZERO + A9] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + ACCUM_ZERO + A8] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + ACCUM_ZERO + A8 + A9] = signals;
}

void instr_pio(uint8_t opcode, uint8_t is_read, uint8_t step, uint16_t signals) {
	uint16_t o = is_read ? A9 : 0;
	res[step + (opcode << 3) + o] = signals;
	res[step + (opcode << 3) + A8 + o] = signals;
	res[step + (opcode << 3) + ACCUM_ZERO + o] = signals;
	res[step + (opcode << 3) + ACCUM_ZERO + A8 + o] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + o] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + A8 + o] = signals;
	res[step + (opcode << 3) + ACCUM_NEG + ACCUM_ZERO + A8 + o] = signals;
}

void instr_shift(uint8_t step, uint16_t signals) {
	res[step + (0xE << 3) + A9] = signals;
	res[step + (0xE << 3) + A9 + ACCUM_ZERO] = signals;
	res[step + (0xE << 3) + A9 + ACCUM_NEG] = signals;
	res[step + (0xE << 3) + A9 + ACCUM_ZERO + ACCUM_NEG] = signals;
}

void instr_cds(uint8_t step, uint16_t signals) {
	res[step + (0xE << 3) + A8] = signals;
	res[step + (0xE << 3) + A8 + ACCUM_ZERO] = signals;
	res[step + (0xE << 3) + A8 + ACCUM_NEG] = signals;
	res[step + (0xE << 3) + A8 + ACCUM_ZERO + ACCUM_NEG] = signals;
	res[step + (0xE << 3)] = signals;
	res[step + (0xE << 3) + ACCUM_ZERO] = signals;
	res[step + (0xE << 3) + ACCUM_NEG] = signals;
	res[step + (0xE << 3) + ACCUM_ZERO + ACCUM_NEG] = signals;
}

void instr_exm(uint8_t step, uint16_t signals) {
	res[step + (0xE << 3) + A8 + A9] = signals;
	res[step + (0xE << 3) + A8 + A9 + ACCUM_ZERO] = signals;
	res[step + (0xE << 3) + A8 + A9 + ACCUM_NEG] = signals;
	res[step + (0xE << 3) + A8 + A9 + ACCUM_ZERO + ACCUM_NEG] = signals;
}

int main(void) {
	memset(res, 0, 2048 * sizeof(uint16_t));
	
	for(uint8_t i = 0; i < 16; i++) {
		instr_simple(i, STEP_0, FETCH_CYC);
		instr_simple(i, STEP_1, INC_PC);
	}
	
	//HOP
	instr_simple(0x0, STEP_1, MEM_RD | HOP_WRITE);
	instr_simple(0x0, STEP_2, INC_PC);
	
	//SUB
	instr_simple(0x2, STEP_1, MEM_RD);
	instr_simple(0x2, STEP_2, ALU_OUTPUT | ACCUM_WRITE);
	instr_simple(0x2, STEP_3, INC_PC);
	
	//AND
	instr_simple(0x6, STEP_1, MEM_RD);
	instr_simple(0x6, STEP_2, ALU_OUTPUT | ACCUM_WRITE);
	instr_simple(0x6, STEP_3, INC_PC);
	
	//ADD
	instr_simple(0x7, STEP_1, MEM_RD);
	instr_simple(0x7, STEP_2, ALU_OUTPUT | ACCUM_WRITE);
	instr_simple(0x7, STEP_3, INC_PC);
	
	//XOR
	instr_simple(0x9, STEP_1, MEM_RD);
	instr_simple(0x9, STEP_2, ALU_OUTPUT | ACCUM_WRITE);
	instr_simple(0x9, STEP_3, INC_PC);
	
	//RSU
	instr_simple(0xD, STEP_1, MEM_RD);
	instr_simple(0xD, STEP_2, ALU_OUTPUT | ACCUM_WRITE);
	instr_simple(0xD, STEP_3, INC_PC);
	
	//CLA
	instr_simple(0xF, STEP_1, MEM_RD);
	instr_simple(0xF, STEP_2, ALU_OUTPUT | ACCUM_WRITE);
	instr_simple(0xF, STEP_3, INC_PC);
	
	//SHF
	instr_shift(STEP_1, ALU_IS_SHIFT);
	instr_shift(STEP_2, ALU_OUTPUT | ACCUM_WRITE);
	instr_shift(STEP_3, INC_PC);
	
	//CDS
	instr_cds(STEP_1, CDS_EXEC);
	instr_cds(STEP_2, INC_PC);
	
	//TRA
	instr_simple(0x8, STEP_1, TRA_EXEC);
	instr_simple(0x8, STEP_2, INC_PC);
	
	//TNZ
	instr_simple(0x4, STEP_1, TRA_EXEC);
	instr_simple(0x4, STEP_2, INC_PC);
	res[STEP_1 + (0x4 << 3) + ACCUM_ZERO] = 0;
	res[STEP_1 + (0x4 << 3) + ACCUM_ZERO + A9] = 0;
	res[STEP_1 + (0x4 << 3) + ACCUM_ZERO + A8] = 0;
	res[STEP_1 + (0x4 << 3) + ACCUM_ZERO + A8 + A9] = 0;
	res[STEP_1 + (0x4 << 3) + ACCUM_ZERO + ACCUM_NEG] = 0;
	res[STEP_1 + (0x4 << 3) + ACCUM_ZERO + ACCUM_NEG + A9] = 0;
	res[STEP_1 + (0x4 << 3) + ACCUM_ZERO + ACCUM_NEG + A8] = 0;
	res[STEP_1 + (0x4 << 3) + ACCUM_ZERO + ACCUM_NEG + A8 + A9] = 0;
	
	//TMI
	instr_simple(0xC, STEP_1, TRA_EXEC);
	instr_simple(0xC, STEP_2, INC_PC);
	res[STEP_1 + (0xC << 3) + ACCUM_ZERO] = 0;
	res[STEP_1 + (0xC << 3) + ACCUM_ZERO + A9] = 0;
	res[STEP_1 + (0xC << 3) + ACCUM_ZERO + A8] = 0;
	res[STEP_1 + (0xC << 3) + ACCUM_ZERO + A8 + A9] = 0;
	res[STEP_1 + (0xC << 3)] = 0;
	res[STEP_1 + (0xC << 3) + A9] = 0;
	res[STEP_1 + (0xC << 3) + A8] = 0;
	res[STEP_1 + (0xC << 3) + A8 + A9] = 0;
	
	//STO
	instr_simple(0xB, STEP_1, ACCUM_OUTPUT);
	instr_simple(0xB, STEP_2, ACCUM_OUTPUT | MEM_WR);
	instr_simple(0xB, STEP_3, INC_PC);
	
	//DIV
	instr_simple(0x3, STEP_1, 0);
	instr_simple(0x3, STEP_2, MUL_RST);
	instr_simple(0x3, STEP_3, ACCUM_OUTPUT | MUL_LDX_OR_LDZ);
	instr_simple(0x3, STEP_4, MEM_RD | MUL_LDY_AND_START);
	instr_simple(0x3, STEP_5, INC_PC);
	
	//MPY
	instr_simple(0x1, STEP_1, 0);
	instr_simple(0x1, STEP_2, MUL_RST);
	instr_simple(0x1, STEP_3, ACCUM_OUTPUT | MUL_LDX_OR_LDZ);
	instr_simple(0x1, STEP_4, MEM_RD | MUL_LDY_AND_START);
	instr_simple(0x1, STEP_5, INC_PC);
	
	//MPH
	instr_simple(0x5, STEP_1, 0);
	instr_simple(0x5, STEP_2, MUL_RST);
	instr_simple(0x5, STEP_3, ACCUM_OUTPUT | MUL_LDX_OR_LDZ);
	instr_simple(0x5, STEP_4, MEM_RD | MUL_LDY_AND_START);
	instr_simple(0x5, STEP_5, 0);
	instr_simple(0x5, STEP_6, MUL_RST | ACCUM_WRITE);
	instr_simple(0x5, STEP_7, INC_PC);
	
	//IS_EXM line
	for(int i = 0; i < 2048; i++) {
		if(((i >> 3) & 15) != 0xE) continue;
		if((i & A9) == 0) continue;
		if((i & A8) == 0) continue;
		res[i] |= IS_EXM;
	}
	
	//PIO
	instr_pio(0xA, 0, STEP_1, ACCUM_OUTPUT);
	instr_pio(0xA, 0, STEP_2, IS_IOEXEC | ACCUM_OUTPUT);
	instr_pio(0xA, 0, STEP_3, ACCUM_OUTPUT);
	instr_pio(0xA, 0, STEP_4, INC_PC);
	
	instr_pio(0xA, 1, STEP_1, IS_IOEXEC);
	instr_pio(0xA, 1, STEP_2, IS_IOEXEC | ACCUM_WRITE);
	instr_pio(0xA, 1, STEP_3, INC_PC);
	
	FILE *outfile = fopen("microcode.txt", "wb");
	if(!outfile) {
		printf("Failed to open output file\n");
		return 1;
	}
	char strbuff[128];
	wr_string(outfile, "v3.0 hex words addressed");
	for(int i = 0; i < 2048; i++) {
		if((i & 15) == 0) {
			sprintf(strbuff, "\n%03x:", i);
			wr_string(outfile, strbuff);
		}
		sprintf(strbuff, " %04x", res[i]);
		wr_string(outfile, strbuff);
	}
	wr_string(outfile, "\n");
	fclose(outfile);
	
	outfile = fopen("microcode_verilog_lo.txt", "wb");
	if(!outfile) {
		printf("Failed to open output file\n");
		return 1;
	}
	for(int i = 0; i < 2048; i++) {
		uint8_t val = res[i] & 0xFF;
		sprintf(strbuff, "%02x", val);
		wr_string(outfile, strbuff);
		if(((i + 1) & 15) == 0) wr_string(outfile, "\n");
		else wr_string(outfile, " ");
	}
	fclose(outfile);
	
	outfile = fopen("microcode_verilog_hi.txt", "wb");
	if(!outfile) {
		printf("Failed to open output file\n");
		return 1;
	}
	for(int i = 0; i < 2048; i++) {
		uint8_t val = res[i] >> 8;
		sprintf(strbuff, "%02x", val);
		wr_string(outfile, strbuff);
		if(((i + 1) & 15) == 0) wr_string(outfile, "\n");
		else wr_string(outfile, " ");
	}
	fclose(outfile);
	
	outfile = fopen("microcode_hi.dat", "wb");
	if(!outfile) {
		printf("Failed to open output file\n");
		return 1;
	}
	for(int i = 0; i < 2048; i++) {
		uint8_t val = res[i] >> 8;
		fwrite(&val, 1, 1, outfile);
	}
	fclose(outfile);
	
	outfile = fopen("microcode_lo.dat", "wb");
	if(!outfile) {
		printf("Failed to open output file\n");
		return 1;
	}
	for(int i = 0; i < 2048; i++) {
		uint8_t val = res[i] & 0xFF;
		fwrite(&val, 1, 1, outfile);
	}
	fclose(outfile);
	return 0;
}
