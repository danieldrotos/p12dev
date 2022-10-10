PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk

all: simif_print2

simif_print2: simif_print2.asc simif_print2.cdb

.SUFFIXES: .hex .asm .asc .cdb

.asm.hex:
	php $(TOOLS)/p2as.php -h $< >$@ 2>`tty`

.hex.asc:
	php $(TOOLS)/hex2asc.php -- -m $(AW) $< >$@

.hex.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean:
	rm -f *.hex *.asc *.cdb *~
