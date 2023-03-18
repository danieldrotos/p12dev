TB		= tm

include prj.mk

TOOLS		= ./tools

MODS		= defs hwconf \
		  computer/decoder \
		  computer/comp \
		    computer/addrdec1 \
		    computer/addrdec2 \
		    computer/memory \
		    cpu1/cpu1 \
		      cpu1/regm \
		      cpu1/adder \
		      cpu1/alu1 \
		      cpu1/pc1 \
		      cpu1/rfm1 \
		      cpu1/schedm \
		    cpu2/cpu2 \
		      cpu2/alu2 \
		      cpu2/reg2in \
		      cpu2/rfm2 \
		    computer/gpio_out4 \
		    computer/gpio_in \
		    computer/timer \
		    computer/simif \
		    computer/uart \
		    computer/uart_rx \
		    computer/uart_tx

TB_VER		= $(patsubst %,%.v,$(TB))

MODS_VER	= $(patsubst %,%.v,$(MODS))

VVP		= $(patsubst %,%.vvp,$(TB))

VCD		= $(patsubst %,%.vcd,$(TB))

GTKW		= $(patsubst %,%.gtkw,$(TB))

all: progs utils $(PRG).asc show

progs:
	$(MAKE) -C examples all
	$(MAKE) -C progs2 all

utils: #hex2asc

source:
	php $(TOOLS)/source.php $(PRG).asc

show: sim
	gtkwave $(VCD) $(GTKW)

sim: $(VCD)

$(VCD): $(VVP)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER) prj.mk $(PRG).asc
	iverilog \
		-DPRG='"$(PRG).asc"' \
		-DINSTS=$(INSTS) \
		-DIVERILOG=1 \
		-o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

hw: $(VVP)

#compile: $(HEX_FILES) $(ASC_FILES) $(CDB_FILES)

.SUFFIXES: .asm .v .asc .cdb .p2h

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	php $(TOOLS)/hex2asc.php -m $(AW) progs2/pmon.p2h $< >$@

.p2h.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean_files	= *~ $(VCD) $(VVP) \
		*.cmd_log *.html *.lso *.ngc *.ngr *.prj \
		*.stx \
		hex2asc source.txt

clean:
	$(MAKE) -C examples clean
	$(MAKE) -C progs2 clean
	rm -f $(clean_files)

wclean:
	$(MAKE) -C examples wclean
	$(MAKE) -C progs2 wclean
	del /f $(clean_files)

