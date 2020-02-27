TB		= tm

PRG		= counter

MODS		= decoder regm adder \
		  comp \
		    memory \
		    cpu \
		      alu \
		      cntreg \
		      rfm \
		      schedm \
		    gpio_out4 \
		    gpio_in \
		    timer

TB_VER		= $(patsubst %,%.v,$(TB))

MODS_VER	= $(patsubst %,%.v,$(MODS))

VVP		= $(patsubst %,%.vvp,$(TB))

VCD		= $(patsubst %,%.vcd,$(TB))

GTKW		= $(patsubst %,%.gtkw,$(TB))

HEX_FILES	= array_sum.hex counter.hex \
		  light1.hex light2.hex \
		  blink_tmr.hex poll.hex \
		  $(PRG).hex

ASM_SOURCES	= $(patsubst %.hex,%.asm,$(HEX_FILES))

MEM_SOURCES	= $(patsubst %.hex,%.v,$(HEX_FILES))

ASC_SOURCES	= $(patsubst %.hex,%.asc,$(HEX_FILES))

all: utils $(PRG).asc compile sim

utils: hex2asc

show: sim
	gtkwave $(VCD) $(GTKW)

sim: $(VCD)

$(VCD): $(VVP) $(HEX_FILES)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER) $(PRG).asc
	iverilog -DPRG='"$(PRG).asc"' -o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

compile: $(HEX_FILES) $(MEM_SOURCES) $(ASC_SOURCES)

.SUFFIXES: .hex .asm .v .asc

.asm.hex:
	./as1516 -h $< >$@

.asm.v:
	./as1516 $< >$@

.hex.asc:
	./hex2asc <$< >$@

clean:
	rm -f *~ $(VCD) $(VVP)
	rm -f *.cmd_log *.html *.lso *.ngc *.ngr *.prj
	rm -f *.stx
	rm -f hex2asc
