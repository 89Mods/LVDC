#include "Vtb.h"
#include "verilated.h"
#include <iostream>

static Vtb top;

double sc_time_stamp() { return 0; }

int main(int argc, char** argv, char** env) {
#ifdef TRACE_ON
	std::cout << "Warning: tracing is ON!" << std::endl;
	Verilated::traceEverOn(true);
#endif
	top.clk = 0;
	for(uint64_t i = 0; i < 128; i++) {
		Verilated::timeInc(1);
		top.eval();
		top.clk = !top.clk;
	}
	top.final();
	return 0;
}
