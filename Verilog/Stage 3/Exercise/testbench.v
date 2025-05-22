`timescale 1ns/1ps
module Testbench_LoadableUpDownCounter;
reg clk,rst,load_en,up_dn;
reg[7:0] load_data;
wire[7:0]  count;
LoadableUpDowncounter dut(
    .clk(clk),
    .rst(rst),
    .load_en(load_en),
    .up_dn(up_dn),
    .load_data(load_data),
    .count(count)
);

initial clk=1;

initial begin
   
load_data=8'b10010011;
end

always #5 clk=~clk;//clock generator 10ns period,50%duty cycle

initial begin
    $display("Load Data = %b\n",load_data);
    $display("clock\treset\tloadEnable\tUpDownEnable\tcount");
    $monitor("%b\t%b\t%b\t%b\t%b",clk,rst,load_en,up_dn,count);
    rst=1;//set the value to zero
    #10;//wait for one clock period
    rst=0;//set reset back to zero
    for (integer i=0;i<8 ;i+=1) begin
        {rst,load_en,up_dn}=i[2:0];//test every combination of three
        #5;
    end
    rst=0;
    load_en=0;
    up_dn=1;
    #100;//enabling up count and letting counter run for 100ns
    up_dn=0;//down count enable
    #100;//let the counter down count for 100ns
    $finish;
end
initial begin
    $dumpfile("LoadUpDowncounter.vcd");
    $dumpvars(0,Testbench_LoadableUpDownCounter);
end


endmodule