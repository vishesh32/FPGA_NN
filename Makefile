# Project Name
PROJECT = ReLu

# Verilog and Testbench Files
VERILOG_SRC = $(PROJECT).sv
TESTBENCH_SRC = $(PROJECT)_tb.cpp

# Output Directories
OBJ_DIR = obj_dir
WAVEFORM_FILE = waveforms.vcd

# Verilator Commands
VERILATOR = verilator
VERILATOR_FLAGS = --cc --trace --exe

# Compiler and Simulator
SIMULATOR = $(OBJ_DIR)/V$(PROJECT)

# Default Target
all: $(SIMULATOR)

# Compile Verilog and C++ Testbench
$(SIMULATOR): $(VERILOG_SRC) $(TESTBENCH_SRC)
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILOG_SRC) $(TESTBENCH_SRC)
	make -C $(OBJ_DIR) -f V$(PROJECT).mk

# Run Simulation
run: $(SIMULATOR)
	$(SIMULATOR)

# Open Waveform in GTKWave
view: $(WAVEFORM_FILE)
	gtkwave $(WAVEFORM_FILE)

# Clean Build Files
clean:
	rm -rf $(OBJ_DIR) $(WAVEFORM_FILE)

# Phony Targets
.PHONY: all run view clean
