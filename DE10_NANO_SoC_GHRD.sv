//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE10_NANO_SoC_GHRD(

    //////////// CLOCK //////////
    input logic              FPGA_CLK1_50,
    input logic              FPGA_CLK2_50,
    input logic              FPGA_CLK3_50,

    //////////// HPS //////////
    output logic  [14: 0]    HPS_DDR3_ADDR,
    output logic  [ 2: 0]    HPS_DDR3_BA,
    output logic             HPS_DDR3_CAS_N,
    output logic             HPS_DDR3_CK_N,
    output logic             HPS_DDR3_CK_P,
    output logic             HPS_DDR3_CKE,
    output logic             HPS_DDR3_CS_N,
    output logic  [ 3: 0]    HPS_DDR3_DM,
    inout  logic  [31: 0]    HPS_DDR3_DQ,
    inout  logic  [ 3: 0]    HPS_DDR3_DQS_N,
    inout  logic  [ 3: 0]    HPS_DDR3_DQS_P,
    output logic             HPS_DDR3_ODT,
    output logic             HPS_DDR3_RAS_N,
    output logic             HPS_DDR3_RESET_N,
    input  logic             HPS_DDR3_RZQ,
    output logic             HPS_DDR3_WE_N,

    //////////// LED //////////
    output logic  [ 7: 0]    LED
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
logic hps_fpga_reset_n;
logic fpga_clk_50;

logic [15:0] address = 16'd0;
logic read = 1'b0;
logic write = 1'b0;
logic acknowledge;
logic [31:0] read_data;
logic [31:0] write_data = 64'd0;
logic [3:0] byte_enable = 8'b11111111;

// connection of internal logics
assign fpga_clk_50 = FPGA_CLK1_50;

//=======================================================
//  Structural coding
//=======================================================
soc_system u_u0(
    //Clock&Resetread_data[6:0]
    .clk_clk(FPGA_CLK1_50),                                      //                            clk.clk
    .reset_reset_n(hps_fpga_reset_n),                            //                          reset.reset_n
    //HPS ddr3
    .memory_mem_a(HPS_DDR3_ADDR),                                //                         memory.mem_a
    .memory_mem_ba(HPS_DDR3_BA),                                 //                               .mem_ba
    .memory_mem_ck(HPS_DDR3_CK_P),                               //                               .mem_ck
    .memory_mem_ck_n(HPS_DDR3_CK_N),                             //                               .mem_ck_n
    .memory_mem_cke(HPS_DDR3_CKE),                               //                               .mem_cke
    .memory_mem_cs_n(HPS_DDR3_CS_N),                             //                               .mem_cs_n
    .memory_mem_ras_n(HPS_DDR3_RAS_N),                           //                               .mem_ras_n
    .memory_mem_cas_n(HPS_DDR3_CAS_N),                           //                               .mem_cas_n
    .memory_mem_we_n(HPS_DDR3_WE_N),                             //                               .mem_we_n
    .memory_mem_reset_n(HPS_DDR3_RESET_N),                       //                               .mem_reset_n
    .memory_mem_dq(HPS_DDR3_DQ),                                 //                               .mem_dq
    .memory_mem_dqs(HPS_DDR3_DQS_P),                             //                               .mem_dqs
    .memory_mem_dqs_n(HPS_DDR3_DQS_N),                           //                               .mem_dqs_n
    .memory_mem_odt(HPS_DDR3_ODT),                               //                               .mem_odt
    .memory_mem_dm(HPS_DDR3_DM),                                 //                               .mem_dm
    .memory_oct_rzqin(HPS_DDR3_RZQ),                             //                               .oct_rzqin

    .hps_0_h2f_reset_reset_n(hps_fpga_reset_n),                  //                hps_0_h2f_reset.reset_n
    .sdram_address(address),
    .sdram_byte_enable(byte_enable),                             //                .byte_enable
    .sdram_read(read),              //                .read
    .sdram_write(write),             //                .write
    .sdram_write_data(write_data),        //                .write_data
    .sdram_acknowledge(acknowledge),       //                .acknowledge
    .sdram_read_data(read_data)
);

enum int unsigned {
    STATE_INIT = 0,
    STATE_READ_PENDING = 1,
    STATE_WRITE_PENDING = 2
} cur_state, next_state;

reg [63:0] data        = 64'd0;

assign LED[7: 0] = data[7:0];

logic read_req  = 0;
logic write_req = 0;
logic [7:0] byte_en = 8'hFF;

// State switch logic
always_comb begin
    next_state = cur_state;
    case (cur_state)
        STATE_INIT: begin
            if (read_req) next_state = STATE_READ_PENDING;
            else if (write_req) next_state = STATE_WRITE_PENDING;
        end

        STATE_READ_PENDING: begin
            if (acknowledge) next_state = STATE_INIT;
          end

        STATE_WRITE_PENDING: begin
            if (acknowledge) next_state = STATE_INIT;
        end

        default: begin
            next_state = STATE_INIT;
        end
    endcase
end

always_comb begin
    read = 0;
    write = 0;
	 byte_enable = byte_en;
     
    case (cur_state)
        STATE_READ_PENDING: begin
            read = 1;
        end

        STATE_WRITE_PENDING: begin
            write = 1;
        end

        default: begin
        end
    endcase
end

always_ff @(posedge fpga_clk_50 or negedge hps_fpga_reset_n) begin
    if (~hps_fpga_reset_n) begin
         read_req <= '0;
         write_req <= '0;
         cur_state <= STATE_INIT;
    end else begin
        cur_state <= next_state;
        case (cur_state)
            STATE_INIT: begin
                 if (data[7:0] == 255) begin
					  		byte_en <= 4'b1000;
                     write_data[31:24] <= data[23:16] + data[15:8];
							address <= 16'd4;
                     write_req <= '1;
                     read_req <= '0;
                 end else begin
					      address <= 16'd0;
							byte_en <= 4'b1111;
                     read_req <= 2'd1;
                     write_req <= '0;
                 end
            end

            STATE_READ_PENDING: begin
                if (acknowledge) data <= read_data;  
                read_req <= 0;
                write_req <= 0;
            end

            STATE_WRITE_PENDING: begin
                read_req <= 0;
                write_req <= 0;
					 data[7:0] <= '0;
            end

            default: begin
                read_req <= 0;
                write_req <= 0;
            end
        endcase
    end
end

endmodule
