PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk

all: simif_print2 counter2 array_sum2 ffir2 light12 light22 poll2 \
	uart uart2 test pmon_app regsave test2

simif_print2: simif_print2.p2h simif_print2.asc simif_print2.cdb

counter2: counter2.p2h counter2.asc counter2.cdb

array_sum2: array_sum2.p2h array_sum2.asc array_sum2.cdb

ffir2: ffir2.p2h ffir2.asc ffir2.cdb

light12: light12.p2h light12.asc light12.cdb

light22: light22.p2h light22.asc light22.cdb

poll2: poll2.p2h poll2.asc poll2.cdb

uart: uart.p2h uart.asc uart.cdb

uart2: uart2.p2h uart2.asc uart2.cdb

regsave: regsave.p2h regsave.asc regsave.cdb

test2: test2.p2h test2.asc test2.cdb

pmon_app: pmon.p2h pmon.asc pmon.cdb pmon.cc
	grep '^L' pmon.cdb|grep the_end|awk '-F:' '{print $$NF}'

pass: pmon.cc
	git -C ../../ucsim pull
	cp pmon.cc ../../ucsim/main/p1516.src
	git -C ../../ucsim/main/p1516.src add pmon.cc
	git -C ../../ucsim/main/p1516.src commit -m "monitor update"
	git -C ../../ucsim push

pmon.cc: pmon.p2h
	php $(TOOLS)/hex2c.php $< >$@

test: test.p2h test.asc test.cdb

.SUFFIXES: .p2h .asm .asc .cdb .cc

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	php $(TOOLS)/hex2asc.php -m $(AW) $< >$@

.p2h.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean:
	rm -f *.hex *.p2h *.asc *.cdb *~ *.lst pmon.cc

wclean:
	del /f *.hex *.p2h *.asc *.cdb *~ *.lst pmon.cc
