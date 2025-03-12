io_write_base equ 0
io_read_base equ 1<<8

radio_read equ io_read_base + (%1000)
status_read equ io_read_base + (%1110)
spi_din equ io_read_base + (%1010)
gpio_out equ io_write_base + (%0101)
gpio_in equ io_read_base + (%0101)

cpld_regs_base_write equ io_write_base + (%0010)
r1_lo equ cpld_regs_base_write + (%0000)
r1_hi equ cpld_regs_base_write + (%0001)
r2_lo equ cpld_regs_base_write + (%0100)
r2_hi equ cpld_regs_base_write + (%0101)
spi_dout equ cpld_regs_base_write + (%1000)
radio_txw equ cpld_regs_base_write + (%1001)
settings_reg equ cpld_regs_base_write + (%1100)
sid_base equ cpld_regs_base_write + (%1101)

; When writing to SID, bits 0 - 7 of the dataword is the data
; and bits 8 - 13 is the address

spi_flash equ 1<<8
spi_leds_left equ 2<<8
spi_leds_right equ 4<<8

r_clr_keyrupt equ 1
r_clr_trupt equ 2
r_clr_urupt equ 4
r_chg_timer equ 8
r_timer_en equ 16
r_chg_mm equ 128
; MM value in bits 8 - 15

; Status register makeup:
; - Undefined
; .
; .
; .
; .
; .
; .
; .
; .
; .
; .
; .
; .
; - urupt
; - keyrupt
; - trupt

; Settings on GPIO output port
gr_sign_r2 equ 1
gr_lamp_temp equ 2
gr_sign_r1 equ 4
gr_lamp_restart equ 8
gr_lamp_opr_err equ 16
gr_lamp_comp_acty equ 32
gr_int_inhibit equ 64
gr_flash_csb equ 128
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
	CLA startup_del
start_del_loop2:
	SUB one
	CDSS 0,0
	CDSS 0,0
	CDSS 0,0
	CDSS 0,0
	TNZ start_del_loop2
	
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
	dd gr_lamp_restart + gr_lamp_comp_acty + gr_int_inhibit
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
	dd (0<<8) + $A0
	dd (1<<8) + $0F
	dd (5<<8) + $04
	dd (6<<8) + $E9
	dd (2<<8) + $00
	dd (3<<8) + $09
	dd (24<<8) + $8F
	dd (4<<8) + $41
one:
	dd 1
startup_del:
	dd 5 ; Larger on real HW
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
interrupt:
	TRA interrupt





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
	; +4: HOP +5
	; +5: HOP constant to go back to ROM
	CLA residual_bytecode+2
	STO +4
	CLA residual_bytecode+4
	STO +5
	CLA start_ram_address
	STO +6
	CLA mem_size
	STO +8
copy_loop:
	; All this to compose the CDS instruction
	CLA +6
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
	CLA +6
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
	; Write to next location in RAM
	HOP* $0F02
continue:
	CDSS 0,2
	CLA +6
	ADD one_inc
	STO +6
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
	; No more beep
	CLA sid_beep_release
	PIO sid_base
	HOP* $0400
read_cmd:
	dd $03+spi_flash
spi_dummy:
	dd $00+spi_flash
final_gpio:
	dd gr_int_inhibit + gr_flash_csb
sid_beep_release:
	dd (4<<8) + $40
residual_bytecode:
	dd $0E
	dd $0B
	HOP +5
	HOP* continue
start_ram_address:
	dd $0400
mem_size:
	dd $05FF-$0400 ; More on real HW
one_inc:
	dd 1
and_vals:
	dd $00F
	dd $0FF
	dd $007
