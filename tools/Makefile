all: test2.asc test2.cdb

test2.p2h: test2.asm p2as.php
	php p2as.php $< -l -o $@

test2.asc: test2.p2h hex2asc.php
	php hex2asc.php $< >$@

test2.cdb: test2.p2h hex2cdb.php
	php hex2cdb.php $< >$@

ifeq ($(OS),Windows_NT)
	RM=del /f /q
	RMR=del /f /s /q
else
	RM=rm -f
	RMR=rm -f -r
endif

clean:
	$(RM) *~ *.cdb *.hex *.p2h *.asc *.lst
