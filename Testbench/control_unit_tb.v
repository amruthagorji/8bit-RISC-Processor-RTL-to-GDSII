`timescale 1ns / 1ps

module control_unit_tb;

    reg [3:0] opcode;

    wire [2:0] alu_control;
    wire regwrite;

    control_unit uut(
        .opcode(opcode),
        .alu_control(alu_control),
        .regwrite(regwrite)
    );

    initial begin

        opcode = 4'b0000; 
        #10;

        opcode = 4'b0001; 
        #10;

        opcode = 4'b0010;  
        #10;

        opcode = 4'b0011;  
        #10;

        opcode = 4'b0100; 
        #10;

        opcode = 4'b1111;  
        #10;

        $finish;

    end

endmodule