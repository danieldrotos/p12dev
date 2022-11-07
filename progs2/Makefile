PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk

all: simif_print2 counter2 array_sum2 ffir2 light12 light22 poll2 uart

simif_print2: simif_print2.hex simif_print2.asc simif_print2.cdb

counter2: counter2.hex counter2.asc counter2.cdb

array_sum2: array_sum2.hex array_sum2.asc array_sum2.cdb

ffir2: ffir2.hex ffir2.asc ffir2.cdb

light12: light12.hex light12.asc light12.cdb

light22: light22.hex light22.asc light22.cdb

poll2: poll2.hex poll2.asc poll2.cdb

uart: uart.hex uart.asc uart.cdb

.SUFFIXES: .hex .asm .asc .cdb

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
