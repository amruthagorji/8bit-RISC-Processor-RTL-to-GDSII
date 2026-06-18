`timescale 1ns / 1ps

module cpu_tb;

    reg clk;
    reg rst;

    cpu uut(
        .clk(clk),
        .rst(rst)
    );

    //-----------------------------------
    // Clock Generation
    //-----------------------------------
    always #5 clk = ~clk;

    //-----------------------------------
    // Main Simulation
    //-----------------------------------
    initial
    begin
        clk = 0;
        rst = 1;

        // Continuous Debug Monitor
        $monitor(
        "time=%0t PC=%d instr=%h opcode=%h regwrite=%b rd=%d write_data=%d mem_read=%b mem_read_data=%d R2=%d",
        $time,
        uut.pc_out,
        uut.instruction,
        uut.exe_inst.opcode,
        uut.exe_inst.regwrite,
        uut.exe_inst.rd_sel,
        uut.exe_inst.write_data,
        uut.exe_inst.mem_read,
        uut.exe_inst.mem_read_data,
        uut.exe_inst.rf_inst.registers[2]
        );

        #10;
        rst = 0;

        #500;

        $display("\n========== FINAL STATE ==========");

        $display("PC=%d", uut.pc_out);
        $display("Instruction=%b", uut.instruction);

        $display("opcode=%b", uut.exe_inst.opcode);

        $display("wb_sel=%b", uut.exe_inst.wb_sel);
        $display("regwrite=%b", uut.exe_inst.regwrite);

        $display("imm=%d", uut.exe_inst.imm);
        $display("imm_ext=%d", uut.exe_inst.imm_ext);

        $display("write_data=%d", uut.exe_inst.write_data);

        $display("R0=%d", uut.exe_inst.rf_inst.registers[0]);
        $display("R1=%d", uut.exe_inst.rf_inst.registers[1]);
        $display("R2=%d", uut.exe_inst.rf_inst.registers[2]);
        $display("R3=%d", uut.exe_inst.rf_inst.registers[3]);
        $display("R4=%d", uut.exe_inst.rf_inst.registers[4]);

        $display("MEM[10]=%d", uut.exe_inst.dmem_inst.memory[10]);

        $display("mem_read=%b", uut.exe_inst.mem_read);
        $display("mem_write=%b", uut.exe_inst.mem_write);
        $display("mem_to_reg=%b", uut.exe_inst.mem_to_reg);

        $display("mem_read_data=%d", uut.exe_inst.mem_read_data);

        $finish;
    end

    //-----------------------------------
    // Initialize Registers
    //-----------------------------------
    initial
    begin
        #15;

        uut.exe_inst.rf_inst.registers[1] = 8'd5;
        uut.exe_inst.rf_inst.registers[2] = 8'd5;
    end

endmodule