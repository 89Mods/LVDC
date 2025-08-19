	SECTION switch_mm
	PUBLIC load_mm_flash
	PUBLIC cmds_ret
	PUBLIC launch_cmd
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
	cdscurr
cmds_ret:
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
launch_cmd:
	STO +hop_save
	CLA +hop_save
	ADD bugfix
	STO return_backup
	
	CLA weh
	cdsspare
	STO @cmd_state
	CL
	STO @entry_mode
	CLA @r2_ent
	STO @next_cmd
	cdscurr
	
	HOP return_backup
return_backup:
	dd 0
weh:
	dd cmd_state_final
	ENDSECTION

	SECTION cmd_entry_handler
	PUBLIC cmd_entry_reset
	PUBLIC cmd_entry_update
	PUBLIC curr_keys
	PUBLIC curr_keys_diff
	PUBLIC keys_mod
	PUBLIC keys_sec
keys_mod equ 4
keys_sec equ 1
curr_mod equ keys_mod
curr_sec equ keys_sec
	org (curr_sec<<8)|(curr_mod<<12)
	dd 0 ; Spacer for interrupt vector
	; Reset cmd entry
	; Enter entry mode, clear R1, R2
	; Set to enter into R2 (Verb) initially
cmd_entry_reset:
	STO +hop_save
	CLA initial_r_s
	cdsspare
	STO @entry_mode ; Any non-zero value with a zero in the LSB will do
	STO @r_s_ent
	CL
	STO @r1_ent
	STO @r2_ent
	CLA @system_timer
	cdscurr
	STO entry_timeout
	
	HOP* cmds_ret
four:
	dd 4
initial_r_s:
	dd 8

	; Regularly called
	; Parses key inputs
	; If in CMD entry mode, allows data be entered into R1 or R2
cmd_entry_update:
	STO +hop_save
	CLA +hop_save
	ADD bugfix
	STO return_backup
	
	; Read keyboard
	PIO gpio_in2
	AND and_vals
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	STO curr_keys
	PIO gpio_in1
	AND and_vals
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	ADD curr_keys
	STO curr_keys
	PIO gpio_in0
	AND and_vals
	ADD curr_keys
	XOR gpio_inv_mask
	STO curr_keys
	; Obtain list of keys that transitioned from 0 to 1 since last call
	AND last_keys
	XOR curr_keys
	AND curr_keys
	STO curr_keys_diff
	
	; Skip entry parsing if not in entry mode
	cdsspare
	CLA @entry_mode
	cdscurr
	STO entry_mode_cpy
	TNZ parse_keys
	TRA update_skip
parse_keys:
	; Timeout
	CLA entry_timeout
	cdsspare
	RSU @system_timer
	cdscurr
	SUB entry_timeout_len
	TMI no_timeout
	cdsspare
	CL
	STO @entry_mode
	TRA update_skip
no_timeout:

	CLA key_enter
	AND curr_keys_diff
	TNZ enter_pressed
	TRA enter_not_pressed
enter_pressed:
	TRA reset_timeout
	CLA entry_mode_cpy
	AND one
	TNZ do_launch_cmd
	cdsspare
	CLA @r2_ent
	cdscurr
	SHL 2
	SHL 2
	SHL 1
	ADD cla_code
	STO self_mod0
	CDSS cmd_hop_table_mod,cmd_hop_table_sec
self_mod0:
	dd 0
	cdscurr
	TNZ cmd_code_good
	cdsspare
	CL
	STO @entry_mode
	cdscurr
	CLA opr_err
	HOP* gpio_set
	TRA update_skip
cmd_code_good:
	CLA opr_err_mask
	cdsspare
	AND @gpio_mirror
	STO @gpio_mirror
	PIO gpio_out
	PIO gpio_out
	cdscurr
	; Still entering VERB
	CLA one
	SHL 1
	cdsspare
	AND @r2_ent
	cdscurr
	TNZ needs_noun
	TRA do_launch_cmd
needs_noun:
	cdsspare
	CLA @r2_ent
	cdscurr
	XOR and_vals
	TNZ not_ff
	TRA do_launch_cmd
