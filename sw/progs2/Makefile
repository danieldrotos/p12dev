PRJ		= ../..

include $(PRJ)/sw/common.mk

AW		?= 16

PLIB		= $(LIB)/plib.p2l

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
	le_test \
	rnd_test \
	strtest.asc strtest.cdb \
	dtoi_test \
	bugtest


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

#strtest: strtest.p2h strtest.asc strtest.cdb

strtest.p2h: strtest.asm $(PLIB)

le_test: le_test.p2h le_test.asc le_test.cdb

rnd_test: rnd_test.p2h rnd_test.asc rnd_test.cdb

bugtest: bugtest.p2h bugtest.asc bugtest.cdb

dtoi_test: dtoi_test.p2h dtoi_test.asc dtoi_test.cdb


clean:
	$(RM) *.hex *.p2h *.asc *.cdb *~ *.lst *.log pmon.cc
