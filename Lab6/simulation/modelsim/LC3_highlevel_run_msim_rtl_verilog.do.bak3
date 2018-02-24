transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/tristate.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/test_memory.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/SLC3_2.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/Mem2IO.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/ISDU.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/register.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/datapath.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/HexDriver.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/mux16.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/slc3.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/memory_contents.sv}
vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/lab6_toplevel.sv}

vlog -sv -work work +incdir+C:/altera/15.0/Lab6_copy {C:/altera/15.0/Lab6_copy/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 100 ns
