`timescale 1ns / 1ps

module alu_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] alu_control;

    wire [7:0] result;
    wire zero;

    // DUT
    alu uut(
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    initial
    begin

        // ADD : 5 + 3 = 8
        a = 8'd5;
        b = 8'd3;
        alu_control = 3'b000;
        #10;

        // SUB : 10 - 5 = 5
        a = 8'd10;
        b = 8'd5;
        alu_control = 3'b001;
        #10;

        // SUB : 5 - 5 = 0 (zero flag should become 1)
        a = 8'd5;
        b = 8'd5;
        alu_control = 3'b001;
        #10;

        // AND : 5 & 3 = 1
        a = 8'd5;
        b = 8'd3;
        alu_control = 3'b010;
        #10;

        // OR : 5 | 3 = 7
        a = 8'd5;
        b = 8'd3;
        alu_control = 3'b011;
        #10;

        // XOR : 5 ^ 3 = 6
        a = 8'd5;
        b = 8'd3;
        alu_control = 3'b100;
        #10;

        $finish;

    end

endmodule