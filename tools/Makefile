all: test2.asc test2.cdb

test2.hex: test2.asm p2as.php
	php p2as.php $< >$@

test2.asc: test2.hex hex2asc.php
	php hex2asc.php $< >$@

test2.cdb: test2.hex hex2cdb.php
	php hex2cdb.php $< >$@

clean:
	rm -f *.cdb *.hex
