#include "Vtb.h"
#include "verilated.h"
#include <iostream>

static Vtb top;

double sc_time_stamp() { return 0; }

uint64_t total_time;
bool clock_state = false;

void advance() {
	int total = 0;
	while(1) {
		int diff = 500 - total;
		if(diff <= 0) break;
		if(!top.eventsPending()) {
			Verilated::timeInc(diff);
			total_time += diff;
			total += diff;
			top.eval_step();
			break;
		}
		int nextSlot = top.nextTimeSlot() - total_time;
		if(nextSlot + total >= 500) {
			Verilated::timeInc(diff);
			total_time += diff;
			total += diff;
			top.eval_step();
			break;
		}
		Verilated::timeInc(nextSlot);
		total_time += nextSlot;
		top.eval_step();
		total += nextSlot;
	}
	top.eval_end_step();
}

int main(int argc, char** argv, char** env) {
#ifdef TRACE_ON
	printf("Warning: tracing is ON!\r\n");
	Verilated::traceEverOn(true);
#endif
	total_time = 0;
	top.clk = 0;
	top.irq = 0;
	unsigned long counter = 0;
	while(!Verilated::gotFinish() && counter < 2000) {
		top.clk = !top.clk;
		advance();
		counter++;
		if(counter == 201) {
			//top.irq = 1;
		}
		if(counter == 202) {
			//top.irq = 0;
		}
	}
	top.final();
	return 0;
}
