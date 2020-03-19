TB		= tm

PRG		= examples/counter
AW		= 12

TOOLS		= ./tools

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

ASM_SOURCES	= examples/array_sum.asm \
		examples/counter.asm \
		examples/light1.asm \
		examples/light2.asm \
		examples/blink_tmr.asm \
		examples/poll.asm \
		$(PRG).asm

HEX_FILES	= $(patsubst %.asm,%.hex,$(ASM_SOURCES))

MEM_FILES	= $(patsubst %.hex,%.v,$(HEX_FILES))

ASC_FILES	= $(patsubst %.hex,%.asc,$(HEX_FILES))


all: utils $(PRG).asc compile sim

utils: #hex2asc

source:
	php $(TOOLS)/source.php $(PRG).asc

show: sim
	gtkwave $(VCD) $(GTKW)

sim: source $(VCD)

$(VCD): $(VVP) $(HEX_FILES)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER) $(PRG).asc source.txt
	iverilog -DPRG='"$(PRG).asc"' -DAW=$(AW) -o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

compile: $(HEX_FILES) $(ASC_FILES)

.SUFFIXES: .hex .asm .v .asc

.asm.hex:
	php $(TOOLS)/assembler.php -h $< >$@

.asm.v:
	php $(TOOLS)/assembler.php $< >$@

.hex.asc:
	php $(TOOLS)/hex2asc.php -- -m $(AW) $< >$@

clean:
	rm -f *~ $(VCD) $(VVP)
	rm -f *.cmd_log *.html *.lso *.ngc *.ngr *.prj
	rm -f *.stx
	rm -f hex2asc source.txt
