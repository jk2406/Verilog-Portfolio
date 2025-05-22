`timescale 1ns/1ps
module Ex1 (
    input a,
    input b,
    input c,
    input  d,
    output wire e
);
  assign e= a & b & c & d;   
endmodule