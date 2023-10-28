module mem_reader (
  input  logic clk,
  input  logic reset,

  input  logic avs_s0_write,
  output logic [10:0] avs_s0_address,
  input  logic [63:0] avs_s0_writedata,

  input  logic [10:0] address,
  output logic [63:0] pio_out
);

assign avs_s0_address = address;

always_ff @ (posedge clk) begin
  if (reset) begin
    pio_out <= '0;
  end else if (avs_s0_write) begin
    pio_out <= avs_s0_writedata;
  end else begin
    pio_out <= pio_out;
  end
end

endmodule