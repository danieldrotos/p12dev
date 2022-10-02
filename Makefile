TB		= tm

include prj.mk

TOOLS		= ./tools

MODS		= defs \
		  computer/decoder \
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
		    computer/timer \
		    computer/simif

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
		examples/ff2ir.asm \
		$(PRG).asm

HEX_FILES	= $(patsubst %.asm,%.hex,$(ASM_SOURCES))

MEM_FILES	= $(patsubst %.hex,%.v,$(HEX_FILES))

ASC_FILES	= $(patsubst %.hex,%.asc,$(HEX_FILES))

CDB_FILES	= $(patsubst %.hex,%.cdb,$(HEX_FILES))

all: utils $(PRG).asc compile show

utils: #hex2asc

source:
	php $(TOOLS)/source.php $(PRG).asc

show: sim
	gtkwave $(VCD) $(GTKW)

sim: $(VCD)

$(VCD): $(VVP)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER) $(PRG).asc prj.mk
	iverilog \
		-DPRG='"$(PRG).asc"' \
		-DAW=$(AW) \
		-DINSTS=$(INSTS) \
		-DIVERILOG=1 \
		-o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

hw: $(VVP)

compile: $(HEX_FILES) $(ASC_FILES) $(CDB_FILES)

.SUFFIXES: .hex .asm .v .asc .cdb

.asm.hex:
	php $(TOOLS)/assembler.php -h $< >$@ 2>`tty`

.asm.v:
	php $(TOOLS)/assembler.php $< >$@

.hex.asc:
	php $(TOOLS)/hex2asc.php -- -m $(AW) $< >$@

.hex.cdb:
	php $(TOOLS)/hex2cdb.php $< >$@

clean_files	= *~ $(VCD) $(VVP) \
		*.cmd_log *.html *.lso *.ngc *.ngr *.prj \
		*.stx \
		hex2asc source.txt

clean:
	rm -f $(clean_files)

wclean:
	del /f $(clean_files)

