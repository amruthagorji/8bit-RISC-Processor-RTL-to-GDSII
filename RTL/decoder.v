module decoder(
    input [15:0] instruction,

    output [3:0] opcode,
    output [2:0] rs1,
    output [2:0] rs2,
    output [2:0] rd_r,
    output [2:0] rd_i,
    output [5:0] imm
);

assign opcode = instruction[15:12];

assign rs1 = instruction[11:9];
assign rs2 = instruction[8:6];

assign rd_r = instruction[5:3];
assign rd_i = instruction[8:6];

assign imm = instruction[5:0];

endmodule