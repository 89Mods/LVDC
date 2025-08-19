io_write_base equ 0
io_read_base equ 1<<8

; Global spare memory layout
spare_mod equ 0
spare_sec equ 14
; Display values from command
r1_cmd equ 0
r2_cmd equ 1
r_s_cmd equ 2
; Display values from major mode
r1_mm equ 3
r2_mm equ 4
r_s_mm equ 5
; Display values from cmd entry
r1_ent equ 6
r2_ent equ 7
r_s_ent equ 8
; Computer status info
cmd_act equ 9
entry_mode equ 10
gpio_mirror equ 11
curr_mm equ 12
cmd_state equ 13
next_cmd equ 14
system_timer equ 15
; Some constant values
const_gr_flash_csb equ 16
const_all_ones equ 17
; Subroutine return values
sub_ret equ 18

cmd_state_initial equ 0
cmd_state_running equ 1
cmd_state_final equ 2

cdsspare macro
	CDSS spare_mod,spare_sec
	endm

cdscurr macro
	CDSS curr_mod,curr_sec
	endm

; r_s_xxx are display settings:
; 8 - R2 Sign Blink
; 4 - R1 Sign Blink
; 2 - R2 is Signed
; 1 - R1 is Signed

; TODO: should really be io_write_base to be compatible with original LVDC
; But messed up the IO board implementation, so the CPLD will respond to a write here
; So lets just....not
intclr equ io_read_base + %00011010

radio_read equ io_read_base + (%1000)
status_read equ io_read_base + (%1110)
spi_din equ io_read_base + (%1010)
gpio_out equ io_write_base + (%0101)
gpio_in0 equ io_read_base + (%1101)
; 128 - KEY_7
; 64 - KEY_6
; 32 - KEY_5
; 16 - KEY_4
; 8 - KEY_3
; 4 - KEY_2
; 2 - KEY_1
; 1 - KEY_0
gpio_in1 equ io_read_base + (%0101)
; 128 - KEY_F
; 64 - KEY_E
; 32 - KEY_D
; 16 - KEY_C
; 8 - KEY_B
; 4 - KEY_A
; 2 - KEY_9
; 1 - KEY_8
gpio_in2 equ io_read_base + (%0001)
; 128 - GPI4
; 64 - GPI3
; 32 - GPI2
; 16 - GPI1
; 8 - GPI0
; 4 - KEY_MINUS
; 2 - KEY_CLEAR
; 1 - KEY_ENTER

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

hop_save equ $FF
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
; 4 - urupt
; 2 - keyrupt
; 1 - trupt

; Settings on GPIO output port
gr_sign_r2 equ 1
gr_lamp_temp equ 2
gr_sign_r1 equ 4
gr_lamp_restart equ 8
gr_lamp_opr_err equ 16
gr_lamp_comp_acty equ 32
gr_int_inhibit equ 64
gr_flash_csb equ 128