not_ff:
	CLA one
	ADD entry_mode_cpy
	STO entry_mode_cpy
	cdsspare
	STO @entry_mode
	cdscurr
	cdsspare
	CLA @r2_ent
	cdscurr
	AND four
	XOR four
	TNZ noun_not_signed
	CLA four
	ADD one
	TRA noun_signed
noun_not_signed:
	CLA four
noun_signed:
	cdsspare
	STO @r_s_ent
	TRA update_skip
do_launch_cmd:
	HOP* launch_cmd
	TRA update_skip
enter_not_pressed:

	; Don’t parse anything until the CLEAR and ENTER keys have been released
	CLA key_clear
	ADD key_enter
	AND curr_keys
	TNZ update_skip
	
	CLA and_vals+1
	AND curr_keys_diff
	TNZ has_changed_keys
	TRA no_changed_keys
has_changed_keys:
	TRA reset_timeout
	CLA one
	STO shifter
	CL
	STO counter
parse_loop:
	CLA shifter
	AND curr_keys_diff
	TNZ parse_loop_match
	TRA parse_loop_no_match
parse_loop_match:
	CLA counter
	TRA append_value
parse_loop_no_match:
	CLA counter
	ADD one
	STO counter
	CLA shifter
	SHL 1
	STO shifter
	XOR key_enter
	TNZ parse_loop
no_changed_keys:
	
	CLA key_minus
	AND curr_keys_diff
	XOR key_minus
	TNZ no_minus
	TRA reset_timeout
	cdsspare
	CLA @r2_ent
	cdscurr
	AND four
	XOR four
	TNZ no_minus
	CLA entry_mode_cpy
	AND one
	XOR one
	TNZ no_minus
	CLA one
	cdsspare
	RSU @r1_ent
	XOR @const_all_ones
	STO @r1_ent
	;cdscurr
no_minus:
	
update_skip:
	cdscurr
	CLA curr_keys
	STO last_keys
	HOP return_backup

	; Append value in A to whichever register is currently being entered into
append_value:
	STO +hop_save
	STO temp
	
	CLA entry_mode_cpy
	AND one
	TNZ append_r1
append_r2:
	cdsspare
	CLA @r2_ent
	SHL 2
	SHL 2
	cdscurr
	AND and_vals
	ADD temp
	cdsspare
	STO @r2_ent
	cdscurr
	HOP* cmds_ret
append_r1:
	cdsspare
	CLA @r1_ent
	SHL 2
	SHL 2
	cdscurr
	ADD temp
	cdsspare
	STO @r1_ent
	cdscurr
	HOP* cmds_ret

reset_timeout:
	STO +hop_save
	
	cdsspare
	CLA @system_timer
	cdscurr
	STO entry_timeout
	
	HOP* cmds_ret

temp:
	dd 0
counter:
	dd 0
curr_keys:
	dd 0
curr_keys_diff:
	dd 0
last_keys:
	dd 0
one:
	dd 1
shifter:
	dd 0
key_enter:
	dd $10000
key_clear:
	dd $20000
key_minus:
	dd $40000
return_backup:
	dd 0
entry_mode_cpy:
	dd 0
bugfix:
	dd 1<<7
cla_code:
	CLA @0
and_vals:
	dd $FF
	dd $FFFF
opr_err:
	dd gr_lamp_opr_err
opr_err_mask:
	dd ~gr_lamp_opr_err
gpio_inv_mask:
	dd $7FFFF
entry_timeout:
	dd 0
entry_timeout_len:
	dd 200
	ENDSECTION

	SECTION cmd_table
	PUBLIC cmd_hop_table
	PUBLIC cmd_hop_table_mod
	PUBLIC cmd_hop_table_sec
cmd_hop_table_mod equ 4
cmd_hop_table_sec equ 2
curr_mod equ cmd_hop_table_mod
curr_sec equ cmd_hop_table_sec
	org (curr_sec<<8)|(curr_mod<<12)
