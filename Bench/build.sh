#!/bin/bash

set -e

TRACE_FLAGS="--trace-depth 0 --trace -DTRACE_ON -CFLAGS '-DTRACE_ON'"
verilator -DBENCH -Wno-fatal --timing --top-module tb -cc -exe ${TRACE_FLAGS} bench.cpp tb.v virtual_backplane.v io_emulation.v spiflash.v cpld.v ALU/ALU.v Control/Control.v Memory/Memory.v Registers/Registers.v ChipModels/mem_28C16.v ChipModels/mem_IS61C256.v ChipModels/ttl_74hc74.v ChipModels/ttl_74hc85.v ChipModels/ttl_74hc244.v ChipModels/ttl_74hc688.v ChipModels/ttl_74hct00.v ChipModels/ttl_74hct02.v ChipModels/ttl_74hct04.v ChipModels/ttl_74hct08.v ChipModels/ttl_74hct11.v ChipModels/ttl_74hct32.v ChipModels/ttl_74hct86.v ChipModels/ttl_74hct153.v ChipModels/ttl_74hct157.v ChipModels/ttl_74hct163.v ChipModels/ttl_74hct574.v ChipModels/ttl_74ls181.v ChipModels/ttl_74ahc1g04 ChipModels/ttl_74hct245.v ChipModels/ttl_74alvc164245.v ChipModels/ttl_74lv1t34.v
cd obj_dir
make -f Vtb.mk
cd ..
#java ToVerilogHex.java ../Programs/test.bin rom
