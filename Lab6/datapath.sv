module datapath (
		input logic clk,
		input logic LD_PC,
		input logic LD_MAR,
		input logic LD_MDR,
		input logic LD_IR,
		input logic MIO_EN,
		input logic Reset,
		input logic GatePC, GateMDR, GateALU, GateMARMUX,
		input logic [15:0] MDR_In,
		inout wire [15:0] bus,
		output logic [15:0] PC_out,
		output logic [15:0] MDR_out,
		output logic [15:0] MAR_out,
		output logic [15:0] IR_out		
		
);

//internal signals
logic [3:0] gates;
logic [15:0] PC_in;
logic [15:0] MDR_D;
assign MDR_D = (MIO_EN) ? MDR_In : bus;
assign gates = {GatePC, GateMDR, GateALU, GateMARMUX};
assign PC_in = (~Reset) ? 16'b0 : (PC_out + 1'b1);

mux16 gateMux
(
	.sel(gates),
	.a(16'hZ),
	.b(16'hZ),
	.c(16'hZ),
	.d(16'hZ),
	.e(MDR_out),
	.f(16'hZ),
	.g(16'hZ),
	.h(16'hZ),
	.i(PC_out),
	.j(16'hZ),
	.k(16'hZ),
	.l(16'hZ),
	.m(16'hZ),
	.n(16'hZ),
	.o(16'hZ),
	.p(16'hZ),
	.out(bus)
);

register PC
(
	.clk(clk),
	.load(LD_PC | ~Reset),
	.in(PC_in),
	.out(PC_out)
);

register MAR
(
	.clk(clk),
	.load(LD_MAR),
	.in(bus),
	.out(MAR_out)
);

register MDR
(
	.clk(clk),
	.load(LD_MDR),
	.in(MDR_D),
	.out(MDR_out)
);

register IR
(
	.clk(clk),
	.load(LD_IR | ~Reset),
	.in(bus),
	.out(IR_out)
);

endmodule		