`timescale 1ns/1ps
module MUXtb;

reg [1:0] select;
reg d0, d1, d2, d3;
wire out;
integer i;

// Instantiate the MUX
MUX dut (
    .select(select),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .out(out)
);

initial begin
    // Set static values to inputs
    d0 = 1'b1;
    d1 = 1'b0;
    d2 = 1'b1;
    d3 = 1'b0;

    $display("Select\tSelected Input\tOut");
    for (i = 0; i < 4; i = i + 1) begin
        select = i[1:0];
        #1; // wait for mux output to stabilize

        // Display which input was selected
        case (select)
            2'b00: $display("%b\t\td0\t\t%b", select, out);
            2'b01: $display("%b\t\td1\t\t%b", select, out);
            2'b10: $display("%b\t\td2\t\t%b", select, out);
            2'b11: $display("%b\t\td3\t\t%b", select, out);
        endcase
    end
end
initial begin
    $dumpfile("MUX.vcd");
    $dumpvars(0,MUXtb);
end
endmodule
