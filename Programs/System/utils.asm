	SECTION utils0
	PUBLIC gpio_set
	PUBLIC indirect_load
curr_mod equ 6
curr_sec equ 0
	org (curr_sec<<8)|(curr_mod<<12)
gpio_set: ; DO NOT USE IN INTERRUPT CODE
	; Bit to set in acc
	STO +hop_save
	STO temp
	cdsspare
	XOR @const_all_ones
	AND @gpio_mirror
	cdscurr
	ADD temp
	cdsspare
	STO @gpio_mirror
	PIO gpio_out
	PIO gpio_out
	cdscurr
utils_ret:
	CLA bugfix
	ADD +hop_save
	STO +0
	HOP +0
temp:
	dd 0
bugfix:
	dd 1<<7

indirect_load:
	; Address to load from in acc
	STO +hop_save
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	STO self_mod0
	AND and_vals+0
	SHL 2
	SHL 2
	STO self_mod1
	CLA self_mod0
	SHR 2
	SHR 2
	AND and_vals+2
	SHL 1
	ADD self_mod1
	SHL 2
	SHL 2
	SHL 1
	ADD cdss_code
	STO self_mod0
	CLA temp
	AND and_vals+1
	SHL 2
	SHL 2
	SHL 1
	ADD cla_code
	STO self_mod1

self_mod0:
	dd 0
self_mod1:
	dd 0
	cdsspare
	STO @sub_ret
	cdscurr
	
	TRA utils_ret
	
cdss_code:
	CDSS 0,0
cla_code:
	CLA @0
and_vals:
	dd $00F
	dd $0FF
	dd $007
	ENDSECTION
