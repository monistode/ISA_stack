
module soc_system (
	clk_clk,
	hps_0_h2f_reset_reset_n,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	reset_reset_n,
	sdram_address,
	sdram_byte_enable,
	sdram_read,
	sdram_write,
	sdram_write_data,
	sdram_acknowledge,
	sdram_read_data,
	uart_0_external_connection_rxd,
	uart_0_external_connection_txd,
	uart_bridge_s0_waitrequest,
	uart_bridge_s0_readdata,
	uart_bridge_s0_readdatavalid,
	uart_bridge_s0_burstcount,
	uart_bridge_s0_writedata,
	uart_bridge_s0_address,
	uart_bridge_s0_write,
	uart_bridge_s0_read,
	uart_bridge_s0_byteenable,
	uart_bridge_s0_debugaccess);	

	input		clk_clk;
	output		hps_0_h2f_reset_reset_n;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	input		reset_reset_n;
	input	[15:0]	sdram_address;
	input	[3:0]	sdram_byte_enable;
	input		sdram_read;
	input		sdram_write;
	input	[31:0]	sdram_write_data;
	output		sdram_acknowledge;
	output	[31:0]	sdram_read_data;
	input		uart_0_external_connection_rxd;
	output		uart_0_external_connection_txd;
	output		uart_bridge_s0_waitrequest;
	output	[7:0]	uart_bridge_s0_readdata;
	output		uart_bridge_s0_readdatavalid;
	input	[0:0]	uart_bridge_s0_burstcount;
	input	[7:0]	uart_bridge_s0_writedata;
	input	[4:0]	uart_bridge_s0_address;
	input		uart_bridge_s0_write;
	input		uart_bridge_s0_read;
	input	[0:0]	uart_bridge_s0_byteenable;
	input		uart_bridge_s0_debugaccess;
endmodule
