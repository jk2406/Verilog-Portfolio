`timescale 1ns/1ps
module alwaysTB;
    reg [1:0] ab;  // 2-bit vector for a and b
    wire c;
    
    // Instantiate the alwaysBlock module
    alwaysBlock dut(
        .a(ab[1]),
        .b(ab[0]),
        .c(c)
    );
    
    // Generate test vectors
    initial begin
        $monitor("Time :%0b/t, %b %b %b ",$time,ab[1],ab[0],c);
        ab = 2'b00; #5;
        ab = 2'b01; #5;
        ab = 2'b10; #5;
        ab = 2'b11; #5;
        $finish;
    end
    
    // Dump waveforms
    initial begin
        $dumpfile("T.vcd");
        $dumpvars(0, alwaysTB);
    end
endmodule
