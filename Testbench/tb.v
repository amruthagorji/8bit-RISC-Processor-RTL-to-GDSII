
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2026 12:24:46
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb;

    // Inputs to DUT
    reg clk;
    reg rst;
    reg [7:0] next_pc;

    // Output from DUT
    wire [7:0] pc;

    // Instantiate the PC module
    pc uut (
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin

        // Initialize signals
        clk = 0;
        rst = 1;
        next_pc = 8'd0;

        // Hold reset for some time
        #10;
        rst = 0;

        // Test PC updates
        next_pc = 8'd1;
        #10;

        next_pc = 8'd2;
        #10;

        next_pc = 8'd3;
        #10;

        next_pc = 8'd10;
        #10;

        next_pc = 8'd20;
        #10;

        $finish;
    end

endmodule