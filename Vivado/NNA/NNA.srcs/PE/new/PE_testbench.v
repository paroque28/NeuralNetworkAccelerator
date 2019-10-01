`timescale 1 ns / 1 ns


module pe_tb();
 
  reg clk, rst_in;
  reg [31:0] x_in, w_in;
  wire [31:0] x_out, w_out, result;


  PEtest_wrapper DUT
   (.clk_100MHz(clk),
    .rst_in(rst_in),
    .w_in(w_in),
    .w_out(w_out),
    .x_in(x_in),
    .x_out(x_out));
 
  initial begin
    clk = 0;
    rst_in = 0;
    x_in = $random();
    w_in = $random();
    #10
    rst_in = 1;
    #10
    rst_in = 0;
    #10
    x_in = $random();
    w_in = $random();
    #10
    x_in = $random();
    w_in = $random();
    #10
    $finish;
  end
  
  always 
      #10  clk =  ! clk; 
 
endmodule