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

    instructions[0] = 16'b0000_001_010_011_000; // ADD
    instructions[1] = 16'b0001_001_010_011_000; // SUB
    instructions[2] = 16'b0010_001_010_011_000; // AND
    instructions[3] = 16'b0011_001_010_011_000; // OR
    instructions[4] = 16'b0100_001_010_011_000; // XOR

    instructions[5] = 16'b0101_001_011_000011; // ADDI

    instructions[6] = 16'b0111_000_100_000011; // LI

    instructions[7] = 16'b0000_000_000_000_000;

    instructions[8] = 16'b1011_000_010_001010; // LOAD
    instructions[9]  = 16'b0111_000_001_000101; // LI R1,5

instructions[10] = 16'b0111_000_010_000101; // LI R2,5

instructions[11] = 16'b1000_001_010_000010; // BEQ R1,R2,+2

instructions[12] = 16'b0111_000_011_111111; // LI R3,63 (should skip)

instructions[13] = 16'b0111_000_100_001111; // LI R4,15
   instructions[14] = 16'b1001_001_010_011_000; // SLL R3,R1,R2

instructions[15] = 16'b1010_011_010_100_000; // SRL R4,R3,R2
end

assign instruction = instructions[address];

endmodule