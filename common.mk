
ifeq ($(OS),Windows_NT)
RM		= del /f /q
RMR		= del /f /s /q
else
RM		= rm -f
RMR		= rm -f -r
endif

.SUFFIXES: .asm .v .asc .cdb .p2h .p2o


.asm.p2o:
	php $(TOOLS)/p2as.php -l -c -o $@ $<

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	$(MAKE) -C $(PMON) pmon.p2h
	php $(TOOLS)/hex2asc.php -m $(AW) $(PMON)/pmon.p2h $< >$@

.p2h.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@
