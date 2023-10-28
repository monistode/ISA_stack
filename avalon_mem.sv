module sdram_if # (
  parameter ADDR_SIZE = 32,
  parameter DATA_SIZE = 256 )
  ( 
// clk and reset are always required.
    input   logic         clk,
    input   logic         reset,
    // Avalon Master ports
    output  logic         				avm_m0_read,
    output  logic         				avm_m0_write,
    output  logic [DATA_SIZE-1:0] 	    avm_m0_writedata,
    output  logic [ADDR_SIZE-1:0]  	    avm_m0_address,
    input   logic [DATA_SIZE-1:0] 	    avm_m0_readdata,
    input   logic         				avm_m0_readdatavalid,
    output  logic [(DATA_SIZE/8)-1:0]   avm_m0_byteenable,
    input   logic         				avm_m0_waitrequest,
    output  logic [10:0]  				avm_m0_burstcount,
    // External conduit
    input   logic [ADDR_SIZE-1:0]  		address,
    input   logic [(DATA_SIZE/8)-1:0] 	byteenable,
    input   logic         				read,
    output  logic [DATA_SIZE-1:0] 		data_out,
    input   logic         				write,
    input   logic [DATA_SIZE-1:0] 		data_in,
    output  logic         				busy
);

localparam INIT = 3'd0;
localparam READ_START = 3'd1;
localparam READ_END = 3'd2;
localparam WRITE_START = 3'd3;
localparam WRITE_END = 3'd4;

logic [2:0] cur_state;
logic [2:0] next_state;

logic [ADDR_SIZE-1:0] addr;
logic [DATA_SIZE-1:0] data;
logic [(DATA_SIZE/8)-1:0] enable;

// Handling change of the current state to the next requested state
always_ff @(posedge clk) begin
  if (reset) begin
		cur_state <= INIT;
  end else begin 
		cur_state <= next_state;
		
      if (read) begin
			addr <= address;
			enable <= byteenable;
		end else begin
			if (write) begin
				addr <= address;
				enable <= byteenable;
				data <= data_in;
			end
		end
  end
end

// Handling FSM transitions
always_comb begin
  next_state = cur_state;
  busy <= '0;
  case(cur_state)
    INIT: begin
      if (read) begin
			next_state = READ_START;
		end else begin
			if (write) begin
				next_state = WRITE_START;
			end
		end
    end

    READ_START: begin
	   busy <= '1;
      if (avm_m0_waitrequest) next_state = READ_START; // Wait here.
      else next_state = READ_END;
    end

    READ_END: begin
	   busy <= '1;
      if (!avm_m0_readdatavalid) next_state = READ_END; // Wait here.
      else next_state = INIT;
    end
	 
    WRITE_START: begin
	   busy <= '1;
      if (avm_m0_waitrequest) next_state = WRITE_START; // Wait here.
      else next_state = WRITE_END;
    end
	 
    WRITE_END: begin
	   busy <= '1;
      next_state = INIT;
    end

    default: begin
      next_state = INIT;
    end
  endcase
end

// Handling read and write start of each transaction
always_comb begin
  avm_m0_address = '0;
  avm_m0_read = '0;
  avm_m0_write = '0;
  avm_m0_byteenable = '0;
  avm_m0_burstcount = '0;
  avm_m0_writedata = '0;

  case(cur_state)

    READ_START: begin
      avm_m0_address <= addr;
      avm_m0_read = '1;
      avm_m0_byteenable <= enable;
      avm_m0_burstcount = '1;
    end

    WRITE_START: begin
      avm_m0_address <= addr;
      avm_m0_write = '1;
      avm_m0_writedata <= data;
      avm_m0_byteenable <= enable;
      avm_m0_burstcount = '1;
    end
	 
    default: begin
    end
  endcase
end

// Handling read and write end of each transaction
always_ff @(posedge clk) begin
  if (reset) begin
	   data_out <= '0;
  end else begin
    case (cur_state)
	 
      READ_END: begin
        if (avm_m0_readdatavalid) begin
          data_out <= avm_m0_readdata;
        end
      end

      default: begin
      end
    endcase
  end
end

endmodule
