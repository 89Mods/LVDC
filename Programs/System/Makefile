ASL = ../../../asl-avalonsemi/asl
P2BIN = ../../../asl-avalonsemi/p2bin
ARCH = LVDC

toplevel.p: toplevel.asm interrupt.asm commands.asm system.asm
	$(ASL) -L -cpu $(ARCH) $<

mm0.p: mm0.asm
	$(ASL) -L -cpu $(ARCH) $<

%.bin: %.p
	$(P2BIN) -l 0 $<

system: toplevel.bin mm0.bin
	java ToFlashImage.java ../../Bench/flash.txt

flash: system
	sudo flashrom --chip "W25Q32BV/W25Q32CV/W25Q32DV" --programmer ch341a_spi --write spiflash.bin

clean:
	rm -rf *.bin *.p

all: clean system

.PHONY: all