cmd_hop_table:
	dd 0 ; zero is always invalid
	HOPC cmd01_entry
	dd 0,0,0,0,0,0 ; 0
	dd 0,0,0,0,0,0,0,0 ; 8
	
	dd 0,0,0,0,0,0,0,0 ; 16
	dd 0,0,0,0,0,0,0,0 ; 24
	
	dd 0,0,0,0,0,0
	HOPC cmd26_entry
	dd 0 ; 32
	dd 0,0,0,0,0,0,0,0 ; 40
	
	dd 0,0,0,0,0
	HOPC cmd35_entry
	dd 0,0 ; 48
	dd 0,0,0,0,0,0,0,0 ; 56
	
	dd 0,0,0,0,0,0,0,0 ; 64
	dd 0,0,0,0,0,0,0,0 ; 72
	
	dd 0,0,0,0,0,0,0,0 ; 80
	dd 0,0,0,0,0,0,0,0 ; 88
	
	dd 0,0,0,0,0,0,0,0 ; 96
	dd 0,0,0,0,0,0,0,0 ; 104
	
	dd 0,0,0,0,0,0,0,0 ; 112
	dd 0,0,0,0,0,0,0,0 ; 120
	
	dd 0,0,0,0,0,0,0,0 ; 128
	dd 0,0,0,0,0,0,0,0 ; 136
	
	dd 0,0,0,0,0,0,0,0 ; 144
	dd 0,0,0,0,0,0,0,0 ; 152
	
	dd 0,0
	HOPC cmd_a2_entry
	dd 0,0,0,0,0 ; 160
	dd 0,0,0,0,0,0,0,0 ; 168
	
	dd 0,0,0,0,0,0,0,0 ; 176
	dd 0,0,0,0,0,0,0,0 ; 184
	dd 0,0,0,0,0,0,0,0 ; 192
	dd 0,0,0,0,0,0,0,0 ; 200
	dd 0,0,0,0,0,0,0,0 ; 208
	dd 0,0,0,0,0,0,0,0 ; 216
	dd 0,0,0,0,0,0,0,0 ; 224
	dd 0,0,0,0,0,0,0,0 ; 232
	dd 0,0,0,0,0,0,0,0 ; 240
	dd 0,0,0,0,0,0,0 ; 248
	HOPC cmd_ff_entry
	ENDSECTION

	SECTION cmds0
	PUBLIC cmd01_entry
	PUBLIC cmd26_entry
	PUBLIC cmd35_entry
	PUBLIC cmd_a2_entry
	PUBLIC cmd_ff_entry
curr_mod equ 4
curr_sec equ 3
	org (curr_sec<<8)|(curr_mod<<12)
	; VERB 01
	; NOP-command that instantly exits
	; Used to stop any running command and return to MM display
cmd01_entry:
	STO +hop_save
	
	cdsspare
	CL
	STO @cmd_act
	STO @next_cmd
	cdscurr
	
	HOP* cmds_ret

	; VERB 26
	; Monitor memory location
	; Enter key: next
	; Minus key: previous
cmd26_entry:
	STO +hop_save
	CLA +hop_save
	ADD bugfix
	STO return_backup
	cdsspare
	CLA @cmd_state
	cdscurr
	TNZ cmd26_not_initial
	CL
	STO cmd26_key_stuff
	STO cmd26_key_stuff+1
	cdsspare
	STO @r_s_cmd
	CLA @system_timer
	cdscurr
	STO cmd_last_time
	cdsspare
	CLA @r1_ent
	cdscurr
	STO curr_addr
	AND addr_check_mask
	TNZ cmd26_fail
	TRA cmd26_ret
cmd26_not_initial:
	CDSS keys_mod,keys_sec
	CLA @curr_keys_diff
	cdscurr
	STO temp
	AND key_enter
	XOR key_enter
	TNZ cmd26_enter_not_pressed
	CLA addr_check_mask
	STO cmd26_key_stuff
cmd26_enter_not_pressed:
	CLA temp
	AND key_minus
	XOR key_minus
	TNZ cmd26_minus_not_pressed
	CLA addr_check_mask
	STO cmd26_key_stuff+1
cmd26_minus_not_pressed:
	CLA cmd_last_time
	cdsspare
	XOR @system_timer
	cdscurr
	TNZ cmd26_update
	TRA cmd26_ret
cmd26_update:
	CLA cmd26_key_stuff
	XOR addr_check_mask
	TNZ cmd26_no_inc
	CL
	STO cmd26_key_stuff
	CLA curr_addr
	ADD one
	AND addr_mask
	STO curr_addr
