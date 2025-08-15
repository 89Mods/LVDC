	include "../System/common_defines.asm"
	org 0
start:
	CDSS 0,0
	CLA settings_reset
	PIO settings_reg
	CLA initial_gpio
	ADD flash_csb_bit
	PIO gpio_out
	CLA sid_shutup
	PIO sid_base
	CLA sid_shutup+1
	PIO sid_base
	CLA sid_shutup+2
	PIO sid_base
	CLA sid_shutup+3
	PIO sid_base
	CL
	PIO r1_lo
	PIO r2_lo
	PIO r1_hi
	PIO r2_hi
	
	CLA startup_del
	SHL 2
	SHL 2
start_del_loop:
	SUB one
	TNZ start_del_loop
	CLA sid_beep
	PIO sid_base
	CLA sid_beep+1
	PIO sid_base
	CLA sid_beep+2
	PIO sid_base
	CLA sid_beep+3
	PIO sid_base
	CLA sid_beep+4
	PIO sid_base
	CLA sid_beep+5
	PIO sid_base
	CLA sid_beep+6
	PIO sid_base
	CLA sid_beep+7
	PIO sid_base

	; Select spiflash
	CLA initial_gpio
	PIO gpio_out
	CLA initial_spi_cmds
	PIO spi_dout
	CLA initial_gpio
	ADD flash_csb_bit
	PIO gpio_out
	SUB flash_csb_bit
	PIO gpio_out
	CLA initial_spi_cmds+1
	PIO spi_dout
	CLA initial_spi_cmds+3
	CDSS 0,0
	PIO spi_dout
	CLA initial_gpio
	ADD flash_csb_bit
	PIO gpio_out
	SUB flash_csb_bit
	PIO gpio_out
	CLA initial_spi_cmds+2
	PIO spi_dout
	CLA initial_spi_cmds+3
	CDSS 0,0
	PIO spi_dout
	CDSS 0,0
	PIO spi_dout
	CDSS 0,0
	PIO spi_dout
	CDSS 0,0
	PIO spi_dout
	CDSS 0,0
	PIO spi_dout
	CLA initial_gpio
	ADD flash_csb_bit
	PIO gpio_out
	PIO spi_din ; Should now contain flash manufacturer and device IDs
	PIO r2_lo
	SUB expected_spi_id
	TNZ error_spi
	CLA initial_gpio
	STO +0
	CLA startup_del
start_del_loop2:
	SUB one
	CDSS 0,0
	TNZ start_del_loop2
	HOP* mem_init
	
	;CLA sid_beep_release
	;PIO sid_base
error_spi:
	CLA error_spi
	PIO r1_lo
error_halt:
	CDSS 0,0
	CLA gpio_fault
	PIO gpio_out
	CLA settings_fault
	PIO settings_reg
	CLA sid_shutup
	PIO sid_base
	CLA sid_shutup+1
	PIO sid_base
	CLA sid_shutup+2
	PIO sid_base
	CLA sid_shutup+3
	PIO sid_base
	TRA error_halt

settings_reset:
	dd r_clr_keyrupt + r_clr_trupt + r_chg_timer + r_clr_urupt + r_chg_mm + ($99 << 8)
initial_gpio:
	dd gr_lamp_restart + gr_int_inhibit
flash_csb_bit:
	dd gr_flash_csb
gpio_fault:
	dd gr_int_inhibit + gr_flash_csb + gr_lamp_opr_err
settings_fault:
	dd r_chg_timer + r_chg_mm + ($FF << 8)
sid_shutup:
	dd (4<<8) + 0
	dd (11<<8) + 0
	dd (18<<8) + 0
	dd (24<<8) + $80
sid_beep:
	dd (0<<8) + (12000&$FF)
	dd (1<<8) + (12000>>8)
	dd (5<<8) + $04
	dd (6<<8) + $E4
	dd (2<<8) + $00
	dd (3<<8) + $09
	dd (24<<8) + $8F
	dd (4<<8) + $41
one:
	dd 1
startup_del:
	dd 2048 ; Larger on real HW
initial_spi_cmds:
	dd $FF+spi_flash
	dd $AB+spi_flash
	dd $90+spi_flash
	dd $00+spi_flash
expected_spi_id:
	dd $EF15
error_code_spi:
	dd $0101





	org 256
