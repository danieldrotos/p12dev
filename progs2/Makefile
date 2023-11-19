PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk
AW		?= 17

all: pmon_app \
	counter2 \
	counter3 \
	uart \
	uart2 \
	test \
	regsave \
	msblink2 \
	div \
	ff \
	game \
	bufout \
	letest \
	dtoitest


counter2: counter2.p2h counter2.asc counter2.cdb

counter3: counter3.p2h counter3.asc counter3.cdb

uart: uart.p2h uart.asc uart.cdb

uart2: uart2.p2h uart2.asc uart2.cdb

regsave: regsave.p2h regsave.asc regsave.cdb

pmon_app: pmon.p2h pmon.asc pmon.cdb pmon.cc pmon_chip.asc
#	grep '^L' pmon.cdb|grep the_end|awk '-F:' '{print $$NF}'

msblink2: msblink2.p2h msblink2.asc msblink2.cdb

pmon.cc: pmon.p2h
	php $(TOOLS)/hex2c.php $< >$@

pmon_chip.asc: pmon.p2h
	php $(TOOLS)/hex2asc.php -m 17 -c 0xf000 -cs 4096 $< >$@

test: test.p2h test.asc test.cdb

div: div.p2h div.asc div.cdb

ff: ff.p2h ff.asc ff.cdb

game: game.p2h game.asc game.cdb

bufout: bufout.p2h bufout.asc bufout.cdb

letest: letest.p2h letest.asc letest.cdb

letest.p2h: le_test.asm fn_lined.asm
	php $(TOOLS)/p2as.php -l -o $@ $^

dtoitest: dtoitest.p2h dtoitest.asc dtoitest.cdb

dtoitest.p2h: dtoi_test.asm fn_dtoi.asm
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
