`timescale 1ns / 1ps

module register_file_tb;

    // Inputs
    reg clk;
    reg rst;
    reg regwrite;

    reg [2:0] rs1;
    reg [2:0] rs2;
    reg [2:0] rd;

    reg [7:0] writedata;

    // Outputs
    wire [7:0] read1;
    wire [7:0] read2;

    // DUT (Device Under Test)
    register_file uut (
        .clk(clk),
        .rst(rst),
        .regwrite(regwrite),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .writedata(writedata),
        .read1(read1),
        .read2(read2)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Monitor values in console
    initial
    begin
        $monitor(
        "Time=%0t | clk=%b rst=%b regwrite=%b rd=%d writedata=%d rs1=%d rs2=%d read1=%d read2=%d",
        $time, clk, rst, regwrite, rd, writedata, rs1, rs2, read1, read2
        );
    end

    // Test sequence
    initial
    begin

        // Initialize signals
        clk = 0;
        rst = 1;
        regwrite = 0;

        rs1 = 0;
        rs2 = 0;
        rd = 0;
        writedata = 0;

        // -------------------
        // Reset all registers
        // -------------------
        #10;
        rst = 0;

        // -------------------
        // Write 55 to R1
        // -------------------
        rd = 3'b001;
        writedata = 8'd55;
        regwrite = 1;

        #10;

        // -------------------
        // Write 99 to R2
        // -------------------
        rd = 3'b010;
        writedata = 8'd99;

        #10;

        // Stop writing
        regwrite = 0;

        // -------------------
        // Read R1 and R2
        // -------------------
        rs1 = 3'b001;
        rs2 = 3'b010;

        #10;

        // -------------------
        // Read R0
        // -------------------
        rs1 = 3'b000;

        #10;

        $finish;

    end

endmodule