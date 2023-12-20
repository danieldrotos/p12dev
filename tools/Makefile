PRJ		= ..
TOOLS		= .
LIB		= $(PRJ)/lib
PMON		= $(PRJ)/pmon

include $(PRJ)/common.mk

all: test2.asc test2.cdb test3

test2.p2h: test2.asm p2as.php
	php p2as.php $< -l -dd -o $@

test2.asc: test2.p2h hex2asc.php
	php hex2asc.php $< >$@

test2.cdb: test2.p2h hex2cdb.php
	php hex2cdb.php $< >$@

test3: test3.asm $(LIB)/fn_div.p2o
	php p2as.php -l -dd $^

clean:
	$(RM) *~ *.cdb *.hex *.p2h *.asc *.lst
