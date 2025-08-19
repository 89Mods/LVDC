	SECTION sys_entry
curr_mod equ 3
curr_sec equ 0
	org (curr_sec<<8)|(curr_mod<<12)
start:
	cdsspare
	CL
	STO @cmd_act
	STO @next_cmd
	STO @cmd_state
	STO @entry_mode
	STO @r1_mm
	STO @r2_mm
	STO @r_s_mm
	STO @system_timer
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
	
	CLA initial_gpio
	PIO gpio_out
	cdsspare
	STO @gpio_mirror
	cdscurr
	CLA timer_act
	PIO settings_reg
	
loop:
	;TRA inc_counter
	;CLA led_gpio
	;cdsspare
	;STO @gpio_mirror
	;PIO gpio_out
	;cdscurr
	;TRA delay_sub
	TRA inc_counter
	;CLA initial_gpio
	;cdsspare
	;STO @gpio_mirror
	;PIO gpio_out
	;cdscurr
	
	HOP mm_hopc
	
;	cdsspare
;	CLA @system_timer
;	cdscurr
;	XOR last_key_time
;	TNZ timer_changed
;	TRA timer_did_not_change
;timer_changed:
	HOP* cmd_entry_update
;	cdsspare
;	CLA @system_timer
;	cdscurr
;	STO last_key_time
;timer_did_not_change:
	
	; Update current command
	cdsspare
	CLA @cmd_act
	cdscurr
	TNZ has_cmd_act
	TRA no_cmd_act
has_cmd_act:
	SHL 2
	SHL 2
	SHL 1
	ADD cla_code
	STO self_mod0
	CDSS cmd_hop_table_mod,cmd_hop_table_sec
self_mod0:
	dd 0
	cdscurr
	TNZ hop_valid
	TRA hop_invalid
hop_valid:
	cdsspare
	CLA @cmd_act
	cdscurr
	SHL 2
	SHL 2
	SHL 1
	ADD hop_code
	STO self_mod1
	CDSS cmd_hop_table_mod,cmd_hop_table_sec
self_mod1:
	dd 0
	cdsspare
	CLA @cmd_state
	cdscurr
	TNZ cmd_state_not_initial
	CLA running_state
	cdsspare
	STO @cmd_state
	cdscurr
cmd_state_not_initial:
hop_invalid:
	
no_cmd_act:
	; IF cmd_state is cmd_state_final OR cmd_act is zero AND next_cmd is NOT zero
	; THEN cmd_state = cmd_state_initial, cmd_act = next_cmd, next_cmd = zero
	cdsspare
	CLA @cmd_state
	cdscurr
	XOR cmd_fin
	TNZ cond2_check
update_cmd:
	CLA cmd_init
	cdsspare
	STO @cmd_state
	CLA @next_cmd
	cdscurr
	; This makes it so that a non-zero value that has only bits > 256 in next_cmd actually result in cmd_act becoming 0 (inactive) after still doing cmd_state_final on the current running cmd.
	AND and_vals
	cdsspare
	STO @cmd_act
	CL
	STO @next_cmd
	STO @r1_cmd
	STO @r2_cmd
	STO @r_s_cmd
	cdscurr
	TRA dont_update_cmd
cond2_check:
	cdsspare
	CLA @cmd_act
	cdscurr
	TNZ dont_update_cmd
	cdsspare
	CLA @next_cmd
	cdscurr
	TNZ update_cmd
dont_update_cmd:
	
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
cla_code:
	CLA @0
hop_code:
	HOP @0
cmd_init:
	dd cmd_state_initial
cmd_fin:
	dd cmd_state_final
last_key_time:
	dd 0

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
	dd gr_flash_csb + gr_lamp_comp_acty
delay_len:
	dd $10000
one:
	dd 1
running_state:
	dd cmd_state_running
counter:
	dd 0
bugfix:
	dd 1<<7
and_vals:
	dd $FF
timer_act:
	dd (1 << 3) | (1 << 4) | (1 << 0) | (1 << 1) | (1 << 2)
zero:
	dd 0
all_ones:
	dd $FFFFFFFF

	ENDSECTION
