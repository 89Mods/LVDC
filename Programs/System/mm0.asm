	include "common_defines.asm"
	SECTION mm_entry
	PUBLIC ret
curr_mod equ 1
curr_sec equ 0
	org (curr_sec<<8)|(curr_mod<<12)
mm0_entry:
	STO +hop_save
	CLA test
	cdsspare
	STO @curr_mm
	cdscurr
ret:
	cdscurr
	CLA bugfix
	ADD +hop_save
	STO +0
	HOP +0
bugfix:
	dd 1<<7
test:
	dd $00
	ENDSECTION
