TB		= tm

PRG		= counter
AW		= 12

MODS		= computer/decoder \
		  computer/comp \
		    computer/memory \
		    cpu/cpu \
		      cpu/regm \
		      cpu/adder \
		      cpu/alu \
		      cpu/cntreg \
		      cpu/rfm \
		      cpu/schedm \
		    computer/gpio_out4 \
		    computer/gpio_in \
		    computer/timer

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

utils: #hex2asc

show: sim
	gtkwave $(VCD) $(GTKW)

sim: $(VCD)

$(VCD): $(VVP) $(HEX_FILES)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER) $(PRG).asc
	iverilog -DPRG='"$(PRG).asc"' -DAW=$(AW) -o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

compile: $(HEX_FILES) $(ASC_SOURCES)

.SUFFIXES: .hex .asm .v .asc

.asm.hex:
	./as1516 -h $< >$@

.asm.v:
	./as1516 $< >$@

.hex.asc:
	php ./hex2asc.php -- -m $(AW) $< >$@

clean:
	rm -f *~ $(VCD) $(VVP)
	rm -f *.cmd_log *.html *.lso *.ngc *.ngr *.prj
	rm -f *.stx
	rm -f hex2asc
