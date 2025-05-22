`timescale 1ns/1ps
module Ex1TB;
    reg [3:0] inputs;
    wire a, b, c, d;
    wire e;

    // Bit-slicing inputs to individual wires
    assign a = inputs[3];
    assign b = inputs[2];
    assign c = inputs[1];
    assign d = inputs[0];

    // Instantiate the Ex1 module
    Ex1 dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e)
    );

    // Testbench stimulus
    initial begin
        inputs = 4'b0000;
        $display("Time\t a b c d e");
        $monitor("%0d\t %b %b %b %b %b", $time, a, b, c, d, e);

        inputs = 4'b0000; #10;
        inputs = 4'b0001; #10;
        inputs = 4'b1111; #10;
        inputs = 4'b1101; #10;
        $finish;
    end

    // VCD dump for GTKWave
    initial begin
        $dumpfile("Ex1.vcd");
        $dumpvars(0, Ex1TB);
    end

endmodule
