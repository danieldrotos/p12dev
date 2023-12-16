PRJ		= ..
TOOLS		= $(PRJ)/tools
PMON		= $(PRJ)/pmon
LIB		= .

include $(PRJ)/prj.mk
AW		?= 16

all: fn_div.p2o \
	fn_io.p2o \
	fn_lined.p2o \
	fn_pmon.p2o \
	fn_rand.p2o

include $(PRJ)/common.mk

clean:
	$(RM) *.hex *.p2h *.p2o *.cdb *.lst *.log *~
