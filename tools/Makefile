all: test2.asc test2.cdb

test2.p2h: test2.asm p2as.php
	php p2as.php $< -l -o $@

test2.asc: test2.p2h hex2asc.php
	php hex2asc.php $< >$@

test2.cdb: test2.p2h hex2cdb.php
	php hex2cdb.php $< >$@

clean:
	rm -f *~ *.cdb *.hex *.p2h *.asc *.lst

wclean:
	del /f *~ *.cdb *.hex *.p2h *.asc *.lst
