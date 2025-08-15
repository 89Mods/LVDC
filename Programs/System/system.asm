	SECTION sys_entry
curr_mod equ 3
curr_sec equ 0
	org (curr_sec<<8)|(curr_mod<<12)
start:
	cdsspare
	CL
	STO @cmd_act
	STO @entry_mode
	STO @r1_mm
	STO @r2_mm
	STO @r_s_mm
	; Set up spare sector constants
	cdscurr
	CLA flash_csb
	cdsspare
	STO @const_gr_flash_csb
	cdscurr
	CL
	SUB one
	cdsspare
	STO @const_all_ones
	cdscurr
	
	CLA initial_gpio
	ADD intr_disable
	PIO gpio_out
	cdsspare
	STO @gpio_mirror
	cdscurr
	CL
	HOP* load_mm_flash ; Load MM 0 code
	
	CLA timer_act
	PIO settings_reg
	CLA initial_gpio
	PIO gpio_out
	cdsspare
	STO @gpio_mirror
	cdscurr
	
loop:
	TRA inc_counter
	CLA led_gpio
	PIO gpio_out
	TRA delay_sub
	TRA inc_counter
	CLA initial_gpio
	PIO gpio_out
	TRA delay_sub
	
	HOP mm_hopc
	
	TRA loop

mm_hopc:
	dd %10000000100000000000000000
delay_sub:
	STO +hop_save
	CLA delay_len
delay_loop_1:
	SUB one
	TNZ delay_loop_1
ret:
	CLA bugfix
	ADD +hop_save
	STO +0
	HOP +0
	
inc_counter:
	STO +hop_save
	CLA counter
	ADD one
	STO counter
	cdsspare
	STO @r2_mm
	cdscurr
	TRA ret
	
intr_disable:
	dd gr_int_inhibit
flash_csb:
	dd gr_flash_csb
initial_gpio:
	dd gr_lamp_opr_err + gr_flash_csb + gr_lamp_comp_acty
led_gpio:
	dd gr_flash_csb + gr_lamp_comp_acty
delay_len:
	dd $10000
one:
	dd 1
counter:
	dd 0
bugfix:
	dd 1<<7
timer_act:
	dd (1 << 3) | (1 << 4) | (1 << 0) | (1 << 1) | (1 << 2)

	ENDSECTION
