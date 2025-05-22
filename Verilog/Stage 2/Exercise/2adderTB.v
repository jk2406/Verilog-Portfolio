`timescale 1ns/1ps
module TwoBitAdderTB;
   reg  [1:0] a, b;
    reg        cin;
    wire [1:0] sum;
    wire       cout;
TwoBitAdder dut(
    .a(a),
    .b(b),
    .cout(cout),
    .sum(sum),
    .cin(cin)
);
 initial begin
        $display(" a  b cin | sum cout");
        for (integer i = 0; i < 32; i = i + 1) begin
            {a, b, cin} = i[4:0];
            #5;
            $display(" %b  %b  %b  |  %b   %b", a, b, cin, sum, cout);
        end
        $finish;
 end
    initial begin
       $dumpfile("2adder.vcd");
       $dumpvars(0,dut); 
    end

endmodule