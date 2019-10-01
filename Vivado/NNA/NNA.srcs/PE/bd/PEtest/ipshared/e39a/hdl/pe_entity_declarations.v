//-----------------------------------------------------------------
// System Generator version 2019.1 Verilog source file.
//
// Copyright(C) 2019 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2019 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------

`include "conv_pkg.v"
`timescale 1 ns / 10 ps
module pe_xlregister (d, rst, en, ce, clk, q);
   parameter d_width = 5;
   parameter init_value = 'b0;

   input [d_width-1:0] d;
   input rst, en, ce, clk;
   output [d_width-1:0] q;

   wire internal_clr, internal_ce;

   assign internal_clr = rst & ce;
   assign internal_ce  = ce & en;

   synth_reg_w_init #(.width(d_width),
                      .init_index(2),
                      .init_value(init_value),
                      .latency(1))
   synth_reg_inst(.i(d),
                  .ce(internal_ce),
                  .clr(internal_clr),
                  .clk(clk),
                  .o(q));
endmodule

module pe_xlfpfma (a, b, c, ce, clr, clk, rst, en, p);
 
 parameter core_name0= "";
 parameter a_width= 32;
 parameter a_bin_pt= 24;
 parameter a_arith= `xlFloat;
 parameter b_width= 32;
 parameter b_bin_pt= 24;
 parameter b_arith= `xlFloat;
 parameter c_width= 32;
 parameter c_bin_pt= 24;
 parameter c_arith= `xlFloat;
 parameter p_width= 32;
 parameter p_bin_pt= 24;
 parameter p_arith= `xlFloat;
 parameter rst_width= 1;
 parameter rst_bin_pt= 0;
 parameter rst_arith= `xlUnsigned;
 parameter en_width= 1;
 parameter en_bin_pt= 0;
 parameter en_arith= `xlUnsigned;
 parameter a_tdata_width= 32;   
 parameter p_tdata_width= 32;   
 parameter extra_registers= 0;
 parameter latency= 0;
 parameter quantization= `xlTruncate;
 parameter overflow= `xlWrap;
 parameter c_latency= 0;
 
 input [a_width-1:0] a;
 input [b_width-1:0] b;
 input [c_width-1:0] c;
 input ce, clr, clk, rst, en;
 output [p_width-1:0] p;
 
 wire  a_tvalid_net;
 wire  [a_tdata_width-1:0] a_tdata;
 wire  b_tvalid_net;
 wire  [a_tdata_width-1:0] b_tdata;
 wire  c_tvalid_net;
 wire  [a_tdata_width-1:0] c_tdata;
 wire  result_tvalid_net;
 wire  [p_tdata_width-1:0] result_tdata;
 wire  internal_clr;
 wire  internal_ce;
 wire  [p_width-1:0] result;
 
 assign internal_clr = (clr | rst) & ce;
 assign internal_ce = ce & en;
 
 assign a_tvalid_net = 1'b1;
 assign b_tvalid_net = 1'b1;
 assign c_tvalid_net = 1'b1;
 assign a_tdata[a_width-1:0] = a[a_width-1:0];
 assign b_tdata[b_width-1:0] = b[b_width-1:0];
 assign c_tdata[c_width-1:0] = c[c_width-1:0];
 assign result[p_width-1:0] = result_tdata[p_width-1:0];
 
 generate
 


if (core_name0 == "pe_floating_point_v7_1_i0") 
     begin:comp0
pe_floating_point_v7_1_i0 core_instance0 ( 
         .s_axis_a_tvalid(a_tvalid_net),
         .s_axis_a_tdata(a_tdata),
         .s_axis_b_tvalid(b_tvalid_net),
         .s_axis_b_tdata(b_tdata),
         .s_axis_c_tvalid(c_tvalid_net),
         .s_axis_c_tdata(c_tdata),
         .m_axis_result_tvalid(result_tvalid_net),
         .m_axis_result_tdata(result_tdata) 
       ); 
     end 

endgenerate
 
 generate
   if (extra_registers > 0)
   begin:latency_gt_0
     synth_reg # (p_width, extra_registers)
       extra_reg (
         .i(result),
         .ce(internal_ce),
         .clr(internal_clr),
         .clk(clk),
         .o(p));
   end 
 endgenerate
 
 generate
   if (extra_registers == 0)
   begin:latency_eq_0
     assign p = result;
   end 
 endgenerate
 
 endmodule
 
