
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
	uart_out_ready,
	uart_out_data,
	uart_out_error,
	uart_out_valid,
	uart_in_data,
	uart_in_error,
	uart_in_valid,
	uart_in_ready,
	uart_RXD,
	uart_TXD);	

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
	input		uart_out_ready;
	output	[7:0]	uart_out_data;
	output		uart_out_error;
	output		uart_out_valid;
	input	[7:0]	uart_in_data;
	input		uart_in_error;
	input		uart_in_valid;
	output		uart_in_ready;
	input		uart_RXD;
	output		uart_TXD;
endmodule
