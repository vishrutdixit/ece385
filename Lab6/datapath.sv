module datapath (
		input logic clk,
		inout wire   [15:0] bus,
		input logic         LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED, MIO_EN, Reset, // for PAUSE instruction				
		input logic         GatePC, GateMDR, GateALU, GateMARMUX,				
		input logic         DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
		input logic  [1:0]  PCMUX,
		input logic  [1:0]  ADDR2MUX, ALUK,
		input logic  [15:0] MDR_In,
		output logic [15:0] PC_out,
		output logic [15:0] MDR_out,
		output logic [15:0] MAR_out,
		output logic [15:0] IR_out,
		output logic BEN_out
);

//internal signals
logic BEN_in;
logic [2:0] nzp_in, nzp_out, sr1mux_out, drmux_out;
logic [3:0] gates;
logic [15:0] MDR_D;

logic [15:0] sext5_out, sext6_out, sext9_out, sext11_out, ALU_out;
logic [15:0] addr1mux_out, addr2mux_out, PCmux_out, sr2mux_out;
logic [15:0] sr1_out, sr2_out;

//2-to-1 muxes
assign MDR_D = (MIO_EN) ? MDR_In : bus;
assign addr1mux_out = (~ADDR1MUX) ? PC_out : sr1_out;
assign sr1mux_out = (SR1MUX) ? IR_out[11:9] : IR_out[8:6];
assign drmux_out = (DRMUX) ? 3'b111 : IR_out[11:9];
assign sr2mux_out = (SR2MUX) ? sext5_out : sr2_out;

//marmux (without trap)
logic [15:0] MARMUX_out;
assign MARMUX_out = addr1mux_out + addr2mux_out;


assign gates = {GatePC, GateMDR, GateALU, GateMARMUX};

mux16 gateMux
(
	.sel(gates),
	.a(16'hZ),
	.b(MARMUX_out),	
	.c(ALU_out),
	.d(16'hZ),
	.e(MDR_out),
	.f(16'hZ),.g(16'hZ),.h(16'hZ),
	.i(PC_out),
	.j(16'hZ),.k(16'hZ),.l(16'hZ),.m(16'hZ),.n(16'hZ),.o(16'hZ),.p(16'hZ),
	.out(bus)
);

regfile regfile_inst
(
	.clk(clk),
	.load(LD_REG),
	.in(bus),
	.src_a(sr1mux_out),
	.src_b(IR_out[2:0]),
	.dest(drmux_out),
	.sr1_out(sr1_out),
	.sr2_out(sr2_out)
);

ALU ALU_inst
(
	.ALUK(ALUK),
	.A(sr1_out),
	.B(sr2mux_out),
	.out(ALU_out)
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
	.b(bus),					// output of the adder
	.c(MARMUX_out),
	.d(16'hX),
	.out(PCmux_out)
);

register MAR
( 
	.clk(clk),
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

//CC-assign logic
assign nzp_in[0] = ~bus[15];
assign nzp_in[1] = (bus == 16'd0) ? 1'b1 : 1'b0;
assign nzp_in[2] = bus[15];

register #(.width(3)) nzp
(
	.clk(clk),
	.load(LD_CC),
	.clear(~Reset),
	.in(nzp_in),
	.out(nzp_out)
);

nzp_comp nzp_comp_inst
(
	.a(nzp_out),
	.b(IR_out[11:9]),
	.out(BEN_in)
);

assign BEN_out = (LD_BEN) ? (BEN_in) : 1'b0;

//register #(.width(1)) BEN
//(
//	.clk(clk),
//	.load(LD_BEN),
//	.clear(~Reset),
//	.in(BEN_in),
//	.out(BEN_out)
//);

//sign extension modules
sext #(.width(5))  sext5  (.in(IR_out[4:0]),.out(sext5_out));
sext #(.width(6))  sext6  (.in(IR_out[5:0]),.out(sext6_out));
sext #(.width(9))  sext9  (.in(IR_out[8:0]),.out(sext9_out));
sext #(.width(11)) sext11 (.in(IR_out[10:0]),.out(sext11_out));

endmodule		