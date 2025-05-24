ASL = ../../../asl-avalonsemi/asl
P2BIN = ../../../asl-avalonsemi/p2bin
ARCH = LVDC

%.p: %.asm
	$(ASL) -L -cpu $(ARCH) $<

%.bin: %.p
	$(P2BIN) $<

system: system.bin
	java ToFlashImage.java system.bin ../../Bench/flash.txt

flash: system
	sudo flashrom --chip "W25Q32BV/W25Q32CV/W25Q32DV" --programmer ch341a_spi --write spiflash.bin

clean:
	rm -rf *.bin *.p

all: clean test

.PHONY: all
