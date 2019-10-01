//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Sep 26 08:39:29 2019
//Host        : SJO-PRODRIGU-L1 running 64-bit major release  (build 9200)
//Command     : generate_target pe_bd.bd
//Design      : pe_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "pe_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pe_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "pe_bd.hwdef" *) 
module pe_bd
   (clk,
    result_out,
    rst_in,
    w_in,
    w_out,
    x_in,
    x_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN pe_bd_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_OUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 24}}}}}}" *) output [31:0]result_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RST_IN DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RST_IN, LAYERED_METADATA undef" *) input [0:0]rst_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.W_IN DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.W_IN, LAYERED_METADATA undef" *) input [31:0]w_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.W_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.W_OUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 24}}}}}}" *) output [31:0]w_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.X_IN DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.X_IN, LAYERED_METADATA undef" *) input [31:0]x_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.X_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.X_OUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 24}}}}}}" *) output [31:0]x_out;

  wire clk_1;
  wire [31:0]pe_1_result_out;
  wire [31:0]pe_1_w_out;
  wire [31:0]pe_1_x_out;
  wire [0:0]rst_in_1;
  wire [31:0]w_in_1;
  wire [31:0]x_in_1;

  assign clk_1 = clk;
  assign result_out[31:0] = pe_1_result_out;
  assign rst_in_1 = rst_in[0];
  assign w_in_1 = w_in[31:0];
  assign w_out[31:0] = pe_1_w_out;
  assign x_in_1 = x_in[31:0];
  assign x_out[31:0] = pe_1_x_out;
  pe_bd_pe_1_0 pe_1
       (.clk(clk_1),
        .result_out(pe_1_result_out),
        .rst_in(rst_in_1),
        .w_in(w_in_1),
        .w_out(pe_1_w_out),
        .x_in(x_in_1),
        .x_out(pe_1_x_out));
endmodule
