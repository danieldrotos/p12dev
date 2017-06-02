TB		= tm

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
		  blink_tmr.hex poll.hex

ASM_SOURCES	= $(patsubst %.hex,%.asm,$(HEX_FILES))

MEM_SOURCES	= $(patsubst %.hex,%.v,$(HEX_FILES))

.SUFFIXES: .hex .asm .v

all: compile sim

show: sim
	gtkwave $(VCD) $(GTKW)

sim: $(VCD)

$(VCD): $(VVP) $(HEX_FILES)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER)
	iverilog -o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

compile: $(HEX_FILES) $(MEM_SOURCES)

.asm.hex:
	as1516 -h $< >$@

.asm.v:
	as1516 $< >$@

clean:
	rm -f *~ $(VCD) $(VVP)
	rm -f *.cmd_log *.html *.lso *.ngc *.ngr *.prj
	rm -f *.stx
