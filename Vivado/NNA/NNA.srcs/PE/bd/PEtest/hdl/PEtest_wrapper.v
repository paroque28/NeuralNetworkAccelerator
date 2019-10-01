//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Sat Sep 28 20:38:31 2019
//Host        : SJO-PRODRIGU-L1 running 64-bit major release  (build 9200)
//Command     : generate_target PEtest_wrapper.bd
//Design      : PEtest_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module PEtest_wrapper
   (clk_100MHz,
    result,
    rst_in,
    w_in,
    w_out,
    x_in,
    x_out);
  input clk_100MHz;
  output [31:0]result;
  input rst_in;
  input [31:0]w_in;
  output [31:0]w_out;
  input [31:0]x_in;
  output [31:0]x_out;

  wire clk_100MHz;
  wire [31:0]result;
  wire rst_in;
  wire [31:0]w_in;
  wire [31:0]w_out;
  wire [31:0]x_in;
  wire [31:0]x_out;

  PEtest PEtest_i
       (.clk_100MHz(clk_100MHz),
        .result(result),
        .rst_in(rst_in),
        .w_in(w_in),
        .w_out(w_out),
        .x_in(x_in),
        .x_out(x_out));
endmodule
