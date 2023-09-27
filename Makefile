# Define the C++ compiler and flags
CXX = clang++
CXXFLAGS = -std=c++17 -Wall

# Define the directory where the compiled executable will be placed
BIN_DIR = bin

# Define the path of the compiled executable
EXECUTABLE = $(BIN_DIR)/test

# Define a debug flag to be used in the "runbug" target
DEBUG_FLAG = --debug

# If the user hasn't specified a source file in the CPP_FILE variable,
# default to "default.cpp"
ifndef CPP_FILE
    CPP_FILE = default.cpp
endif

# Target: "all"
# This target is executed when running "make all"
all: $(EXECUTABLE)
	@echo "Build completed: $(EXECUTABLE)"

# Target: "run"
run: $(CPP_FILE)
	# Create the bin directory if it doesn't exist
	mkdir -p $(BIN_DIR)
	# Compile the specified source file and place the executable in the bin directory
	$(CXX) $(CXXFLAGS) $< -o $(EXECUTABLE)
	@echo
	# Run the compiled executable with input from input.txt and write output to output.txt
	@echo
	@./$(EXECUTABLE) < input.txt > output.txt
	@echo

# Target: "runbug"
runbug: $(CPP_FILE)
	# Create the bin directory if it doesn't exist
	mkdir -p $(BIN_DIR)
	# Compile the specified source file with the --debug flag and place the executable in the bin directory
	$(CXX) $(CXXFLAGS) $(DEBUG_FLAG) $< -o $(EXECUTABLE)
	@echo
	# Run the compiled executable with input from input.txt and write output to output.txt
	@echo
	@./$(EXECUTABLE) < input.txt > output.txt
	@echo
# Target: "clean"
# This target is executed when running "make clean"
clean:
	# Remove the compiled executable
	rm -f $(EXECUTABLE)

# Specify that these targets don't correspond to actual files
.PHONY: all run runbug clean