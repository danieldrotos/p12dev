PRJ		= ..

include $(PRJ)/common.mk

all: mk_libs test2.asc test2.cdb test3

mk_libs:
	$(MAKE) -C $(LIB) all

test2.p2h: test2.asm p2as.php
	php p2as.php $< -l -dd -o $@

test2.asc: test2.p2h hex2asc.php
	php hex2asc.php $< >$@

test2.cdb: test2.p2h hex2cdb.php
	php hex2cdb.php $< >$@

TEST3_LIBS	= fn_div
TEST3_LIBS_FN	= $(addprefix $(LIB)/,$(addsuffix .p2o,$(TEST3_LIBS)))

test3: test3.p2h

test3.p2h: p2as.php test3.asm $(TEST3_LIBS_FN)
	php p2as.php -l -dd test3.asm $(TEST3_LIBS_FN)

clean:
	$(RM) *~ *.cdb *.hex *.p2h *.asc *.lst *.log
