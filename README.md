# LVDC
Replica of the [Launch Vehicle Digital Computer](https://www.ibiblio.org/apollo/LVDC.html) using 74-series logic. This projects only aims to keep the CPU Architecture binary-compatible with the original. Implementation details, IO Peripherals and Software are all originally created by me. This is party due to the fact that detailed hardware descriptions (i.e. schematics) are not as abundant for the LVDC as for the AGC, but also because this project doubled as a challenge to myself to implement such an odd instruction set, but using every trick I’ve learned from my years of engineering integrated circuit layouts. It turns out that applying nanoscale engineering tricks to a macroscale discrete logic build can work out quite well. The clock speed of this computer is 2.5MHz, but it can probably go faster.

This LVDC is accurate to the original in the sense that it executes the same instructions that function the exact same, has the same memory layout (including special locations like HOP save and MQ) and can execute snippets of original LVDC code.

The differences are:
  - This computer is parallel and not bit-serial, and is also microcoded
  - It is implemented using 74-series logic and not discrete transistors (I wish to be able to take it with me to events, so it couldn’t get too big)
  - Everything hooked up to the PIO (IO read/write) instruction is my own invention, with the exception of the the interrupt latch clear IO location, which it shares with the original LVDC
  - Instruction cycles times are much faster, probably on an order of magnitude or more
  - The hardware multiply/divide circuitry (as designed so far) does NOT share the inacuracies in low-order bits as the original LVDC, instead always producing the 100% correct result

Infact, I took the most liberties with the IO Card, which contains various modern components hooked into the CPU’s IO Bus. Its mostly a random mashup of things I thought would be cool (there is even a Commodore SID replica in there) to demonstrate the computer with.

The most significant addition is that of a front panel (the original LVDC was an embedded device with no user interface) which is a bit like a DSKY, but stripped down and only capable of displaying in hexadecimal. The panel is optional. I can be safely removed and the computer used as a true embedded device.

Software wise, things are still WiP. Two ROMs provide just enough storage for a small bootloader to initialize the entire SRAM from a flash IC. Sadly, core memory is far too bulky and expensive, so this will have to do. Eventually, I wish to write a mini-OS for this that allows a user to control the computer by typing in commands consisting of a Noun and Verb into the keypad.

**Known Issues:**
  - The HOP Save feature is bugged. The Instruction Pointer in the stored value is off by one. Trying to return with it will return execution to the transfer or HOP instruction that started the subroutine call, not the one following it, triggering an infinite loop. Fixed for now in software by modifying the saved value before return.
  - While all schematic files have been updated with fixes to additional problems discovered post-production, the schematic layout for the Control board still need to be redone.
  - The EXM instruction has only been minimally tested because I don’t understand how it is useful (thing takes up half a dozen ICs just to handle weird edge cases caused by it and I’m still left scratching my head on how I’m supposed to use it).
  - The hardware multiply/divide functionality has yet to be physically implemented. In `LVDC.circ` you can see that I have designed it, but I’ve yet to translate this to a PCB design because I couldn’t get it made yet anyways (its the most expensive part of the whole computer).
  - The interrupt logic sometimes does not reset properly and I don’t understand why

# Repository Structure

`LVDC.circ` is where I prototyped the logic design using Logisim Evolution, but it is quite bugged and now far outdated.

`microcode_gen.c` is the C program that spits out the raw binary images for the microcode ROMs from a more high-level description.

`KiCad` is where the schematics and PCB layouts live. Related to this is `CPLD`, which holds the HDL code for the CPLD on the GPIO PCB.

`Bench` is the result of using [KiCadVerilog](https://github.com/89Mods/KiCadVerilog) to automatically extract Verilog netlists out of the KiCad schematic files and using them to build a simulation of the computer for verification purposes before starting physical production. This is quite a novel approach and I used it here for the first time.

`behavioral` contains a Behavioral Verilog model of the LVDC I used as a starting point. It is incredibly inaccurate as I have not updated it in same time.

`Programs` contains the software I’m writing for this computer. Currently just the Bootloader source and the WiP mini-OS mentioned earlier.
