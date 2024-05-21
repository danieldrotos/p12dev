
TOOLS		= $(PRJ)/sw/tools
LIB		= $(PRJ)/sw/lib
PMON		= $(PRJ)/pmon

ifeq ($(OS),Windows_NT)
RM		= del /f /q
RMR		= del /f /s /q
ISS		= $(TOOLS)/sim.bat
else
RM		= rm -f
RMR		= rm -f -r
ISS		= $(TOOLS)/sim.sh
endif

.SUFFIXES: .asm .v .asc .cdb .p2h .p2o .p2l


.asm.p2o:
	php $(TOOLS)/p2as.php -l -c -o $@ $<

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	$(MAKE) -C $(PMON) pmon.p2h
	php $(TOOLS)/hex2asc.php -m $(AW) $(PMON)/pmon.p2h $< >$@

.p2h.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@
