`ifndef xlConvPkgIncluded
`include "conv_pkg.v"
`endif

`timescale 1 ns / 10 ps
// Generated from Simulink block PE_struct
module pe_struct (
  input [32-1:0] w_in,
  input [32-1:0] x_in,
  input [1-1:0] rst_in,
  input clk_1,
  input ce_1,
  output [32-1:0] w_out,
  output [32-1:0] x_out,
  output [32-1:0] result_out
);
  wire [32-1:0] w_in_net;
  wire [32-1:0] w_reg_q_net;
  wire [32-1:0] x_reg_q_net;
  wire [1-1:0] rst_in_net;
  wire [32-1:0] x_in_net;
  wire [32-1:0] multadd_p_net;
  wire ce_net;
  wire [32-1:0] accumulator_q_net;
  wire clk_net;
  assign w_in_net = w_in;
  assign w_out = w_reg_q_net;
  assign x_in_net = x_in;
  assign x_out = x_reg_q_net;
  assign result_out = accumulator_q_net;
  assign rst_in_net = rst_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  pe_xlfpfma #(
    .a_arith(`xlFloat),
    .a_bin_pt(24),
    .a_tdata_width(32),
    .a_width(32),
    .b_arith(`xlFloat),
    .b_bin_pt(24),
    .b_width(32),
    .c_arith(`xlFloat),
    .c_bin_pt(24),
    .c_latency(0),
    .c_width(32),
    .core_name0("pe_floating_point_v7_1_i0"),
    .extra_registers(0),
    .latency(0),
    .overflow(0),
    .p_arith(`xlFloat),
    .p_bin_pt(24),
    .p_tdata_width(32),
    .p_width(32),
    .quantization(0)
  )
  multadd (
    .clr(1'b0),
    .en(1'b1),
    .a(x_in_net),
    .b(w_in_net),
    .c(accumulator_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .p(multadd_p_net)
  );
  pe_xlregister #(
    .d_width(32),
    .init_value(32'b00000000000000000000000000000000)
  )
  accumulator (
    .en(1'b1),
    .d(multadd_p_net),
    .rst(rst_in_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(accumulator_q_net)
  );
  pe_xlregister #(
    .d_width(32),
    .init_value(32'b00000000000000000000000000000000)
  )
  w_reg (
    .en(1'b1),
    .d(w_in_net),
    .rst(rst_in_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(w_reg_q_net)
  );
  pe_xlregister #(
    .d_width(32),
    .init_value(32'b00000000000000000000000000000000)
  )
  x_reg (
    .en(1'b1),
    .d(x_in_net),
    .rst(rst_in_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(x_reg_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
module pe_default_clock_driver (
  input pe_sysclk,
  input pe_sysce,
  input pe_sysclr,
  output pe_clk1,
  output pe_ce1
);
  xlclockdriver #(
    .period(1),
    .log_2_period(1)
  )
  clockdriver (
    .sysclk(pe_sysclk),
    .sysce(pe_sysce),
    .sysclr(pe_sysclr),
    .clk(pe_clk1),
    .ce(pe_ce1)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
(* core_generation_info = "pe,sysgen_core_2019_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplus,part=xczu9eg,speed=-2-e,package=ffvb1156,synthesis_language=verilog,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=1,interface_doc=1,ce_clr=0,clock_period=10,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=10,multadd=1,register=3,}" *)
module pe (
  input [32-1:0] w_in,
  input [32-1:0] x_in,
  input [1-1:0] rst_in,
  input clk,
  output [32-1:0] w_out,
  output [32-1:0] x_out,
  output [32-1:0] result_out
);
  wire clk_1_net;
  wire ce_1_net;
  pe_default_clock_driver pe_default_clock_driver (
    .pe_sysclk(clk),
    .pe_sysce(1'b1),
    .pe_sysclr(1'b0),
    .pe_clk1(clk_1_net),
    .pe_ce1(ce_1_net)
  );
  pe_struct pe_struct (
    .w_in(w_in),
    .x_in(x_in),
    .rst_in(rst_in),
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .w_out(w_out),
    .x_out(x_out),
    .result_out(result_out)
  );
endmodule
