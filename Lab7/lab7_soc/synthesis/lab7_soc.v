// lab7_soc.v

// Generated using ACDS version 15.0 153

`timescale 1 ps / 1 ps
module lab7_soc (
		input  wire        clk_clk,           //        clk.clk
		input  wire        key_2_wire_export, // key_2_wire.export
		input  wire        key_3_wire_export, // key_3_wire.export
		output wire [7:0]  led_wire_export,   //   led_wire.export
		input  wire        reset_reset_n,     //      reset.reset_n
		output wire        sdram_clk_clk,     //  sdram_clk.clk
		output wire [12:0] sdram_wire_addr,   // sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,     //           .ba
		output wire        sdram_wire_cas_n,  //           .cas_n
		output wire        sdram_wire_cke,    //           .cke
		output wire        sdram_wire_cs_n,   //           .cs_n
		inout  wire [31:0] sdram_wire_dq,     //           .dq
		output wire [3:0]  sdram_wire_dqm,    //           .dqm
		output wire        sdram_wire_ras_n,  //           .ras_n
		output wire        sdram_wire_we_n,   //           .we_n
		input  wire [7:0]  sw_wire_export     //    sw_wire.export
	);

	wire         sdram_pll_c0_clk;                                           // sdram_pll:c0 -> [mm_interconnect_0:sdram_pll_c0_clk, rst_controller_001:clk, sdram:clk]
	wire  [31:0] nios2_gen2_0_data_master_readdata;                          // mm_interconnect_0:nios2_gen2_0_data_master_readdata -> nios2_gen2_0:d_readdata
	wire         nios2_gen2_0_data_master_waitrequest;                       // mm_interconnect_0:nios2_gen2_0_data_master_waitrequest -> nios2_gen2_0:d_waitrequest
	wire         nios2_gen2_0_data_master_debugaccess;                       // nios2_gen2_0:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:nios2_gen2_0_data_master_debugaccess
	wire  [28:0] nios2_gen2_0_data_master_address;                           // nios2_gen2_0:d_address -> mm_interconnect_0:nios2_gen2_0_data_master_address
	wire   [3:0] nios2_gen2_0_data_master_byteenable;                        // nios2_gen2_0:d_byteenable -> mm_interconnect_0:nios2_gen2_0_data_master_byteenable
	wire         nios2_gen2_0_data_master_read;                              // nios2_gen2_0:d_read -> mm_interconnect_0:nios2_gen2_0_data_master_read
	wire         nios2_gen2_0_data_master_write;                             // nios2_gen2_0:d_write -> mm_interconnect_0:nios2_gen2_0_data_master_write
	wire  [31:0] nios2_gen2_0_data_master_writedata;                         // nios2_gen2_0:d_writedata -> mm_interconnect_0:nios2_gen2_0_data_master_writedata
	wire  [31:0] nios2_gen2_0_instruction_master_readdata;                   // mm_interconnect_0:nios2_gen2_0_instruction_master_readdata -> nios2_gen2_0:i_readdata
	wire         nios2_gen2_0_instruction_master_waitrequest;                // mm_interconnect_0:nios2_gen2_0_instruction_master_waitrequest -> nios2_gen2_0:i_waitrequest
	wire  [28:0] nios2_gen2_0_instruction_master_address;                    // nios2_gen2_0:i_address -> mm_interconnect_0:nios2_gen2_0_instruction_master_address
	wire         nios2_gen2_0_instruction_master_read;                       // nios2_gen2_0:i_read -> mm_interconnect_0:nios2_gen2_0_instruction_master_read
	wire  [31:0] mm_interconnect_0_sysid_qsys_0_control_slave_readdata;      // sysid_qsys_0:readdata -> mm_interconnect_0:sysid_qsys_0_control_slave_readdata
	wire   [0:0] mm_interconnect_0_sysid_qsys_0_control_slave_address;       // mm_interconnect_0:sysid_qsys_0_control_slave_address -> sysid_qsys_0:address
	wire  [31:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata;    // nios2_gen2_0:debug_mem_slave_readdata -> mm_interconnect_0:nios2_gen2_0_debug_mem_slave_readdata
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest; // nios2_gen2_0:debug_mem_slave_waitrequest -> mm_interconnect_0:nios2_gen2_0_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess; // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_debugaccess -> nios2_gen2_0:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address;     // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_address -> nios2_gen2_0:debug_mem_slave_address
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read;        // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_read -> nios2_gen2_0:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable;  // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_byteenable -> nios2_gen2_0:debug_mem_slave_byteenable
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write;       // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_write -> nios2_gen2_0:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata;   // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_writedata -> nios2_gen2_0:debug_mem_slave_writedata
	wire  [31:0] mm_interconnect_0_sdram_pll_pll_slave_readdata;             // sdram_pll:readdata -> mm_interconnect_0:sdram_pll_pll_slave_readdata
	wire   [1:0] mm_interconnect_0_sdram_pll_pll_slave_address;              // mm_interconnect_0:sdram_pll_pll_slave_address -> sdram_pll:address
	wire         mm_interconnect_0_sdram_pll_pll_slave_read;                 // mm_interconnect_0:sdram_pll_pll_slave_read -> sdram_pll:read
	wire         mm_interconnect_0_sdram_pll_pll_slave_write;                // mm_interconnect_0:sdram_pll_pll_slave_write -> sdram_pll:write
	wire  [31:0] mm_interconnect_0_sdram_pll_pll_slave_writedata;            // mm_interconnect_0:sdram_pll_pll_slave_writedata -> sdram_pll:writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_chipselect;           // mm_interconnect_0:onchip_memory2_0_s1_chipselect -> onchip_memory2_0:chipselect
	wire  [31:0] mm_interconnect_0_onchip_memory2_0_s1_readdata;             // onchip_memory2_0:readdata -> mm_interconnect_0:onchip_memory2_0_s1_readdata
	wire   [1:0] mm_interconnect_0_onchip_memory2_0_s1_address;              // mm_interconnect_0:onchip_memory2_0_s1_address -> onchip_memory2_0:address
	wire   [3:0] mm_interconnect_0_onchip_memory2_0_s1_byteenable;           // mm_interconnect_0:onchip_memory2_0_s1_byteenable -> onchip_memory2_0:byteenable
	wire         mm_interconnect_0_onchip_memory2_0_s1_write;                // mm_interconnect_0:onchip_memory2_0_s1_write -> onchip_memory2_0:write
	wire  [31:0] mm_interconnect_0_onchip_memory2_0_s1_writedata;            // mm_interconnect_0:onchip_memory2_0_s1_writedata -> onchip_memory2_0:writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_clken;                // mm_interconnect_0:onchip_memory2_0_s1_clken -> onchip_memory2_0:clken
	wire         mm_interconnect_0_led_s1_chipselect;                        // mm_interconnect_0:led_s1_chipselect -> led:chipselect
	wire  [31:0] mm_interconnect_0_led_s1_readdata;                          // led:readdata -> mm_interconnect_0:led_s1_readdata
	wire   [1:0] mm_interconnect_0_led_s1_address;                           // mm_interconnect_0:led_s1_address -> led:address
	wire         mm_interconnect_0_led_s1_write;                             // mm_interconnect_0:led_s1_write -> led:write_n
	wire  [31:0] mm_interconnect_0_led_s1_writedata;                         // mm_interconnect_0:led_s1_writedata -> led:writedata
	wire         mm_interconnect_0_sdram_s1_chipselect;                      // mm_interconnect_0:sdram_s1_chipselect -> sdram:az_cs
	wire  [31:0] mm_interconnect_0_sdram_s1_readdata;                        // sdram:za_data -> mm_interconnect_0:sdram_s1_readdata
	wire         mm_interconnect_0_sdram_s1_waitrequest;                     // sdram:za_waitrequest -> mm_interconnect_0:sdram_s1_waitrequest
	wire  [24:0] mm_interconnect_0_sdram_s1_address;                         // mm_interconnect_0:sdram_s1_address -> sdram:az_addr
	wire         mm_interconnect_0_sdram_s1_read;                            // mm_interconnect_0:sdram_s1_read -> sdram:az_rd_n
	wire   [3:0] mm_interconnect_0_sdram_s1_byteenable;                      // mm_interconnect_0:sdram_s1_byteenable -> sdram:az_be_n
	wire         mm_interconnect_0_sdram_s1_readdatavalid;                   // sdram:za_valid -> mm_interconnect_0:sdram_s1_readdatavalid
	wire         mm_interconnect_0_sdram_s1_write;                           // mm_interconnect_0:sdram_s1_write -> sdram:az_wr_n
	wire  [31:0] mm_interconnect_0_sdram_s1_writedata;                       // mm_interconnect_0:sdram_s1_writedata -> sdram:az_data
	wire  [31:0] mm_interconnect_0_key_2_s1_readdata;                        // key_2:readdata -> mm_interconnect_0:key_2_s1_readdata
	wire   [1:0] mm_interconnect_0_key_2_s1_address;                         // mm_interconnect_0:key_2_s1_address -> key_2:address
	wire  [31:0] mm_interconnect_0_key_3_s1_readdata;                        // key_3:readdata -> mm_interconnect_0:key_3_s1_readdata
	wire   [1:0] mm_interconnect_0_key_3_s1_address;                         // mm_interconnect_0:key_3_s1_address -> key_3:address
	wire  [31:0] mm_interconnect_0_sw_s1_readdata;                           // SW:readdata -> mm_interconnect_0:SW_s1_readdata
	wire   [1:0] mm_interconnect_0_sw_s1_address;                            // mm_interconnect_0:SW_s1_address -> SW:address
	wire  [31:0] nios2_gen2_0_irq_irq;                                       // irq_mapper:sender_irq -> nios2_gen2_0:irq
	wire         rst_controller_reset_out_reset;                             // rst_controller:reset_out -> [SW:reset_n, irq_mapper:reset, key_2:reset_n, key_3:reset_n, led:reset_n, mm_interconnect_0:nios2_gen2_0_reset_reset_bridge_in_reset_reset, nios2_gen2_0:reset_n, onchip_memory2_0:reset, rst_translator:in_reset, sdram_pll:reset, sysid_qsys_0:reset_n]
	wire         rst_controller_reset_out_reset_req;                         // rst_controller:reset_req -> [nios2_gen2_0:reset_req, onchip_memory2_0:reset_req, rst_translator:reset_req_in]
	wire         rst_controller_001_reset_out_reset;                         // rst_controller_001:reset_out -> [mm_interconnect_0:sdram_reset_reset_bridge_in_reset_reset, sdram:reset_n]

	lab7_soc_SW sw (
		.clk      (clk_clk),                          //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),  //               reset.reset_n
		.address  (mm_interconnect_0_sw_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_sw_s1_readdata), //                    .readdata
		.in_port  (sw_wire_export)                    // external_connection.export
	);

	lab7_soc_key_2 key_2 (
		.clk      (clk_clk),                             //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),     //               reset.reset_n
		.address  (mm_interconnect_0_key_2_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_key_2_s1_readdata), //                    .readdata
		.in_port  (key_2_wire_export)                    // external_connection.export
	);

	lab7_soc_key_2 key_3 (
		.clk      (clk_clk),                             //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),     //               reset.reset_n
		.address  (mm_interconnect_0_key_3_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_key_3_s1_readdata), //                    .readdata
		.in_port  (key_3_wire_export)                    // external_connection.export
	);

	lab7_soc_led led (
		.clk        (clk_clk),                             //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),     //               reset.reset_n
		.address    (mm_interconnect_0_led_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_s1_readdata),   //                    .readdata
		.out_port   (led_wire_export)                      // external_connection.export
	);

	lab7_soc_nios2_gen2_0 nios2_gen2_0 (
		.clk                                 (clk_clk),                                                    //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                            //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                         //                          .reset_req
		.d_address                           (nios2_gen2_0_data_master_address),                           //               data_master.address
		.d_byteenable                        (nios2_gen2_0_data_master_byteenable),                        //                          .byteenable
		.d_read                              (nios2_gen2_0_data_master_read),                              //                          .read
		.d_readdata                          (nios2_gen2_0_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (nios2_gen2_0_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (nios2_gen2_0_data_master_write),                             //                          .write
		.d_writedata                         (nios2_gen2_0_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (nios2_gen2_0_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (nios2_gen2_0_instruction_master_address),                    //        instruction_master.address
		.i_read                              (nios2_gen2_0_instruction_master_read),                       //                          .read
		.i_readdata                          (nios2_gen2_0_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (nios2_gen2_0_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (nios2_gen2_0_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (),                                                           //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                            // custom_instruction_master.readra
	);

	lab7_soc_onchip_memory2_0 onchip_memory2_0 (
		.clk        (clk_clk),                                          //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory2_0_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory2_0_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory2_0_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory2_0_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory2_0_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory2_0_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_memory2_0_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),                   // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req)                //       .reset_req
	);

	lab7_soc_sdram sdram (
		.clk            (sdram_pll_c0_clk),                         //   clk.clk
		.reset_n        (~rst_controller_001_reset_out_reset),      // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_wire_addr),                          //  wire.export
		.zs_ba          (sdram_wire_ba),                            //      .export
		.zs_cas_n       (sdram_wire_cas_n),                         //      .export
		.zs_cke         (sdram_wire_cke),                           //      .export
		.zs_cs_n        (sdram_wire_cs_n),                          //      .export
		.zs_dq          (sdram_wire_dq),                            //      .export
		.zs_dqm         (sdram_wire_dqm),                           //      .export
		.zs_ras_n       (sdram_wire_ras_n),                         //      .export
		.zs_we_n        (sdram_wire_we_n)                           //      .export
	);

	lab7_soc_sdram_pll sdram_pll (
		.clk       (clk_clk),                                         //       inclk_interface.clk
		.reset     (rst_controller_reset_out_reset),                  // inclk_interface_reset.reset
		.read      (mm_interconnect_0_sdram_pll_pll_slave_read),      //             pll_slave.read
		.write     (mm_interconnect_0_sdram_pll_pll_slave_write),     //                      .write
		.address   (mm_interconnect_0_sdram_pll_pll_slave_address),   //                      .address
		.readdata  (mm_interconnect_0_sdram_pll_pll_slave_readdata),  //                      .readdata
		.writedata (mm_interconnect_0_sdram_pll_pll_slave_writedata), //                      .writedata
		.c0        (sdram_pll_c0_clk),                                //                    c0.clk
		.c1        (sdram_clk_clk),                                   //                    c1.clk
		.areset    (),                                                //        areset_conduit.export
		.locked    (),                                                //        locked_conduit.export
		.phasedone ()                                                 //     phasedone_conduit.export
	);

	lab7_soc_sysid_qsys_0 sysid_qsys_0 (
		.clock    (clk_clk),                                               //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                       //         reset.reset_n
		.readdata (mm_interconnect_0_sysid_qsys_0_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sysid_qsys_0_control_slave_address)   //              .address
	);

	lab7_soc_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                  (clk_clk),                                                    //                                clk_0_clk.clk
		.sdram_pll_c0_clk                               (sdram_pll_c0_clk),                                           //                             sdram_pll_c0.clk
		.nios2_gen2_0_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                             // nios2_gen2_0_reset_reset_bridge_in_reset.reset
		.sdram_reset_reset_bridge_in_reset_reset        (rst_controller_001_reset_out_reset),                         //        sdram_reset_reset_bridge_in_reset.reset
		.nios2_gen2_0_data_master_address               (nios2_gen2_0_data_master_address),                           //                 nios2_gen2_0_data_master.address
		.nios2_gen2_0_data_master_waitrequest           (nios2_gen2_0_data_master_waitrequest),                       //                                         .waitrequest
		.nios2_gen2_0_data_master_byteenable            (nios2_gen2_0_data_master_byteenable),                        //                                         .byteenable
		.nios2_gen2_0_data_master_read                  (nios2_gen2_0_data_master_read),                              //                                         .read
		.nios2_gen2_0_data_master_readdata              (nios2_gen2_0_data_master_readdata),                          //                                         .readdata
		.nios2_gen2_0_data_master_write                 (nios2_gen2_0_data_master_write),                             //                                         .write
		.nios2_gen2_0_data_master_writedata             (nios2_gen2_0_data_master_writedata),                         //                                         .writedata
		.nios2_gen2_0_data_master_debugaccess           (nios2_gen2_0_data_master_debugaccess),                       //                                         .debugaccess
		.nios2_gen2_0_instruction_master_address        (nios2_gen2_0_instruction_master_address),                    //          nios2_gen2_0_instruction_master.address
		.nios2_gen2_0_instruction_master_waitrequest    (nios2_gen2_0_instruction_master_waitrequest),                //                                         .waitrequest
		.nios2_gen2_0_instruction_master_read           (nios2_gen2_0_instruction_master_read),                       //                                         .read
		.nios2_gen2_0_instruction_master_readdata       (nios2_gen2_0_instruction_master_readdata),                   //                                         .readdata
		.key_2_s1_address                               (mm_interconnect_0_key_2_s1_address),                         //                                 key_2_s1.address
		.key_2_s1_readdata                              (mm_interconnect_0_key_2_s1_readdata),                        //                                         .readdata
		.key_3_s1_address                               (mm_interconnect_0_key_3_s1_address),                         //                                 key_3_s1.address
		.key_3_s1_readdata                              (mm_interconnect_0_key_3_s1_readdata),                        //                                         .readdata
		.led_s1_address                                 (mm_interconnect_0_led_s1_address),                           //                                   led_s1.address
		.led_s1_write                                   (mm_interconnect_0_led_s1_write),                             //                                         .write
		.led_s1_readdata                                (mm_interconnect_0_led_s1_readdata),                          //                                         .readdata
		.led_s1_writedata                               (mm_interconnect_0_led_s1_writedata),                         //                                         .writedata
		.led_s1_chipselect                              (mm_interconnect_0_led_s1_chipselect),                        //                                         .chipselect
		.nios2_gen2_0_debug_mem_slave_address           (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address),     //             nios2_gen2_0_debug_mem_slave.address
		.nios2_gen2_0_debug_mem_slave_write             (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write),       //                                         .write
		.nios2_gen2_0_debug_mem_slave_read              (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read),        //                                         .read
		.nios2_gen2_0_debug_mem_slave_readdata          (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata),    //                                         .readdata
		.nios2_gen2_0_debug_mem_slave_writedata         (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata),   //                                         .writedata
		.nios2_gen2_0_debug_mem_slave_byteenable        (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable),  //                                         .byteenable
		.nios2_gen2_0_debug_mem_slave_waitrequest       (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest), //                                         .waitrequest
		.nios2_gen2_0_debug_mem_slave_debugaccess       (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess), //                                         .debugaccess
		.onchip_memory2_0_s1_address                    (mm_interconnect_0_onchip_memory2_0_s1_address),              //                      onchip_memory2_0_s1.address
		.onchip_memory2_0_s1_write                      (mm_interconnect_0_onchip_memory2_0_s1_write),                //                                         .write
		.onchip_memory2_0_s1_readdata                   (mm_interconnect_0_onchip_memory2_0_s1_readdata),             //                                         .readdata
		.onchip_memory2_0_s1_writedata                  (mm_interconnect_0_onchip_memory2_0_s1_writedata),            //                                         .writedata
		.onchip_memory2_0_s1_byteenable                 (mm_interconnect_0_onchip_memory2_0_s1_byteenable),           //                                         .byteenable
		.onchip_memory2_0_s1_chipselect                 (mm_interconnect_0_onchip_memory2_0_s1_chipselect),           //                                         .chipselect
		.onchip_memory2_0_s1_clken                      (mm_interconnect_0_onchip_memory2_0_s1_clken),                //                                         .clken
		.sdram_s1_address                               (mm_interconnect_0_sdram_s1_address),                         //                                 sdram_s1.address
		.sdram_s1_write                                 (mm_interconnect_0_sdram_s1_write),                           //                                         .write
		.sdram_s1_read                                  (mm_interconnect_0_sdram_s1_read),                            //                                         .read
		.sdram_s1_readdata                              (mm_interconnect_0_sdram_s1_readdata),                        //                                         .readdata
		.sdram_s1_writedata                             (mm_interconnect_0_sdram_s1_writedata),                       //                                         .writedata
		.sdram_s1_byteenable                            (mm_interconnect_0_sdram_s1_byteenable),                      //                                         .byteenable
		.sdram_s1_readdatavalid                         (mm_interconnect_0_sdram_s1_readdatavalid),                   //                                         .readdatavalid
		.sdram_s1_waitrequest                           (mm_interconnect_0_sdram_s1_waitrequest),                     //                                         .waitrequest
		.sdram_s1_chipselect                            (mm_interconnect_0_sdram_s1_chipselect),                      //                                         .chipselect
		.sdram_pll_pll_slave_address                    (mm_interconnect_0_sdram_pll_pll_slave_address),              //                      sdram_pll_pll_slave.address
		.sdram_pll_pll_slave_write                      (mm_interconnect_0_sdram_pll_pll_slave_write),                //                                         .write
		.sdram_pll_pll_slave_read                       (mm_interconnect_0_sdram_pll_pll_slave_read),                 //                                         .read
		.sdram_pll_pll_slave_readdata                   (mm_interconnect_0_sdram_pll_pll_slave_readdata),             //                                         .readdata
		.sdram_pll_pll_slave_writedata                  (mm_interconnect_0_sdram_pll_pll_slave_writedata),            //                                         .writedata
		.SW_s1_address                                  (mm_interconnect_0_sw_s1_address),                            //                                    SW_s1.address
		.SW_s1_readdata                                 (mm_interconnect_0_sw_s1_readdata),                           //                                         .readdata
		.sysid_qsys_0_control_slave_address             (mm_interconnect_0_sysid_qsys_0_control_slave_address),       //               sysid_qsys_0_control_slave.address
		.sysid_qsys_0_control_slave_readdata            (mm_interconnect_0_sysid_qsys_0_control_slave_readdata)       //                                         .readdata
	);

	lab7_soc_irq_mapper irq_mapper (
		.clk        (clk_clk),                        //       clk.clk
		.reset      (rst_controller_reset_out_reset), // clk_reset.reset
		.sender_irq (nios2_gen2_0_irq_irq)            //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (sdram_pll_c0_clk),                   //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
