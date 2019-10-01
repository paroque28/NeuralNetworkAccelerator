`timescale 1 ns / 10 ps
// Generated from Simulink block 
module pe_stub (
  input [32-1:0] w_in,
  input [32-1:0] x_in,
  input [1-1:0] rst_in,
  input clk,
  output [32-1:0] w_out,
  output [32-1:0] x_out,
  output [32-1:0] result_out
);
  pe_0 sysgen_dut (
    .w_in(w_in),
    .x_in(x_in),
    .rst_in(rst_in),
    .clk(clk),
    .w_out(w_out),
    .x_out(x_out),
    .result_out(result_out)
  );
endmodule
