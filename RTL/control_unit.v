module control_unit(
    input [3:0] opcode,

    output reg [2:0] alu_control,
    output reg regwrite,
    output reg alu_src,
    output reg wb_sel,
    output reg branch,
    output reg rd_src,
    output reg mem_read,
    output reg mem_write,
    output reg mem_to_reg
);

always @(*)
begin
         alu_control = 3'b000;
            regwrite    = 1'b0;
            alu_src     = 1'b0;
            wb_sel = 1'b0;
              branch      = 1'b0;
              rd_src = 1'b0;
              mem_read  = 1'b0;
            mem_write = 1'b0;
            mem_to_reg = 1'b0;

    case(opcode)

        4'b0000: // ADD
        begin
            alu_control = 3'b000;
            regwrite    = 1'b1;
            alu_src     = 1'b0;
            wb_sel      = 1'b0;
            rd_src = 1'b0;
        end

        4'b0001: // SUB
        begin
            alu_control = 3'b001;
            regwrite    = 1'b1;
            alu_src     = 1'b0;
             wb_sel      = 1'b0;
             rd_src = 1'b0;
        end

        4'b0010: // AND
        begin
            alu_control = 3'b010;
            regwrite    = 1'b1;
            alu_src     = 1'b0;
             wb_sel      = 1'b0;
             rd_src = 1'b0;
        end

        4'b0011: // OR
        begin
            alu_control = 3'b011;
            regwrite    = 1'b1;
            alu_src     = 1'b0;
             wb_sel      = 1'b0;
             rd_src = 1'b0;
        end

        4'b0100: // XOR
        begin
            alu_control = 3'b100;
            regwrite    = 1'b1;
            alu_src     = 1'b0;
             wb_sel      = 1'b0;
             rd_src = 1'b0;
        end

        4'b0101: // ADDI
        begin
            alu_control = 3'b000;
            regwrite    = 1'b1;
            alu_src     = 1'b1;
             wb_sel      = 1'b0;
             rd_src = 1'b1;
        end

        4'b0110: // SUBI
        begin
            alu_control = 3'b001;
            regwrite    = 1'b1;
            alu_src     = 1'b1;
             wb_sel      = 1'b0;
             rd_src = 1'b1;
             
        end
         4'b0111: // LI
        begin
            alu_control = 3'b000;
            regwrite    = 1'b1;
            alu_src     = 1'b1;
            wb_sel      = 1'b1;
            rd_src = 1'b1;
        end
        4'b1000: // BEQ
        begin
             alu_control = 3'b001; // SUB
              branch      = 1'b1;
              rd_src = 1'b0;
end
        4'b1011: // LOAD
    begin
        regwrite   = 1'b1;
        alu_src    = 1'b1;
    
        mem_read   = 1'b1;
        mem_to_reg = 1'b1;
    
        rd_src     = 1'b1;
    end 
        4'b1100: // STORE
    begin
        alu_src    = 1'b1;
    
        mem_write  = 1'b1;
    
        regwrite   = 1'b0;
    end 
           4'b1001: // SLL
    begin
        alu_control = 3'b101;
        regwrite    = 1'b1;
    end
    
    4'b1010: // SRL
    begin
        alu_control = 3'b110;
        regwrite    = 1'b1;
    end

        default:
        begin
           

        end

    endcase

end

endmodule