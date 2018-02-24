onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {debug signals}
add wave -noupdate -divider more
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Reset
add wave -noupdate /testbench/Run
add wave -noupdate /testbench/Continue
add wave -noupdate /testbench/S
add wave -noupdate /testbench/LED
add wave -noupdate /testbench/IR
add wave -noupdate /testbench/CE
add wave -noupdate /testbench/UB
add wave -noupdate /testbench/LB
add wave -noupdate /testbench/OE
add wave -noupdate /testbench/WE
add wave -noupdate /testbench/ADDR
add wave -noupdate /testbench/Data
add wave -noupdate -divider {debug signals}
add wave -noupdate -label State /testbench/processor/my_slc/state_controller/State
add wave -noupdate -label mem_array /testbench/processor/my_test_memory/mem_array
add wave -noupdate -label PC_out /testbench/processor/my_slc/d0/PC_out
add wave -noupdate -label {da bus} /testbench/processor/my_slc/d0/bus
add wave -noupdate -label mem_out /testbench/processor/my_test_memory/mem_out
add wave -noupdate -label I_O_wire /testbench/processor/my_test_memory/I_O_wire
add wave -noupdate -label I_O /testbench/processor/my_test_memory/I_O
add wave -noupdate -label MDR_D /testbench/processor/my_slc/MDR_D
add wave -noupdate -divider more
add wave -noupdate -label LD_MAR /testbench/processor/my_slc/state_controller/LD_MAR
add wave -noupdate -label LD_MDR /testbench/processor/my_slc/state_controller/LD_MDR
add wave -noupdate -label LD_PC /testbench/processor/my_slc/state_controller/LD_PC
add wave -noupdate -label GatePC /testbench/processor/my_slc/state_controller/GatePC
add wave -noupdate -label GateMDR /testbench/processor/my_slc/state_controller/GateMDR
add wave -noupdate -label GateALU /testbench/processor/my_slc/state_controller/GateALU
add wave -noupdate -label GateMARMUX /testbench/processor/my_slc/state_controller/GateMARMUX
add wave -noupdate -label MAR_out /testbench/processor/my_slc/d0/MAR_out
add wave -noupdate -label MAR /testbench/processor/my_slc/MAR
add wave -noupdate -label IR /testbench/processor/my_slc/IR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {338166 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
configure wave -valuecolwidth 139
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {525 ns}
