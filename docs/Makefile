PRJ		= ..

UCSIM		= $$HOME/prj/ucsim_main/src/sims/p1516.src/ucsim_p1516

include $(PRJ)/sw/common.mk

all: mon generator segchars.html

mon:
	$(MAKE) -C $(PMON) all

generator:
	$(MAKE) -C $(LIB) all
	$(MAKE) -C $(PROGS) genseg.p2h

segchars.html: $(PMON)/pmon.p2h $(PROGS)/genseg.p2h
	$(UCSIM) -Iif='rom[0xffff]' -Suart=0,out='segchars.html',raw -G $(PMON)/pmon $(PROGS)/genseg

clean:
	$(RM) *~
	$(RM) *.bak
