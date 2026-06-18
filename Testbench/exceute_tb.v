`timescale 1ns / 1ps

module execute_tb;

    reg clk;
    reg rst;
    reg [15:0] instruction;

    wire [7:0] alu_result;

    execute_unit uut(
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .alu_result(alu_result)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial
    begin
        clk = 0;
        rst = 1;

        // ADD R3,R1,R2
        instruction = 16'b0000_001_010_011_000;

        #10;
        rst = 0;

        #50;
        $finish;
    end

    // Preload registers for simulation
    initial
    begin
        #15;
        uut.rf_inst.registers[1] = 8'd5; // R1 = 5
        uut.rf_inst.registers[2] = 8'd3; // R2 = 3
    end

endmodule