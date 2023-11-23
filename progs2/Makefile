PRJ		= ..
TOOLS		= $(PRJ)/tools
PMON		= $(PRJ)/pmon
LIB		= $(PRJ)/lib

include $(PRJ)/prj.mk
AW		?= 17

all: pmonitor \
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
	letest

pmonitor:
	$(MAKE) -C $(PMON) pmon.p2h

counter2: counter2.p2h counter2.asc counter2.cdb

counter3: counter3.p2h counter3.asc counter3.cdb

uart: uart.p2h uart.asc uart.cdb

uart2: uart2.p2h uart2.asc uart2.cdb

regsave: regsave.p2h regsave.asc regsave.cdb

msblink2: msblink2.p2h msblink2.asc msblink2.cdb

test: test.p2h test.asc test.cdb

div: div.p2h div.asc div.cdb

ff: ff.p2h ff.asc ff.cdb

game: game.p2h game.asc game.cdb

bufout: bufout.p2h bufout.asc bufout.cdb

letest: letest.p2h letest.asc letest.cdb

letest.p2h: le_test.asm $(LIB)/fn_lined.asm
	php $(TOOLS)/p2as.php -l -o $@ $^

.SUFFIXES: .p2h .asm .asc .cdb .cc

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	php $(TOOLS)/hex2asc.php -m $(AW) $(PMON)/pmon.p2h $< >$@

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
