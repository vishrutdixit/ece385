module datapath (
		input logic clk,
		inout wire [15:0] bus,
		input logic LD_PC, LD_MAR, LD_MDR, LD_IR, MIO_EN, LD_REG, Reset,
		input logic PCMUX, ADDR1MUX, ADDR2MUX,
		input logic GatePC, GateMDR, GateALU, GateMARMUX,
		input logic [15:0] MDR_In,
		output logic [15:0] PC_out,
		output logic [15:0] MDR_out,
		output logic [15:0] MAR_out,
		output logic [15:0] IR_out
);

//internal signals
logic [3:0] gates;
logic [15:0] MDR_D;
assign gates = {GatePC, GateMDR, GateALU, GateMARMUX};

logic [15:0] sext5_out, sext6_out, sext9_out, sext11_out;
logic [15:0] addr1mux_out, addr2mux_out, PCmux_out;

//2-to-1 muxes
assign MDR_D = (MIO_EN) ? MDR_In : bus;

//marmux (without trap)
logic [15:0] MARMUX_out;
assign MARMUX_out = addr1mux_out + addr2mux_out;

regfile regfile_inst
(
	.clk(clk),
	.load()
);

mux16 gateMux
(
	.sel(gates),
	.a(16'hZ),
	.b(MARMUX_out),
	.c(16'hZ),.d(16'hZ),
	.e(MDR_out),
	.f(16'hZ),.g(16'hZ),.h(16'hZ),
	.i(PC_out),
	.j(16'hZ),.k(16'hZ),.l(16'hZ),.m(16'hZ),.n(16'hZ),.o(16'hZ),.p(16'hZ),
	.out(bus)
);

register PC
(
	.clk(clk),
	.load(LD_PC),
	.clear(~Reset),
	.in(PCmux_out),                                                               
	.out(PC_out)
);

mux4 PCmux
(
	.sel(PCMUX),
	.a(PC_out + 16'h1),
	.b(addr1mux_out + addr2mux_out),
	.c(bus),
	.d(16'hX),
	.out(PCmux_out)
);

register MAR
( 
	.load(LD_MAR),
	.clear(~Reset),
	.in(bus),
	.out(MAR_out)
);

register MDR
(
	.clk(clk),
	.load(LD_MDR),
	.clear(~Reset),
	.in(MDR_D),
	.out(MDR_out)
);

register IR
(
	.clk(clk),
	.load(LD_IR),
	.clear(~Reset),
	.in(bus),
	.out(IR_out)
);

mux4 addr2mux
(
	.sel(ADDR2MUX),
	.a(16'h0),
	.b(sext6_out),
	.c(sext9_out),
	.d(sext11_out),
	.out(addr2mux_out)
);

assign addr1mux_out = (ADDR1MUX) ? PC_out : sr1_out;


//sign extension modules
sext #(.width(5))  sext5  (.in(IR_out[4:0]),.out(sext5_out));
sext #(.width(6))  sext6  (.in(IR_out[5:0]),.out(sext6_out));
sext #(.width(9))  sext9  (.in(IR_out[8:0]),.out(sext9_out));
sext #(.width(11)) sext11 (.in(IR_out[10:0]),.out(sext11_out));

endmodule		