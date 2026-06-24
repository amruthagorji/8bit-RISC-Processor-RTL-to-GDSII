module workload(

    input clk,
    input rst,
    input [3:0] opcode,

    output reg [7:0] alu_count,
    output reg [7:0] mem_count,
    output reg [7:0] branch_count,

    output reg [1:0] workload_mode
);

reg [7:0] window_counter;

always @(posedge clk)
begin

    if(rst)
    begin
        alu_count      <= 0;
        mem_count      <= 0;
        branch_count   <= 0;
        window_counter <= 0;

        workload_mode  <= 2'b00;
    end

    else
    begin

        //----------------------------------
        // Count instruction type
        //----------------------------------

        case(opcode)

            // ALU Instructions
            4'b0000,
            4'b0001,
            4'b0010,
            4'b0011,
            4'b0100,
            4'b0101,
            4'b0110,
            4'b0111,
            4'b1001,
            4'b1010:

                alu_count <= alu_count + 1;

            // Memory Instructions
            4'b1011,
            4'b1100:

                mem_count <= mem_count + 1;

            // Branch Instructions
            4'b1000:

                branch_count <= branch_count + 1;

        endcase

        //----------------------------------
        // Window counter
        //----------------------------------

        window_counter <= window_counter + 1;

        //----------------------------------
        // Every 20 instructions classify
        //----------------------------------

        if(window_counter == 20)
        begin

            //----------------------------------
            // Classification
            //----------------------------------

            if((alu_count > mem_count) &&
               (alu_count > branch_count))

                workload_mode <= 2'b00;

            else if((mem_count > alu_count) &&
                    (mem_count > branch_count))

                workload_mode <= 2'b01;

            else

                workload_mode <= 2'b10;

            //----------------------------------
            // Reset window
            //----------------------------------

            alu_count      <= 0;
            mem_count      <= 0;
            branch_count   <= 0;

            window_counter <= 0;

        end

    end

end

endmodule