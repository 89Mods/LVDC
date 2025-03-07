4io_write_base equ 0
io_read_base equ 1<<8

radio_read equ io_read_base + (%1000 << 4)
status_read equ io_read_base + (%1110 << 4)
spi_din equ io_read_base + (%1111 << 4)
gpio_out equ io_write_base + (%0101 << 4)
gpio_in equ io_read_base + (%0101 << 4)

cpld_regs_base_write equ io_write_base + (%0010 << 4)
r1_lo equ cpld_regs_base_write + (%0000 << 4)
r1_hi equ cpld_regs_base_write + (%0001 << 4)
r2_lo equ cpld_regs_base_write + (%0100 << 4)
r2_hi equ cpld_regs_base_write + (%0101 << 4)
spi_dout equ cpld_regs_base_write + (%1000 << 4)
radio_txw equ cpld_regs_base_write + (%1001 << 4)
settings_reg equ cpld_regs_base_write + (%1100 << 4)

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

start:
	CLA settings_reset
	PIO settings_reg
	CLA initial_gpio
	PIO gpio_out
error_halt:
	CDSD 0,4
	TRA error_halt

settings_reset:
	dw r_clr_keyrupt + r_clr_trupt + r_chg_timer + r_clr_urupt
initial_gpio:
	dw gr_lamp_restart + gr_lamp_comp_acty + gr_int_inhibit + gr_flash_csb
