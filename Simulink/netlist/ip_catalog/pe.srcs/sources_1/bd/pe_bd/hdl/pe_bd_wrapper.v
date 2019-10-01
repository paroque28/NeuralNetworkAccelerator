//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Sep 26 08:39:29 2019
//Host        : SJO-PRODRIGU-L1 running 64-bit major release  (build 9200)
//Command     : generate_target pe_bd_wrapper.bd
//Design      : pe_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module pe_bd_wrapper
   (clk,
    result_out,
    rst_in,
    w_in,
    w_out,
    x_in,
    x_out);
  input clk;
  output [31:0]result_out;
  input [0:0]rst_in;
  input [31:0]w_in;
  output [31:0]w_out;
  input [31:0]x_in;
  output [31:0]x_out;

  wire clk;
  wire [31:0]result_out;
  wire [0:0]rst_in;
  wire [31:0]w_in;
  wire [31:0]w_out;
  wire [31:0]x_in;
  wire [31:0]x_out;

  pe_bd pe_bd_i
       (.clk(clk),
        .result_out(result_out),
        .rst_in(rst_in),
        .w_in(w_in),
        .w_out(w_out),
        .x_in(x_in),
        .x_out(x_out));
endmodule
