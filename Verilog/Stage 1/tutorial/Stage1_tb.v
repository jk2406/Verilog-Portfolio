`timescale 1ns/1ps
module Stage1_tb;
    // Testbench signals
    reg tb_a, tb_b;
    wire tb_c;

    // Instantiate DUT (Device Under Test)
    Stage1 dut(
        .a(tb_a),
        .b(tb_b),
        .c(tb_c)
    );

    // Test stimulus
    initial begin
        tb_a = 0; tb_b = 0; #10;
        {tb_a, tb_b} = 2'b00; #10;
        {tb_a, tb_b} = 2'b01; #10;
        {tb_a, tb_b} = 2'b10; #10;
        {tb_a, tb_b} = 2'b11; #10;
        $finish;
    end

    // Dump waveforms for GTKWave
    initial begin
        $dumpfile("Stage1.vcd");
        $dumpvars(0, Stage1_tb);
    end
    
endmodule
