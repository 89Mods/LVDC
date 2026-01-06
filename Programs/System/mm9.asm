	include "common_defines.asm"
	SECTION mm_entry
curr_mod equ 1
curr_sec equ 0
	org (curr_sec<<8)|(curr_mod<<12)
mm9_entry:
	STO +hop_save
	CLA +hop_save
	ADD bugfix
	STO return_backup
	CLA mm_disp
	cdsspare
	STO @curr_mm
	cdscurr
	
update_leds:
	; Start frame
	CLA led_zeroes
	PIO spi_dout
	PIO spi_dout
	PIO spi_dout
	PIO spi_dout
	CLA num_leds
	STO loop_i
	CLA time_color_index
	STO loop_color_index
leds_loop:
	CLA loop_color_index
	STO led_color_final
	TRA color_function
	CLA led_color_final
	STO led_r
	CLA loop_color_index
	ADD led_color_rising
	STO led_color_final
	TRA color_function
	CLA led_color_final
	STO led_g
	CLA loop_color_index
	ADD led_color_rising
	ADD led_color_rising
	STO led_color_final
	TRA color_function
	CLA led_color_final
	STO led_b
	; Send computed color
	CLA led_brightness
	PIO spi_dout
	CLA led_b
	AND and_mask
	ADD leds_spi_offset
	PIO spi_dout
	CLA led_r
	AND and_mask
	ADD leds_spi_offset
	PIO spi_dout
	CLA led_g
	AND and_mask
	ADD leds_spi_offset
	PIO spi_dout
	CLA loop_color_index
	ADD func_offset_per_led
	STO loop_color_index
	CLA loop_i
	SUB one
	STO loop_i
	TNZ leds_loop
	; End frame
	CLA led_ones
	PIO spi_dout
	PIO spi_dout
	PIO spi_dout
	PIO spi_dout
	CLA time_color_index
	ADD func_offset_per_time
	STO time_color_index
	
	cdscurr
	HOP return_backup

color_function:
	STO +hop_save
	CLA led_color_final
	AND and_mask+1
	STO led_color_final
	SUB led_color_falling
	TMI color_function_cont
	TRA color_function_zero
color_function_cont:
	CLA led_color_final
	SUB led_color_rising
	TMI color_function_nonadjust
	RSU led_color_rising
	TRA color_function_adjusted
color_function_nonadjust:
	CLA led_color_final
color_function_adjusted:
	; Divide value in accumulator by 6
	STO div_temp
	CL
	STO led_color_final
	CLA div_loop_end
	STO div_loop_i
color_function_div_loop:
	CLA led_color_final
	SHL 1
	STO led_color_final
	CLA div_temp
	SHL 1
	STO div_temp
	SUB div_compval
	TMI color_function_div_cont
	STO div_temp
	CLA led_color_final
	ADD one
	STO led_color_final
color_function_div_cont:
	CLA div_loop_i
	SUB one
	STO div_loop_i
	TNZ color_function_div_loop
color_function_ret:
	CLA +hop_save
	ADD bugfix
	STO +0
	HOP +0
color_function_zero:
	CL
	STO led_color_final
	TRA color_function_ret

return_backup:
	dd 0
bugfix:
	dd 1<<7
mm_disp:
	dd $09
led_zeroes:
	dd $00+spi_leds_left
led_ones:
	dd $FF+spi_leds_left
loop_i:
	dd $00
loop_color_index:
	dd 0
time_color_index:
	dd 0
num_leds:
	dd 60
one:
	dd 1
led_r:
	dd 0
led_g:
	dd 0
led_b:
	dd 0
led_color_final:
	dd 0
led_brightness:
	dd $FE+spi_leds_left
leds_spi_offset:
	dd spi_leds_left
and_mask:
	dd $FF
	dd $FFF
div_compval:
	dd $6000
div_loop_i:
	dd 0
div_loop_end:
	dd $12
div_temp:
	dd 0
func_offset_per_led:
	dd 100
func_offset_per_time:
	dd 1
led_color_rising:
	dd 1365
led_color_falling:
	dd 2730
	ENDSECTION
