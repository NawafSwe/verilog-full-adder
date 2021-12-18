// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module mainFun_tb();
  wire [4:0] out;
  reg [4:0] A, B;
reg s;
  mainFun tst (A, B, s, out);
initial begin
$dumpfile("mainFun_tb.vcd");



$dumpvars(1,mainFun_tb);

A=0; B=0; s=0;
#10 A=2; B=2; s=1;
#10 A=4; B=2; s=1;
#10 A=-5; B=-5; s=1;
#10 A=-5; B=5; s=1;
#20 $finish;

end
endmodule
