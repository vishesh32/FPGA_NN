#include "VReLu.h"        // Verilator generated header for the ReLU module
#include "verilated.h"
#include "verilated_vcd_c.h" // For VCD waveform generation
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

    // Clock signal initialization
    relu->clk = 0;

    // Apply test inputs and toggle the clock
    for (int cycle = 0; cycle < 20; ++cycle) {
        // Toggle clock
        relu->clk = !relu->clk;

        // Apply input on the rising edge
        if (relu->clk) {
            if (cycle == 2) {
                relu->x = 50; // Positive input
            } else if (cycle == 6) {
                relu->x = -10; // Negative input
            } else if (cycle == 10) {
                relu->x = 0; // Zero input
            } else if (cycle == 14) {
                relu->x = 1024; // Large positive input
            }
        }

        // Evaluate the design
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

    // Finalize simulation
    tfp->close();
    delete relu;
    delete tfp;

    return 0;
}
