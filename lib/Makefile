PRJ		= ..

include $(PRJ)/sw/common.mk

AW		?= 16

OBJECTS		= \
		fn_div.p2o \
		fn_io.p2o \
		fn_lined.p2o \
		fn_pmon.p2o \
		fn_rand.p2o \
		fn_dtoi.p2o \
		fn_isdigit.p2o

all: lib

lib: plib.asm $(OBJECTS)
	php $(TOOLS)/p2as.php -c -l -dd -o plib.p2l $^

clean:
	$(RM) *.hex *.p2h *.p2o *.p2l *.cdb *.lst *.log *~
