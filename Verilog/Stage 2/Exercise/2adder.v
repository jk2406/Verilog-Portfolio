`timescale 1ns/1ps
module TwoBitAdder (
    input wire [1:0] a,b,
    input wire cin,
    output reg[1:0] sum,
    output reg cout
);
  always @(*) begin
    sum[0]=a[0]^b[0]^cin;
    cout=(a[0]&b[0])|(cin&(a[0]^b[0]));
    sum[1]=a[1]^b[1]^cout;
    cout=(a[1]&b[1])|(cout&(a[1]^b[1]));
  end  
endmodule