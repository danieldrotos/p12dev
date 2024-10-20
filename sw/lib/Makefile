PRJ		= ../..

include $(PRJ)/sw/common.mk

AW		?= 16

OBJECTS		= \
		math.p2o \
		str.p2o \
		dev.p2o \
		char.p2o \
		inout.asm \
		fn_lined.p2o \
		fn_pmon.p2o \
		fn_pressed.p2o


all: lib

lib: plib.p2l

plib.p2l: plib.asm $(OBJECTS)
	php $(TOOLS)/p2as.php -c -l -dd -o plib.p2l $^

clean:
	$(RM) *.hex *.p2h *.p2o *.p2l *.cdb *.lst *.log *~
