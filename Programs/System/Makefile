ASL = ../../../asl-avalonsemi/asl
P2BIN = ../../../asl-avalonsemi/p2bin
ARCH = LVDC

%.p: %.asm
	$(ASL) -L -cpu $(ARCH) $<

%.bin: %.p
	$(P2BIN) $<

system: system.bin
	java ToFlashImage.java system.bin ../../Bench/flash.txt

clean:
	rm -rf *.bin *.p

all: clean test

.PHONY: all
