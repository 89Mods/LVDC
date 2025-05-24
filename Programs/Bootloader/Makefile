ASL = ../../../asl-avalonsemi/asl
P2BIN = ../../../asl-avalonsemi/p2bin
ARCH = LVDC

%.p: %.asm
	$(ASL) -L -cpu $(ARCH) $<

%.bin: %.p
	$(P2BIN) $<

boot: boot.bin
	java ToVerilogHex.java boot.bin ../../Bench/rom
	java ToBin.java boot.bin

clean:
	rm -rf *.bin *.p

all: clean test

.PHONY: all
