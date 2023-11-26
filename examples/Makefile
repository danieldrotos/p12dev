PRJ		= ..
TOOLS		= $(PRJ)/tools
LIB		= $(PRJ)/lib

include $(PRJ)/prj.mk
AW		?= 17

all: \
	simif_print \
	simif_print2 \
	counter \
	counter2 \
	array_sum \
	array_sum2 \
	ff2ir \
	ff2ir2 \
	light1 \
	light12 \
	light2 \
	light22 \
	poll \
	poll2 \
	shift_digit \
	blink_fr2


simif_print: simif_print.p2h simif_print.asc simif_print.cdb

simif_print2: simif_print2.p2h simif_print2.asc simif_print2.cdb

shift_digit: shift_digit.p2h shift_digit.asc shift_digit.cdb

counter: counter.p2h counter.asc counter.cdb

counter2: counter2.p2h counter2.asc counter2.cdb

array_sum: array_sum.p2h array_sum.asc array_sum.cdb

array_sum2: array_sum2.p2h array_sum2.asc array_sum2.cdb

ff2ir: ff2ir.p2h ff2ir.asc ff2ir.cdb

ff2ir2: ff2ir2.p2h ff2ir2.asc ff2ir2.cdb

light1: light1.p2h light1.asc light1.cdb

light12: light12.p2h light12.asc light12.cdb

light2: light2.p2h light2.asc light2.cdb

light22: light22.p2h light22.asc light22.cdb

poll: poll.p2h poll.asc poll.cdb

poll2: poll2.p2h poll2.asc poll2.cdb


blink_fr2: blink_fr2.p2h blink_fr2.cdb

blink_fr2.p2h: blink_fr2.asm \
		$(LIB)/fn_pmon.asm \
		$(LIB)/fn_io.asm \
		$(LIB)/fn_lined.asm \
		$(LIB)/fn_div.asm \
		$(LIB)/fn_pressed.asm
	php $(TOOLS)/p2as.php -l -o $@ $^


.SUFFIXES: .p2h .asm .asc .cdb

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	php $(TOOLS)/hex2asc.php -m $(AW) $< >$@

.p2h.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

ifeq ($(OS),Windows_NT)
RM		= del /f /q
RMR		= del /f /s /q
else
RM		= rm -f
RMR		= rm -f -r
endif

clean:
	$(RM) *.hex *.p2h *.asc *.cdb *~ *.lst
