
# 8-bit ALU timing constraints
# Illustrative constraints for an initial implementation

create_clock -name VCLK -period 10.0

# Input timing
set_input_delay 1.0 -clock VCLK [get_ports {A[*] B[*] opcode[*]}]
set_input_transition 0.1 [get_ports {A[*] B[*] opcode[*]}]

# Output timing
set_output_delay 1.0 -clock VCLK [get_ports {result[*] zero}]
set_load 0.05 [get_ports {result[*] zero}]

