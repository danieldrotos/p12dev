PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk

all: simif_print2 counter2 array_sum2 ffir2 light12 light22 poll2 \
	uart uart2 test pmon_app regsave

simif_print2: simif_print2.hex simif_print2.asc simif_print2.cdb

counter2: counter2.hex counter2.asc counter2.cdb

array_sum2: array_sum2.hex array_sum2.asc array_sum2.cdb

ffir2: ffir2.hex ffir2.asc ffir2.cdb

light12: light12.hex light12.asc light12.cdb

light22: light22.hex light22.asc light22.cdb

poll2: poll2.hex poll2.asc poll2.cdb

uart: uart.hex uart.asc uart.cdb

uart2: uart2.hex uart2.asc uart2.cdb

regsave: regsave.hex regsave.asc regsave.cdb

pmon_app: pmon.hex pmon.asc pmon.cdb pmon.cc

pass: pmon.cc
	git -C ../../ucsim pull
	cp pmon.cc ../../ucsim/main/p1516.src
	git -C ../../ucsim/main/p1516.src add pmon.cc
	git -C ../../ucsim/main/p1516.src commit -m "monitor update"
	git -C ../../ucsim push

pmon.cc: pmon.hex
	php $(TOOLS)/hex2c.php $< >$@

test: test.hex test.asc test.cdb

.SUFFIXES: .hex .asm .asc .cdb .cc

.asm.hex:
	php $(TOOLS)/p2as.php -l -o $@ $<

.hex.asc:
	php $(TOOLS)/hex2asc.php -- -m $(AW) $< >$@

.hex.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean:
	rm -f *.hex *.asc *.cdb *~ *.lst

wclean:
	del /f *.hex *.asc *.cdb *~ *.lst
