`timescale 1ns/1ps
module DFFtb;
reg clk,rst,d;
wire q;
DFF dut(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);
initial clk=0;
always #5 clk=~clk;
initial begin
    $display("Input\t\tclk\t\trst\t\toutput");
    rst=1;#12;
     $monitor("time=%0t\tclk=%b\trst=%b\td=%b\tq=%b", $time, clk, rst, d, q);
    rst=0;
    #12;

    $finish;
end
initial begin
    $dumpfile("DFF.vcd");
    $dumpvars(0,DFFtb);
end

endmodule