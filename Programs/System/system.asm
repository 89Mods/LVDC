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
	CDSD 0,4
	CLA initial_gpio
	PIO gpio_out
loop:
	CLA initial_gpio
	ADD led_gpio
	PIO gpio_out
	CLA delay_len
delay_loop_1:
	SUB one
	TNZ delay_loop_1
	CLA initial_gpio
	PIO gpio_out
	CLA delay_len
delay_loop_2:
	SUB one
	TNZ delay_loop_2
	TRA loop
initial_gpio:
	dd gr_lamp_comp_acty + gr_int_inhibit + gr_flash_csb
led_gpio:
	dd $FF00
delay_len:
	dd $20000
one:
	dd 1
