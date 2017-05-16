TB		= tm

MODS		= decoder regm adder \
		  computer \
		    memory \
		    cpu \
		      alu cntreg rfm schedm \
		    gpio_out4 \
		    gpio_in

TB_VER		= $(patsubst %,%.v,$(TB))

MODS_VER	= $(patsubst %,%.v,$(MODS))

VVP		= $(patsubst %,%.vvp,$(TB))

VCD		= $(patsubst %,%.vcd,$(TB))

GTKW		= $(patsubst %,%.gtkw,$(TB))

all: sim

show: sim
	gtkwave $(VCD) $(GTKW)

sim: $(VCD)

$(VCD): $(VVP) t1.hex counter.hex
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER)
	iverilog -o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

clean:
	rm -f *~ $(VCD) $(VVP)

