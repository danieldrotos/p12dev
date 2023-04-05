PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk
AW		?= 17

all: pmon_app \
	counter2 \
	uart \
	uart2 \
	test \
	regsave

counter2: counter2.p2h counter2.asc counter2.cdb

uart: uart.p2h uart.asc uart.cdb

uart2: uart2.p2h uart2.asc uart2.cdb

regsave: regsave.p2h regsave.asc regsave.cdb

pmon_app: pmon.p2h pmon.asc pmon.cdb pmon.cc
	#grep '^L' pmon.cdb|grep the_end|awk '-F:' '{print $$NF}'

pmon.cc: pmon.p2h
	php $(TOOLS)/hex2c.php $< >$@

test: test.p2h test.asc test.cdb

.SUFFIXES: .p2h .asm .asc .cdb .cc

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	php $(TOOLS)/hex2asc.php -m $(AW) pmon.p2h $< >$@

.p2h.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean:
	rm -f *.hex *.p2h *.asc *.cdb *~ *.lst pmon.cc

wclean:
	del /f *.hex *.p2h *.asc *.cdb *~ *.lst pmon.cc
