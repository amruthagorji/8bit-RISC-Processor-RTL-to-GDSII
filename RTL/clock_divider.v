module clock_divider(
    input clk,
    input rst,
    input [1:0] workload_mode,
    output reg slow_clk
);

reg [26:0] counter;
reg [26:0] div_value;

// Workload-based divider selection
always @(*)
begin
    case(workload_mode)

        2'b00: div_value = 27'd10;  // Fast

        2'b01: div_value = 27'd20;  // Medium

        2'b10: div_value = 27'd40;  // Slow

        default:
            div_value = 27'd20;

    endcase
end

// Clock divider
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        counter  <= 0;
        slow_clk <= 0;
    end
    else
    begin
        if(counter >= div_value)
        begin
            counter  <= 0;
            slow_clk <= ~slow_clk;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
end

endmodule