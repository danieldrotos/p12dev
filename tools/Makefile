TOOLS		= .

all: test2.asc test2.cdb test3

test2.p2h: test2.asm p2as.php
	php p2as.php $< -l -dd -o $@

test2.asc: test2.p2h hex2asc.php
	php hex2asc.php $< >$@

test2.cdb: test2.p2h hex2cdb.php
	php hex2cdb.php $< >$@

test3: test3.asm ../lib/fn_div.asm
	php p2as.php -l -dd test3.asm ../lib/fn_div.p2h

ifeq ($(OS),Windows_NT)
RM		= del /f /q
RMR		= del /f /s /q
else
RM		= rm -f
RMR		= rm -f -r
endif


.SUFFIXES: .asm .v .asc .cdb .p2h

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	$(MAKE) -C pmon pmon.p2h
	php $(TOOLS)/hex2asc.php -m $(AW) pmon/pmon.p2h $< >$@

.p2h.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean:
	$(RM) *~ *.cdb *.hex *.p2h *.asc *.lst
