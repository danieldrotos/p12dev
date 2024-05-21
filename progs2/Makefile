PRJ		= ..

include $(PRJ)/sw/common.mk

AW		?= 16


all: pmonitor lib \
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
	rndtest \
	strtest \
	dtoitest


pmonitor:
	$(MAKE) -C $(PMON) pmon.p2h

lib:
	$(MAKE) -C $(LIB) all


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

strtest: strtest.p2h strtest.asc strtest.cdb

letest: letest.p2h letest.asc letest.cdb

letest.p2h: le_test.asm $(LIB)/fn_lined.asm $(LIB)/fn_pmon.asm
	php $(TOOLS)/p2as.php -l -o $@ $^

rndtest: rndtest.p2h rndtest.asc rndtest.cdb

rndtest.p2h: rnd_test.asm \
		$(LIB)/fn_div.p2o \
		$(LIB)/fn_rand.p2o \
		$(LIB)/fn_pmon.p2o
	php $(TOOLS)/p2as.php -l -o $@ $^


dtoitest: dtoitest.p2h dtoitest.asc dtoitest.cdb

dtoitest.p2h: dtoi_test.asm \
		$(LIB)/fn_isdigit.p2o \
		$(LIB)/fn_dtoi.p2o
	php $(TOOLS)/p2as.php -l -o $@ $^

clean:
	$(RM) *.hex *.p2h *.asc *.cdb *~ *.lst *.log pmon.cc
