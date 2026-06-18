`timescale 1ns / 1ps

module instruc_mem_tb;

    reg [7:0] address;
    wire [15:0] instruction;

    // DUT
    instruc_mem uut(
        .address(address),
        .instruction(instruction)
    );

    initial
    begin

        address = 8'd0;
        #10;

        address = 8'd1;
        #10;

        address = 8'd2;
        #10;

        address = 8'd3;
        #10;

        address = 8'd4;
        #10;

        $finish;

    end

endmodule