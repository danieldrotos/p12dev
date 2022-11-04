PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk

all: simif_print counter array_sum ff2ir light1 light2 poll \
	shift_digit

simif_print: simif_print.hex simif_print.asc simif_print.cdb

shift_digit: shift_digit.hex shift_digit.asc shift_digit.cdb

counter: counter.hex counter.asc counter.cdb

array_sum: array_sum.hex array_sum.asc array_sum.cdb

ff2ir: ff2ir.hex ff2ir.asc ff2ir.cdb

light1: light1.hex light1.asc light1.cdb

light2: light2.hex light2.asc light2.cdb

poll: poll.hex poll.asc poll.cdb

.SUFFIXES: .hex .asm .asc .cdb

.asm.hex:
	php $(TOOLS)/p2as.php -l -o $@ $<

.hex.asc:
	php $(TOOLS)/hex2asc.php -- -m $(AW) $< >$@

.hex.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean:
	rm -f *.hex *.asc *.cdb *~ *.lst

wclean:
	del /f *.hex *.asc *.cdb *~ *.lst
