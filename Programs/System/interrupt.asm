	SECTION interrupt
	PUBLIC interrupt_handler_loop
	PUBLIC clear_trupt
	PUBLIC clear_keyrupt
	PUBLIC clear_rrupt
	PUBLIC interrupt_handler_loop_hopc
curr_mod equ 2
curr_sec equ 0
	org (curr_sec<<8)|(curr_mod<<12)
interrupt:
	STO +hop_save
	
	; Lets see - why are we here?
	; Loop until there are no more interrupts left to handle
interrupt_handler_loop:
	cdscurr
	PIO status_read
	AND clear_trupt
	TNZ enter_trupt_handler
	PIO status_read
	AND clear_keyrupt
	TNZ enter_keyrupt_handler
	PIO status_read
	AND clear_rrupt
	TNZ enter_rrupt_handler
	TRA iret
enter_trupt_handler:
	HOP* trupt_handler
enter_keyrupt_handler:
	HOP* keyrupt_handler
enter_rrupt_handler:
	HOP* rrupt_handler

iret:
	CLA bugfix
	CDSS 0,1
	ADD +hop_save
	STO +0
	PIO intclr
	PIO intclr
	HOP +0
bugfix:
	dd 1<<7

clear_trupt:
	dd (1 << 1)
clear_keyrupt:
	dd (1 << 0)
clear_rrupt:
	dd (1 << 2)
interrupt_handler_loop_hopc:
	HOPC interrupt_handler_loop, curr_mod, curr_sec

	ENDSECTION

	SECTION trupt_handler
	PUBLIC trupt_handler
curr_mod equ 2
curr_sec equ 1
	org (curr_sec<<8)|(curr_mod<<12)
	dd 0 ; Spacer for interrupt vector
trupt_handler:

	; UPDATE DISPLAY
	; Toggle blink_state every few interrupts
	CLA blink_counter
	ADD one
	STO blink_counter
	XOR blink_counter_targ
	TNZ no_blink
	CL
	STO blink_counter
	CLA blink_state
	XOR one
	STO blink_state
no_blink:
	; Determine what should be displayed
	cdsspare
	CLA @entry_mode
	TNZ mod1
	TRA not_entry_mode
mod1:
	cdscurr
	CLA offset_entry
	TRA regs_selected
not_entry_mode:
	CLA @cmd_act
	TNZ mod2
	TRA not_cmd_act
mod2:
	cdscurr
	CL
	TRA regs_selected
not_cmd_act:
	; from major mode
	cdscurr
	CLA offset_mm
regs_selected:
	; Weird self-modifying code to do indexed addressing
	; using the offset in the accumulator
	ADD indexed_base
	STO selfmod_0
	ADD offset_one
	STO selfmod_1
	ADD offset_one
	STO selfmod_2
	cdsspare
selfmod_0:
	CLA @0
	cdscurr
	STO r1_temp
	cdsspare
selfmod_1:
	CLA @0
	cdscurr
	STO r2_temp
	cdsspare
selfmod_2:
	CLA @0
	cdscurr
	STO r_s_temp
	
	; TODO: prepare_regs_signed
	
	CLA r1_temp
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
	
	CLA r2_temp
	PIO r2_lo
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	SHR 2
	PIO r2_hi

	; TODO: blink effects
	
	cdsspare
	CLA @curr_mm
	cdscurr
	SHL 2
	SHL 2
	SHL 2
	SHL 2
	ADD mm_change
	PIO settings_reg
	
	CDSS 2,0
	CLA @clear_trupt
	PIO settings_reg
	HOP @interrupt_handler_loop_hopc

blink_counter:
	dd 0
blink_counter_targ:
	dd 3
one:
	dd 1
mm_change:
	dd r_chg_mm
blink_state:
	dd 0
r1_temp:
	dd 0
r2_temp:
	dd 0
r_s_temp:
	dd 0
offset_mm:
	dd 3<<5
offset_entry:
	dd 6<<5
offset_one:
	dd 1<<5
indexed_base:
	CLA @0

	ENDSECTION

	SECTION keyrupt_handler
	PUBLIC keyrupt_handler
curr_mod equ 2
curr_sec equ 2
	org (curr_sec<<8)|(curr_mod<<12)
keyrupt_handler:

	CDSS 2,0
	CLA @clear_keyrupt
	PIO settings_reg
	HOP @interrupt_handler_loop_hopc

	ENDSECTION

	SECTION rrupt_handler
	PUBLIC rrupt_handler
curr_mod equ 2
curr_sec equ 3
	org (curr_sec<<8)|(curr_mod<<12)
rrupt_handler:

	CDSS 2,0
	CLA @clear_rrupt
	PIO settings_reg
	HOP @interrupt_handler_loop_hopc

	ENDSECTION
