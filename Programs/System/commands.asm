	SECTION switch_mm
	PUBLIC load_mm_flash
curr_mod equ 4
curr_sec equ 0
	org (curr_sec<<8)|(curr_mod<<12)
load_mm_flash:
	STO +hop_save
	; Accumulator value to flash byte address
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	ADD flash_offset
	STO temp
	cdsspare
	CLA @const_gr_flash_csb
	XOR @const_all_ones
	AND @gpio_mirror
	STO @gpio_mirror
	PIO gpio_out
	cdscurr
	CLA read_cmd
	PIO spi_dout
	CLA temp
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	STO temp2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	AND and_vals+1
	ADD flash_sel
	PIO spi_dout
	CLA temp2
	AND and_vals+1
	ADD flash_sel
	PIO spi_dout
	CLA temp
	AND and_vals+1
	ADD flash_sel
	PIO spi_dout
	
	CLA targ_addr
	STO temp
	; for(i = targ_addr; i != stop_addr; i++)
mm_copy_loop:
	CLA flash_sel
	PIO spi_dout
	PIO spi_dout
	PIO spi_din
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	STO temp2
	CLA flash_sel
	PIO spi_dout
	PIO spi_dout
	PIO spi_din
	ADD temp2
	STO temp2
	
	CLA temp
	XOR skip_addr
	TNZ do_not_skip
	TRA mm_copy_skip
do_not_skip:
	CLA temp
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
	ADD sto_code
	STO self_mod1

	CLA temp2
self_mod0:
	dd 0
self_mod1:
	dd 0
	cdscurr

mm_copy_skip:
	CLA temp
	ADD one
	STO temp
	XOR stop_addr
	TNZ mm_copy_loop
	
	cdsspare
	CLA @const_gr_flash_csb
	XOR @const_all_ones
	AND @gpio_mirror
	ADD @const_gr_flash_csb
	STO @gpio_mirror
	PIO gpio_out
ret:
	cdscurr
	CLA bugfix
	ADD +hop_save
	STO +0
	HOP +0
bugfix:
	dd 1<<7
flash_offset:
	dd 98304
read_cmd:
	dd $03+spi_flash
flash_sel:
	dd spi_flash
temp:
	dd 0
temp2:
	dd 0
targ_addr:
	dd $1000
skip_addr:
	dd $1100
stop_addr:
	dd $2000
cdss_code:
	CDSS 0,0
sto_code:
	STO @0
one:
	dd 1
and_vals:
	dd $00F
	dd $0FF
	dd $007
	ENDSECTION