cmd26_no_inc:
	CLA cmd26_key_stuff+1
	XOR addr_check_mask
	TNZ cmd26_no_dec
	CL
	STO cmd26_key_stuff+1
	CLA one
	RSU curr_addr
	AND addr_mask
	STO curr_addr
cmd26_no_dec:
	
	cdsspare
	CLA @system_timer
	cdscurr
	STO cmd_last_time
	CLA curr_addr
	cdsspare
	STO @r1_cmd
	cdscurr
	HOP* indirect_load
	cdsspare
	CLA @sub_ret
	STO @r2_cmd
	cdscurr
	
	TRA cmd26_ret
cmd26_fail:
	CLA cmd26_opr_err
	HOP* gpio_set
	cdsspare
	CL
	STO @cmd_act
	STO @next_cmd
	cdscurr
	;TRA cmd26_ret
cmd26_ret:
	HOP return_backup
curr_addr:
	dd $3FFFFFF
addr_check_mask:
	dd ~$7FFF
addr_mask:
	dd $7FFF
cmds_ret_hopc:
	HOPC cmds_ret
cmd26_opr_err:
	dd gr_lamp_opr_err
cmd26_key_stuff:
	dd 0
	dd 0
key_enter:
	dd $10000
key_minus:
	dd $40000
temp:
	dd 0
cmd_last_time:
	dd 0
one:
	dd 1
return_backup:
	dd 0
bugfix:
	dd 1<<7

	; VERB 35
	; Lamp test
cmd35_entry:
	STO +hop_save
	CLA +hop_save
	ADD bugfix
	STO return_backup
	
	cdsspare
	CLA @cmd_state
	TNZ cmd35_not_initial
	CLA @system_timer
	cdscurr
	STO cmd_last_time
cmd35_not_initial:
	cdscurr
	CLA cmd_last_time
	cdsspare
	RSU @system_timer
	cdscurr
	SUB cmd35_len
	TMI cmd35_continue
cmd35_exit:
	cdsspare
	CL
	STO @cmd_act
	STO @next_cmd
	cdscurr
	CLA cmd35_gpio_mask
	cdsspare
	XOR @const_all_ones
	AND @gpio_mirror
	STO @gpio_mirror
	PIO gpio_out
	PIO gpio_out
	cdscurr
	CLA cmd35_comp_acty
	HOP* gpio_set
	HOP return_backup
cmd35_continue:
	
	CLA lamp_test_val
	cdsspare
	STO @r2_cmd
	STO @r1_cmd
	CLA @cmd_state
	cdscurr
	XOR two
	TNZ cmd35_not_final
	TRA cmd35_exit
cmd35_not_final:
	CLA cmd35_blink_both
	cdsspare
	STO @r_s_cmd
	cdscurr
	CLA cmd35_comp_acty
	cdsspare
	XOR @const_all_ones
	AND @gpio_mirror
	STO @gpio_mirror
	PIO gpio_out
	PIO gpio_out
	cdscurr
	CLA cmd35_gpio_mask
	HOP* gpio_set

	HOP return_backup
lamp_test_val:
	dd $3888888
cmd35_len:
	dd 56
cmd35_blink_both:
	dd 12
two:
	dd 2
cmd35_gpio_mask:
	dd gr_lamp_temp+gr_lamp_restart+gr_lamp_opr_err
cmd35_comp_acty:
	dd gr_lamp_comp_acty

	; VERB A2
	; Change Major Mode
cmd_a2_entry:
	STO +hop_save
	CLA +hop_save
	ADD bugfix
	STO return_backup
	cdsspare
	CLA @r1_ent
	cdscurr
	AND mm_check_mask
	TNZ cmd26_fail
	
	HOP cmd26_ret
mm_check_mask:
	dd ~$FF

	; VERB FF
	; Soft reset
cmd_ff_entry:
	CLA timer_deact
	PIO settings_reg
	CLA i_set
	HOP* gpio_set
	HOP* $0000
timer_deact:
	dd (1 << 3) | (1 << 0) | (1 << 1) | (1 << 2)
i_set:
	dd gr_int_inhibit

	ENDSECTION
