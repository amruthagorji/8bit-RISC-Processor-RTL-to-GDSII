module register_file(
input clk,
input rst,
input regwrite,
input [2:0]rs1,
input [2:0]rs2,
input [2:0]rd,
input [7:0]writedata,
output [7:0]read1,
output [7:0]read2
);
reg [7:0] registers [0:7];
integer i;
always @(posedge clk)
begin
    if (rst)
    begin
        for(i = 0;i < 8;i = i + 1)
        registers[i]<=8'b00000000;
    end    
    else if(regwrite && (rd !=3'b000))
    begin
        registers[rd] <= writedata;
    end
end

assign read1 = (rs1==3'b000) ? 8'd0:registers[rs1];
assign read2 = (rs2==3'b000) ? 8'd0:registers[rs2];

endmodule


