// soc_system.v

// Generated using ACDS version 22.1 922

`timescale 1 ps / 1 ps
module soc_system (
		input  wire        clk_clk,                 //             clk.clk
		output wire        hps_0_h2f_reset_reset_n, // hps_0_h2f_reset.reset_n
		output wire [14:0] memory_mem_a,            //          memory.mem_a
		output wire [2:0]  memory_mem_ba,           //                .mem_ba
		output wire        memory_mem_ck,           //                .mem_ck
		output wire        memory_mem_ck_n,         //                .mem_ck_n
		output wire        memory_mem_cke,          //                .mem_cke
		output wire        memory_mem_cs_n,         //                .mem_cs_n
		output wire        memory_mem_ras_n,        //                .mem_ras_n
		output wire        memory_mem_cas_n,        //                .mem_cas_n
		output wire        memory_mem_we_n,         //                .mem_we_n
		output wire        memory_mem_reset_n,      //                .mem_reset_n
		inout  wire [31:0] memory_mem_dq,           //                .mem_dq
		inout  wire [3:0]  memory_mem_dqs,          //                .mem_dqs
		inout  wire [3:0]  memory_mem_dqs_n,        //                .mem_dqs_n
		output wire        memory_mem_odt,          //                .mem_odt
		output wire [3:0]  memory_mem_dm,           //                .mem_dm
		input  wire        memory_oct_rzqin,        //                .oct_rzqin
		input  wire        reset_reset_n            //           reset.reset_n
	);

	soc_system_hps_0 #(
		.F2S_Width (0),
		.S2F_Width (2)
	) hps_0 (
		.mem_a       (memory_mem_a),            //         memory.mem_a
		.mem_ba      (memory_mem_ba),           //               .mem_ba
		.mem_ck      (memory_mem_ck),           //               .mem_ck
		.mem_ck_n    (memory_mem_ck_n),         //               .mem_ck_n
		.mem_cke     (memory_mem_cke),          //               .mem_cke
		.mem_cs_n    (memory_mem_cs_n),         //               .mem_cs_n
		.mem_ras_n   (memory_mem_ras_n),        //               .mem_ras_n
		.mem_cas_n   (memory_mem_cas_n),        //               .mem_cas_n
		.mem_we_n    (memory_mem_we_n),         //               .mem_we_n
		.mem_reset_n (memory_mem_reset_n),      //               .mem_reset_n
		.mem_dq      (memory_mem_dq),           //               .mem_dq
		.mem_dqs     (memory_mem_dqs),          //               .mem_dqs
		.mem_dqs_n   (memory_mem_dqs_n),        //               .mem_dqs_n
		.mem_odt     (memory_mem_odt),          //               .mem_odt
		.mem_dm      (memory_mem_dm),           //               .mem_dm
		.oct_rzqin   (memory_oct_rzqin),        //               .oct_rzqin
		.h2f_rst_n   (hps_0_h2f_reset_reset_n), //      h2f_reset.reset_n
		.h2f_axi_clk (clk_clk),                 //  h2f_axi_clock.clk
		.h2f_AWID    (),                        // h2f_axi_master.awid
		.h2f_AWADDR  (),                        //               .awaddr
		.h2f_AWLEN   (),                        //               .awlen
		.h2f_AWSIZE  (),                        //               .awsize
		.h2f_AWBURST (),                        //               .awburst
		.h2f_AWLOCK  (),                        //               .awlock
		.h2f_AWCACHE (),                        //               .awcache
		.h2f_AWPROT  (),                        //               .awprot
		.h2f_AWVALID (),                        //               .awvalid
		.h2f_AWREADY (),                        //               .awready
		.h2f_WID     (),                        //               .wid
		.h2f_WDATA   (),                        //               .wdata
		.h2f_WSTRB   (),                        //               .wstrb
		.h2f_WLAST   (),                        //               .wlast
		.h2f_WVALID  (),                        //               .wvalid
		.h2f_WREADY  (),                        //               .wready
		.h2f_BID     (),                        //               .bid
		.h2f_BRESP   (),                        //               .bresp
		.h2f_BVALID  (),                        //               .bvalid
		.h2f_BREADY  (),                        //               .bready
		.h2f_ARID    (),                        //               .arid
		.h2f_ARADDR  (),                        //               .araddr
		.h2f_ARLEN   (),                        //               .arlen
		.h2f_ARSIZE  (),                        //               .arsize
		.h2f_ARBURST (),                        //               .arburst
		.h2f_ARLOCK  (),                        //               .arlock
		.h2f_ARCACHE (),                        //               .arcache
		.h2f_ARPROT  (),                        //               .arprot
		.h2f_ARVALID (),                        //               .arvalid
		.h2f_ARREADY (),                        //               .arready
		.h2f_RID     (),                        //               .rid
		.h2f_RDATA   (),                        //               .rdata
		.h2f_RRESP   (),                        //               .rresp
		.h2f_RLAST   (),                        //               .rlast
		.h2f_RVALID  (),                        //               .rvalid
		.h2f_RREADY  ()                         //               .rready
	);

endmodule
