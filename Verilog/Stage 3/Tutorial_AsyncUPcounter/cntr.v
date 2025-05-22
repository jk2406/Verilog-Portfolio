`timescale 1ns/1ps
module SimpleUPcounter (
    input wire rst,clk,
    output reg[3:0] count
);

always @(posedge clk or posedge rst ) begin
    if(rst)
        count<=4'b0000;
    else if(clk)
        count<=count +1;      
end   
endmodule