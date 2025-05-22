`timescale 1ns/1ps
module JKtb;
reg J,K,clk,rst;
wire q;
JK dut(
    .J(J),
    .K(K),
    .clk(clk),
    .rst(rst),
    .q(q)
);
initial clk=1;
always #5 clk=~clk;
initial begin
     $display("Time\tclk\trst\tJ\tK\tq");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, rst, J, K, q);
    for (integer i=0;i<7 ;i+=1 ) begin
        {J,K,rst}=i[2:0];
        #10;
    end
    #20;
    $finish;
end
initial begin
    $dumpfile("JK.vcd");
    $dumpvars(0,JKtb);
end
endmodule;