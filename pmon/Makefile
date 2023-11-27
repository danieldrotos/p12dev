PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk
AW		?= 16

all: pmon_app dtoitest

pmon_app: pmon.p2h pmon.asc pmon.cdb pmon.cc pmon_chip.asc
#	grep '^L' pmon.cdb|grep the_end|awk '-F:' '{print $$NF}'

pmon.p2h: pmon.asm fn_dtoi.asm fn_isdigit.asm eof_pmon.asm
	php $(TOOLS)/p2as.php -l -o $@ $^

pmon.cc: pmon.p2h
	php $(TOOLS)/hex2c.php $< >$@

pmon_chip.asc: pmon.p2h
	php $(TOOLS)/hex2asc.php -m 17 -c 0xf000 -cs 4096 $< >$@

dtoitest: dtoitest.p2h dtoitest.asc dtoitest.cdb

dtoitest.p2h: dtoi_test.asm fn_isdigit.asm fn_dtoi.asm
	php $(TOOLS)/p2as.php -l -o $@ $^


.SUFFIXES: .p2h .asm .asc .cdb .cc

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	php $(TOOLS)/hex2asc.php -m $(AW) pmon.p2h $< >$@

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
	$(RM) *.hex *.p2h *.asc *.cdb *~ *.lst pmon.cc
