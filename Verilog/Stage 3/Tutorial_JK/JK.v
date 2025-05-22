`timescale 1ns/1ps
module JK (
    input wire J,K,clk,rst,
    output reg q
);
always @(posedge clk or posedge rst) begin
    if(rst)
        q<=0;
    else if(J&K)
        q<=~q;
    else if(~J&K)
        q<=0;
    else if(J&~K)
         q<=1; 
end
    
    
endmodule