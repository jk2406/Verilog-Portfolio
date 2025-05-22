`timescale 1ns/1ps
module LoadableUpDowncounter (
    input wire clk,rst,up_dn,load_en,
    input wire[7:0] load_data,
    output reg[7:0] count
);
always @(posedge clk) begin
    if(rst)
        count<=8'b00000000;
    else if(load_en)
        count<=load_data;
    else if(up_dn)
        count<=count+1;
    else
        count<=count-1;   
end   
endmodule