//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Sun Sep 22 09:45:26 2019
//Host        : SJO-PRODRIGU-L1 running 64-bit major release  (build 9200)
//Command     : generate_target config_mpsoc_wrapper.bd
//Design      : config_mpsoc_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module config_mpsoc_wrapper
   (reset);
  input reset;

  wire reset;

  config_mpsoc config_mpsoc_i
       (.reset(reset));
endmodule
