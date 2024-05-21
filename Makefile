PRJ		= $(realpath ./)
PMON		= $(PRJ)/pmon
LIB		= $(PRJ)/lib

TB		= tm

include prj.mk
AW		?= 16

TOOLS		= tools

MODS		= defs hwconf \
		  hw/computer/decoder \
		  hw/computer/comp \
		    hw/computer/addrdec1 \
		    hw/computer/addrdec2 \
		    hw/computer/memory \
		    hw/computer/mems \
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
                      cpu2/getb \
                      cpu2/putb \
		    hw/computer/gpio_out4 \
		    hw/computer/gpio_in \
		    hw/computer/timer \
		    hw/computer/simif \
		    hw/computer/arm_fifo \
		    hw/computer/uart \
		    hw/computer/uart_rx \
		    hw/computer/uart_tx \
		    hw/computer/clock


TB_VER		= $(patsubst %,%.v,$(TB))

MODS_VER	= $(patsubst %,%.v,$(MODS))

VVP		= $(patsubst %,%.vvp,$(TB))

VCD		= $(patsubst %,%.vcd,$(TB))

GTKW		= $(patsubst %,%.gtkw,$(TB))

include $(PRJ)/common.mk


all: progs sw show

compile: sw hw

progs:
	$(MAKE) -C lib all
	$(MAKE) -C examples all
	$(MAKE) -C progs2 all
	$(MAKE) -C pmon all

comp_pmon:
	$(MAKE) -C pmon all

comp_mon: comp_pmon

comp_sw: $(PRG).p2h $(PRG).asc $(PRG).cdb

sw: comp_pmon comp_sw

source:
	php $(TOOLS)/source.php $(PRG).asc

show: simul
	gtkwave $(VCD) $(GTKW)

simul: $(VCD)

sim: $(VCD)

synth: $(VVP)

hw: synth

iss: comp_pmon comp_sw
	$(ISS) $(PRG)

$(VCD): $(VVP)
	vvp $(VVP)

$(VVP): $(TB_VER) $(MODS_VER) prj.mk $(PRG).asc
	iverilog \
		-DPRG='"$(PRG).asc"' \
		-DINSTS=$(INSTS) \
		-DIVERILOG=1 \
		-o $(VVP) -s $(TB) $(TB_VER) $(MODS_VER)

#compile: $(HEX_FILES) $(ASC_FILES) $(CDB_FILES)



clean_files	= *~ $(VCD) $(VVP) \
		*.cmd_log *.html *.lso *.ngc *.ngr *.prj \
		*.stx \
		hex2asc source.txt

clean:
	$(MAKE) -C examples clean
	$(MAKE) -C progs2 clean
	$(MAKE) -C pmon clean
	$(MAKE) -C tools clean
	$(MAKE) -C implement clean
	$(MAKE) -C lib clean
	$(RM) $(clean_files)
	$(RM) computer/*~ cpu1/*~ cpu2/*~
