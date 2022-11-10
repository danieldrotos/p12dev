PRJ		= ..
TOOLS		= $(PRJ)/tools

include $(PRJ)/prj.mk

all: monitor

monitor: pmon.hex pmon.asc pmon.cdb

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