interrupt_hop:
	; to module 0, sector 1, IP = 1
	; aka. $0101
	dd %0000000010000100
interrupt:
	STO +$FE
	STO +$FC
	CDSS 0,1
	HOP real_irupt
	CDSS 0,0
	CLA +$FC
	HOP +$FE
real_irupt:
	; to module 2, sector 0, IP = 0
	; aka. $2000
	dd %0000000000000001


	; Entire module 0 is only used as spare memory
	; Module 1 holds current MM
	; Module 2 holds interrupt code
	; Module 3 holds main program loops
	; Module 4 holds command code
	; Module 5 holds command code
	; Module 6 holds utility functions
	; Module 7 is unassigned

	; Only modules 2 - 6 are bootloaded, 1 is loaded dynamically, 7 is unassigned, 0 is mostly just for the ROM

	org 512
mem_init:
	CDSD 0,2
	; Select ROM & send read command to address 0
	CLA +0
	PIO gpio_out
	CLA read_cmd
	PIO spi_dout
	CL
	CLA spi_dummy
	PIO spi_dout
	CL
	CLA spi_dummy
	PIO spi_dout
	CL
	CLA spi_dummy
	PIO spi_dout
	; We shall do indexed addressing in a cursed way: dynamically assembling bytecode in the residual sector for
	; +2: CDS (acc>>8)<<1
	; +3: STO acc&255
	; +4: CDS 0,0
	; +5: HOP +6
	; +6: HOP constant to go back to ROM
	CLA residual_bytecode+2
	STO +4
	CLA residual_bytecode+3
	STO +5
	CLA residual_bytecode+5
	STO +6
	CLA start_ram_address
	STO +9
	CLA mem_size
	STO +8
copy_loop:
	; All this to compose the CDS instruction
	CLA +9
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	STO +7
	AND and_vals+0
	SHL 2
	SHL 2
	STO +2
	CLA +7
	SHR 2
	SHR 2
	AND and_vals+2
	SHL 1
	ADD +2
	SHL 2
	SHL 1
	SHL 2
	ADD residual_bytecode+0
	STO +2
	; STO
	CLA +9
	AND and_vals+1
	SHL 2
	SHL 2
	SHL 1
	ADD residual_bytecode+1
	STO +3
	; Get next word from spiflash
	CLA spi_dummy
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
	STO +7
	
	CLA spi_dummy
	PIO spi_dout
	PIO spi_dout
	PIO spi_din
	ADD +7
	STO +7

	PIO r1_lo
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	PIO r1_hi
	
	CLA +7
	; Write to next location in RAM
	HOP* $0F02,0,0
continue:
	CDSS 0,2
	CLA +9
	ADD one_inc
	STO +9
	CLA +8
	SUB one_inc
	STO +8
	TNZ copy_loop
	
	; Deselect & clear lamps
	CLA final_gpio
	PIO gpio_out
	CL
	PIO r1_lo
	PIO r2_lo
	PIO r1_hi
	PIO r2_hi
	CDSS 0,1
	CLA mem_init ; interrupt_hop
	CDSS 1,1
	STO mem_init
	CDSS 2,1
	STO mem_init
	CDSS 3,1
	STO mem_init
	CDSS 4,1
	STO mem_init
	CDSS 5,1
	STO mem_init
	CDSS 6,1
	STO mem_init
	CDSS 7,1
	STO mem_init
	CDSS 0,2
	; No more beep
	CLA sid_beep_release
	PIO sid_base
	; Need to HOP to $2060001, but this overflows the 16-bit ROM
	CLA hop0
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	ADD hop0+1
	STO +1
	HOP +1
read_cmd:
	dd $03+spi_flash
spi_dummy:
	dd $00+spi_flash
final_gpio:
	dd gr_lamp_comp_acty + gr_int_inhibit + gr_flash_csb
sid_beep_release:
	dd (4<<8) + $40
residual_bytecode:
	dd $0E
	dd $0B
	dd $0E
	HOP +6
	HOP* continue
start_ram_address:
	dd $2000
	;dd $3000
mem_size:
	dd $7FFF-$2000
	;dd $3FFF-$2000
one_inc:
	dd 1
and_vals:
	dd $00F
	dd $0FF
	dd $007
hop0:
	dd $8180
	dd $0001
