`timescale 1ns/1ps
module alwaysBlock (
    input a,b,
    output reg c
);
always @(*) begin
    c=a & b;
end
    
endmodule