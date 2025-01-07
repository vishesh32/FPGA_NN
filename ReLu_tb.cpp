#include "VReLu.h"        // Verilator needs the .sv file you are trying to simulate renamed V__.h as an include
#include "verilated.h"
#include "verilated_vcd_c.h" // For VCD waveform generation to view in gtkwave
#include <iostream>
#include <cstdint>

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    // Instantiate the DUT (Design Under Test)
    VReLu* relu = new VReLu;

    // Enable waveform tracing
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    relu->trace(tfp, 99);
    tfp->open("waveforms.vcd");

    // Clock signal initialisation
    relu->clk = 0;

    // Apply test inputs to ReLu.sv and toggle the clock
    for (int cycle = 0; cycle < 20; ++cycle) {

        relu->clk = !relu->clk;

        // Apply input on the rising edge
        if (relu->clk) {
            if (cycle == 2) {
                relu->x = 50;
            } else if (cycle == 6) {
                relu->x = -10; 
            } else if (cycle == 10) {
                relu->x = 0; 
            } else if (cycle == 14) {
                relu->x = 1024; 
            }
        }

        relu->eval();

        // Dump signals to the waveform file
        tfp->dump(cycle);

        // Print output for debugging
        if (relu->clk) {
            std::cout << "Cycle: " << cycle
                      << " Input: " << relu->x
                      << " Output: " << relu->out
                      << std::endl;
        }
    }

    tfp->close();
    delete relu;
    delete tfp;

    return 0;
}
