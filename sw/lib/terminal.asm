	.proc	p2
	
	;;
	;;      tu_save_cursor    ()
	;;      tu_restore_cursor ()
	;;      tu_hide           ()
	;;      tu_show           ()
	;;      tu_clear_screen   ()
	;;      tu_clear_char     ()
	;;      tu_go_left        (R0:n)
	;;      tu_go_right       (R0:n)
	;;      tu_go_up          (R0:n)
	;;      tu_go_down        (R0:n)
	;;      tu_go             (R0:x1,R1:y1)
	;;      tu_color          (R0:bg,R1:fg)
	;;      tu_fg             (R0:fg)
	;;      tu_bg             (R0:bg)
	;;      tu_wob            ()
	;;      tu_bow            ()
	;;      tu_gob            ()
	;;


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_tu_input

TU_UP		==	-1
TU_DOWN		==	-2
TU_LEFT		==	-3
TU_RIGHT	==	-4
TU_HOME		==	-5
TU_END		==	-6
TU_PGUP		==	-7
TU_PGDOWN	==	-8
TU_DEL		==	-9
TU_F1		==	-10
TU_F2		==	-11
TU_F3		==	-12
TU_F4		==	-13
TU_F5		==	-14
TU_F6		==	-15
TU_F7		==	-16
TU_F8		==	-17
TU_F9		==	-18
TU_F10		==	-19
TU_F11		==	-20
TU_F12		==	-21
TU_INS		==	-22

tu_proc_esc::	.db	1	; bool if esc to be processed
tu_esc_buflen:	.db	0	; esc buffer
tu_esc_buffer:	.ds	100	; chars in esc buffer
	

	;; In : R0 proc_esc
	;; Out: R4 char (or 0), F.C
tu_cin::
	push	lr
	push	r0
	call	input_avail
	NC jmp	tc_false
	call	read
	sz	R0
	FALSE	tc_true
tc_handle_esc:
	call	ti_process_char
	jmp	tc_ret
tc_false:
	mvzl	r4,0
	clc
	jmp	tc_ret
tc_true:
	sec
tc_ret:	
	pop	r0
	pop	pc


	;; In : R4 char
	;; Out: R4 char (or 0), F.C
ti_process_char:
	push	lr
	push	r0
	push	r1
	ld	r0,tu_esc_buflen
	sz	r0
	jnz	tipc_not_empty
tipc_empty:
	cmp	r4,27
	jz	tipc_store
tipc_empty_non_esc:	
	jmp	tipc_true
tipc_store:
tipc_notempty:			; store
	mvzl	r1,tu_esc_buffer
	st	r4,r0+,r1
	st	r0,tu_esc_buflen
	
tipc_true:
	mvzl	r0,0
	st	r0,tu_esc_buflen
	sec
	jmp	tipc_ret
tipc_false:
	clc
tipc_ret:
	pop	r1
	pop	r0
	pop	pc

	
	;; In : -
	;; Out: R4 char (or 0), F.C
tu_getc::
tu_getch::
	push	lr
	push	r0
	mvzl	r0,1
	call	tu_cin
	pop	r0
	pop	pc

	
	;; In : -
	;; Out: -
tu_raw::
	push	r0
	mvzl	r0,0
	st	r0,tu_proc_esc
	pop	r0
	ret

	
	;; In : -
	;; Out: -
tu_coocked::
	push	r0
	mvzl	r0,1
	st	r0,tu_proc_esc
	pop	r0
	ret

	
	;; In : -
	;; Out: R4 if raw, F.C
tu_is_raw::
	ld	r4,tu_proc_esc
	sz	r4
	Z clc
	NZ sec
	ret
	
	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_tu_cursor

tu_save_cursor::
	push	lr
	ces	eprints
	.db	"\e[s"
	pop	pc

	
tu_restore_cursor::
	push	lr
	ces	eprints
	.db	"\e[u"
	pop	pc


tu_hide::
	push	lr
	ces	eprints
	.db	"\e[?25l"
	pop	pc


tu_show::
	push	lr
	ces	eprints
	.db	"\e[?25h"
	pop	pc
	
	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_tu_clear

tu_clear_screen::
	push	lr
	ces	eprints
	.db	"\e[2J\e[1;1H"	
	pop	pc


tu_clear_char::
	push	lr
	ces	eprints
	.db	"\e[s \e[u"
	pop	pc
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_tu_moving

	;; In : R0 distance
tu_go_left::
	push	lr
	push	r1
	mov	r1,r0
	ces	eprintf
	.db	"\e[%dD"
	pop	r1
	pop	pc


	;; In : R0 distance
tu_go_right::
	push	lr
	push	r1
	mov	r1,r0
	ces	eprintf
	.db	"\e[%dC"
	pop	r1
	pop	pc


	;; In : R0 distance
tu_go_up::
	push	lr
	push	r1
	mov	r1,r0
	ces	eprintf
	.db	"\e[%dA"
	pop	r1
	pop	pc


	;;  In : R0 distance
tu_go_down::
	push	lr
	push	r1
	mov	r1,r0
	ces	eprintf
	.db	"\e[%dB"
	pop	r1
	pop	pc


	;; In : R0 X1
	;;      R1 Y1
tu_go::
	push	lr
	push	r1
	push	r2
	mov	r2,r0
	ces	eprintf
	.db	"\e[%d;%dH"
	pop	r2
	pop	r1
	pop	pc

	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_tu_color

_tu_bg_color:
	ds	1
_tu_fg_color:
	ds	1
	
	;; In : R0 bg 0-15, R0<0 do not change
	;;      R1 fg 0-15, R1<0 do not change
tu_color::
	push	lr
	push	r0
	push	r1
	
	sz	r1
	S1 jmp	set_bg
set_fg:
	btst	r1,15
	test	r1,8
	Z plus	r1,30
	NZ plus	r1,82
	st	r1,_tu_fg_color
	ces	eprintf
	.db	"\e[%dm"
set_bg:
	sz	r0
	S1 jmp	end
	btst	r0,15
	test	r0,8
	Z plus	r0,40
	NZ plus	r0,92
	mov	r1,r0
	st	r1,_tu_bg_color
	ces	eprintf
	.db	"\e[%dm"
end:
	pop	r1
	pop	r0
	pop	pc


	;; In : R0 color 0-15
tu_fg::
	push	lr
	push	r0
	push	r1
	mov	r1,r0
	mvs	r0,-1
	call	tu_color
	pop	r1
	pop	r0
	pop	pc


	;; In : R0 color 0-15
tu_bg::
	push	lr
	push	r0
	push	r1
	mvs	r1,-1
	call	tu_color
	pop	r1
	pop	r0
	pop	pc


	;; white on black
tu_wob::
	push	lr
	ces	eprints
	.db	"\e[37;40m"
	pop	pc


	;; black on white
tu_bow::
	push	lr
	ces	eprints
	.db	"\e[30;47m"
	pop	pc


	;; green on black
tu_gob::
	push	lr
	ces	eprints
	.db	"\e[32;40m"
	pop	pc

	.ends
	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
