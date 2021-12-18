// Code your design here
`timescale 1ns/1ns

module mainFun(input [4:0] A, input [4:0] B, input s, output [4:0] out);
  wire [4:0] aInput, bInput;
  MultiPlexerModule M1 ({A,1'b0},{A,1'b0},s, aInput); 
  MultiPlexerModule M2 (({B[4],B}),~{B[4],B},~s,bInput);
  
  Adder6BitsModule AdderInstance (aInput, bInput, ~s, out);
endmodule




module MultiPlexerModule (input [4:0] X, input [4:0]Y, input s, output [4:0] result);
  // register wire with 5 bits 
  reg [4:0] result;
 always@(*)
 begin
   if (s==0)
 result = X;
 else result = Y;
 end
endmodule



module Adder6BitsModule (input [4:0] A, input [4:0] B, input s, output[4:0] out);
  wire [5:1] C;
// create instances of full adder moudle 
FullAdderModule fa1 (A[0], B[0], s, out[0], C[1]);
FullAdderModule fa2 (A[1], B[1], C[1], out[1], C[2]);
FullAdderModule fa3 (A[2], B[2], C[2], out[2], C[3]);
FullAdderModule fa4 (A[3], B[3], C[3], out[3], C[4]);
FullAdderModule fa5 (A[4], B[4], C[4], out[4], C[5]);
endmodule



module FullAdderModule (input A,input B, input cin, output Y, output cout);
assign Y = A ^ B ^ cin;
  assign cout = (A & B) | (B & cin) | (cin & A);
endmodule
