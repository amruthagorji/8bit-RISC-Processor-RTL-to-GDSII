module pc(input clk,rst, input [7:0]next_pc, output reg [7:0]pc);
always @(posedge clk)
begin
    if(rst)
        pc <= 8'b00000000;
    else
        pc <= next_pc;
 end
 endmodule       
        