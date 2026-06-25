module clock_gating_controller(

    input [1:0] workload_mode,

    output reg alu_enable,
    output reg mem_enable
);

always @(*)
begin

    case(workload_mode)

        2'b00:
        begin
            alu_enable = 1'b1;
            mem_enable = 1'b0;
        end

        2'b01:
        begin
            alu_enable = 1'b0;
            mem_enable = 1'b1;
        end

        2'b10:
        begin
            alu_enable = 1'b0;
            mem_enable = 1'b0;
        end

        default:
        begin
            alu_enable = 1'b1;
            mem_enable = 1'b1;
        end

    endcase

end

endmodule