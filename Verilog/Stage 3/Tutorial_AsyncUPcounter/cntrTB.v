`timescale 1ns/1ps
module cntrtb;
reg clk,rst;
wire[3:0] count;
SimpleUPcounter dut(
    .clk(clk),
    .rst(rst),
    .count(count)
);
initial rst=1;
initial clk=0;
always #5 clk=~clk;
initial begin
    rst=0;
    $display("Clock\t\tReset\t\tCount");
    $monitor("%b\t\t%b\t\t%b\t\t",clk,rst,count);
    #20;
    rst=1;
    #20;
    rst=0;
    #200;
    $finish;
end
initial begin
    $dumpfile("cntr.vcd");
    $dumpvars(0,cntrtb);
end
endmodule