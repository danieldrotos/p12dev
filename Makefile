TB		= tm

include prj.mk
AW		?= 17

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
		    computer/fifo \
		    computer/arm_fifo \
		    computer/uart \
		    computer/uart_rx \
		    computer/uart_tx \
		    computer/clock


TB_VER		= $(patsubst %,%.v,$(TB))

MODS_VER	= $(patsubst %,%.v,$(MODS))

VVP		= $(patsubst %,%.vvp,$(TB))

VCD		= $(patsubst %,%.vcd,$(TB))

GTKW		= $(patsubst %,%.gtkw,$(TB))

all: progs sw show

progs:
	$(MAKE) -C examples all
	$(MAKE) -C progs2 all

sw: $(PRG).p2h $(PRG).asc $(PRG).cdb

source:
	php $(TOOLS)/source.php $(PRG).asc

show: simul
	gtkwave $(VCD) $(GTKW)

sim: $(VCD)

synth: $(VVP)

hw: synth

$(VCD): $(VVP)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER) prj.mk $(PRG).asc
	iverilog \
		-DPRG='"$(PRG).asc"' \
		-DINSTS=$(INSTS) \
		-DIVERILOG=1 \
		-o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

#compile: $(HEX_FILES) $(ASC_FILES) $(CDB_FILES)

.SUFFIXES: .asm .v .asc .cdb .p2h

.asm.p2h:
	php $(TOOLS)/p2as.php -l -o $@ $<

.p2h.asc:
	$(MAKE) -C progs2 pmon.p2h
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
	$(MAKE) -C tools clean
	rm -f $(clean_files)

wclean:
	$(MAKE) -C examples wclean
	$(MAKE) -C progs2 wclean
	$(MAKE) -C tools wclean
	del /f $(clean_files)

