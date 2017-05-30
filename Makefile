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
		  blink_tmr.hex

all: sim

show: sim
	gtkwave $(VCD) $(GTKW)

sim: $(VCD)

$(VCD): $(VVP) $(HEX_FILES)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER)
	iverilog -o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

clean:
	rm -f *~ $(VCD) $(VVP)
	rm -f *.cmd_log *.html *.lso *.ngc *.ngr *.prj
	rm -f *.stx
