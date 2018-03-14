
module lab7_soc (
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	clk_clk,
	reset_reset_n,
	led_wire_export,
	key_2_wire_export,
	key_3_wire_export,
	sw_wire_export);	

	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	led_wire_export;
	input		key_2_wire_export;
	input		key_3_wire_export;
	input	[7:0]	sw_wire_export;
endmodule
