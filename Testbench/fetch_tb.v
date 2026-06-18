`timescale 1ns / 1ps

module fetch_tb;

    reg clk;
    reg rst;

    wire [7:0] pc;
    wire [15:0] instruction;

    fetch uut(
        .clk(clk),
        .rst(rst),
        .pc(pc),
        .instruction(instruction)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;

        #10;
        rst = 0;

        #100;

        $finish;

    end

endmodule