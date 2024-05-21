PRJ		= $(realpath ./)
PMON		= $(PRJ)/pmon
LIB		= $(PRJ)/lib
INCLUDES	= -I hw

TB		= hw/tm
TOP		= tm

include prj.mk
AW		?= 16

TOOLS		= tools

MODS		= hw/defs hw/hwconf \
		  hw/computer/decoder \
		  hw/computer/comp \
		    hw/computer/addrdec1 \
		    hw/computer/addrdec2 \
		    hw/computer/memory \
		    hw/computer/mems \
		    hw/cpu1/cpu1 \
		      hw/cpu1/regm \
		      hw/cpu1/adder \
		      hw/cpu1/alu1 \
		      hw/cpu1/pc1 \
		      hw/cpu1/rfm1 \
		      hw/cpu1/schedm \
		    hw/cpu2/cpu2 \
		      hw/cpu2/alu2 \
		      hw/cpu2/reg2in \
		      hw/cpu2/rfm2 \
                      hw/cpu2/getb \
                      hw/cpu2/putb \
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

.PHONY: sw hw pmon

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
	vvp -n $(VVP)

$(VVP): $(TB_VER) $(MODS_VER) prj.mk $(PRG).asc
	iverilog \
		-DPRG='"$(PRG).asc"' \
		-DINSTS=$(INSTS) \
		-DIVERILOG=1 \
		$(INCLUDES) \
		-o $(VVP) -s $(TOP) $(TB_VER) $(MODS_VER)

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
	$(MAKE) -C hw/implement clean
	$(MAKE) -C lib clean
	$(RM) $(clean_files)
	$(RM) computer/*~ cpu1/*~ cpu2/*~
	$(RM) hw/computer/*~ hw/cpu1/*~ hw/cpu2/*~
