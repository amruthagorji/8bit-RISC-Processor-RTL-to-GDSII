module instruc_mem(
input [7:0] address,
output [15:0] instruction
);

reg [15:0] instructions [0:15];

integer i;

initial
begin

    for(i=0; i<16; i=i+1)
        instructions[i] = 16'b0;

 // ---------- ALU HEAVY ----------

instructions[0]  = 16'b0111_000_001_000101; // LI R1,5
instructions[1]  = 16'b0111_000_010_000011; // LI R2,3

instructions[2]  = 16'b0000_001_010_011_000; // ADD
instructions[3]  = 16'b0001_001_010_100_000; // SUB
instructions[4]  = 16'b0010_001_010_101_000; // AND
instructions[5]  = 16'b0011_001_010_110_000; // OR
instructions[6]  = 16'b0100_001_010_111_000; // XOR

// ---------- MEMORY HEAVY ----------

instructions[7]  = 16'b1011_000_001_001010; // LOAD
instructions[8]  = 16'b1011_000_010_001010; // LOAD
instructions[9]  = 16'b1100_000_010_001010; // STORE
instructions[10] = 16'b1011_000_011_001010; // LOAD
instructions[11] = 16'b1100_000_011_001010; // STORE

// ---------- BRANCH HEAVY ----------

instructions[12] = 16'b1000_001_010_000001; // BEQ
instructions[13] = 16'b1000_001_010_000001; // BEQ
instructions[14] = 16'b1000_001_010_000001; // BEQ
instructions[15] = 16'b1000_001_010_000001; // BEQ
end

assign instruction = instructions[address[3:0]];

endmodule