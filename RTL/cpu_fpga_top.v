module cpu_fpga_top(

    input CLK100MHZ,
    input CPU_RESETN,

    input [1:0] sw,

    output reg [7:0] LED
);

wire slow_clk;

wire [7:0] alu_out;
wire [7:0] pc_debug;
wire [7:0] imm_debug;
wire [7:0] mem_debug;

wire zero_debug;
wire branch_debug;

// Force fixed workload mode for debugging
wire [1:0] workload_mode;
assign workload_mode = 2'b00;

// Dummy wire for unused CPU output
wire [1:0] workload_mode_debug_unused;

clock_divider clk_div(
    .clk(CLK100MHZ),
    .rst(~CPU_RESETN),
    .workload_mode(workload_mode),
    .slow_clk(slow_clk)
);

cpu cpu_inst(
   .clk(CLK100MHZ),
    .rst(~CPU_RESETN),

    .alu_out(alu_out),
    .pc_debug(pc_debug),

    .zero_debug(zero_debug),
    .branch_debug(branch_debug),

    .imm_debug(imm_debug),
    .mem_debug(mem_debug),

    .workload_mode_debug(workload_mode_debug_unused)
);

always @(*)
begin
    case(sw)

        2'b00: LED = pc_debug;

        2'b01: LED = alu_out;

        2'b10: LED = imm_debug;

        2'b11: LED = mem_debug;

        default: LED = 8'b00000000;

    endcase
end

endmodule