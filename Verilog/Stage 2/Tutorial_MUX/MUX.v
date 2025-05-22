`timescale 1ns/1ps
module MUX (
    input wire[1:0] select,
    input wire d0,d1,d2,d3,
    output reg out
);
always @(*) begin
    case (select)
        2'b00:out=d0;
        2'b01:out=d1;
        2'b10:out=d2;
        2'b11:out=d3;
    endcase
    
    
end   
endmodule