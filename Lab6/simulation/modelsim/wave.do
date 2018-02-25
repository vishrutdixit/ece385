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
add wave -noupdate -label PC_out /testbench/processor/my_slc/d0/PC_out
add wave -noupdate -label bus /testbench/processor/my_slc/d0/bus
add wave -noupdate -label mem_out /testbench/processor/my_test_memory/mem_out
add wave -noupdate -label ALU_out /testbench/processor/my_slc/d0/ALU_out
add wave -noupdate -divider Selects
add wave -noupdate -label ALUK /testbench/processor/my_slc/d0/ALUK
add wave -noupdate -label PCMUX_sel /testbench/processor/my_slc/d0/PCMUX
add wave -noupdate -label DR_sel /testbench/processor/my_slc/d0/DRMUX
add wave -noupdate -label SR1_sel /testbench/processor/my_slc/d0/SR1MUX
add wave -noupdate -label SR2_sel /testbench/processor/my_slc/d0/SR2MUX
add wave -noupdate -label ADDR1_sel /testbench/processor/my_slc/d0/ADDR1MUX
add wave -noupdate -label ADDR2_sel /testbench/processor/my_slc/d0/ADDR2MUX
add wave -noupdate -divider LD
add wave -noupdate -label LD_MAR /testbench/processor/my_slc/state_controller/LD_MAR
add wave -noupdate -label LD_MDR /testbench/processor/my_slc/state_controller/LD_MDR
add wave -noupdate -label LD_PC /testbench/processor/my_slc/state_controller/LD_PC
add wave -noupdate -label LD_Reg /testbench/processor/my_slc/LD_REG
add wave -noupdate -label LD_CC /testbench/processor/my_slc/LD_CC
add wave -noupdate -label LD_LED /testbench/processor/my_slc/LD_LED
add wave -noupdate -label LD_IR /testbench/processor/my_slc/LD_IR
add wave -noupdate -label LD_BEN /testbench/processor/my_slc/LD_BEN
add wave -noupdate -divider Gates
add wave -noupdate -label GateMARMUX /testbench/processor/my_slc/GateMARMUX
add wave -noupdate -label GatePC /testbench/processor/my_slc/state_controller/GatePC
add wave -noupdate -label GateMDR /testbench/processor/my_slc/state_controller/GateMDR
add wave -noupdate -label GateALU /testbench/processor/my_slc/state_controller/GateALU
add wave -noupdate -divider Registers
add wave -noupdate -label BEN /testbench/processor/my_slc/BEN
add wave -noupdate -label sr1_out /testbench/processor/my_slc/d0/regfile_inst/sr1_out
add wave -noupdate -label MAR /testbench/processor/my_slc/MAR
add wave -noupdate -label sr2_out /testbench/processor/my_slc/d0/regfile_inst/sr2_out
add wave -noupdate -label Registers /testbench/processor/my_slc/d0/regfile_inst/data
add wave -noupdate -label GateMARMUX /testbench/processor/my_slc/state_controller/GateMARMUX
add wave -noupdate -label IR /testbench/processor/my_slc/IR
add wave -noupdate -label MDR /testbench/processor/my_slc/MDR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37584 ps} 0}
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
WaveRestoreZoom {0 ps} {1050 ns}
