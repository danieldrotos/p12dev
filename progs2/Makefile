PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk

all: simif_print2 counter2 array_sum2 ffir2

simif_print2: simif_print2.hex simif_print2.asc simif_print2.cdb

counter2: counter2.hex counter2.asc counter2.cdb

array_sum2: array_sum2.hex array_sum2.asc array_sum2.cdb

ffir2: ffir2.hex ffir2.asc ffir2.cdb

.SUFFIXES: .hex .asm .asc .cdb

.asm.hex:
	php $(TOOLS)/p2as.php -h $< >$@ 2>`tty`

.hex.asc:
	php $(TOOLS)/hex2asc.php -- -m $(AW) $< >$@

.hex.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean:
	rm -f *.hex *.asc *.cdb *~
