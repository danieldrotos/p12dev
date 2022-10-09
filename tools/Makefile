all: test2.asc test2.cdb

test2.asc: test2.hex
	php hex2asc.php $< >$@

test2.cdb: test2.hex
	php hex2cdb.php $< >$@

test2.hex: test2.asm
	php p2as.php $< >$@

clean:
	rm -f *.cdb *.hex
