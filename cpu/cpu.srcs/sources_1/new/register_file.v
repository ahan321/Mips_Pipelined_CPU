`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 02:02:17 PM
// Design Name: 
// Module Name: register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_file(
    input clk,
    input [4:0] wdestReg,
    input [31:0] wbData,
    input wwreg,
    input [4:0] rs,
    input [4:0] rt,
    output reg [31:0] qa,
    output reg [31:0] qb
    );
    
    reg [31:0] registers[0:31];
    reg [5:0] i;
    
    initial begin
        registers[0] <= 'hA00000AA;
        registers[1] <= 'h10000011;
        registers[2] <= 'h20000022;
        registers[3] <= 'h30000033;
        registers[4] <= 'h40000044;
        registers[5] <= 'h50000055;
        registers[6] <= 'h60000066;
        registers[7] <= 'h70000077;
        registers[8] <= 'h80000088;
        registers[9] <= 'h90000099;
        for (i = 10; i <= 31; i=i+1) begin
            registers[i] = 32'b0;
        end
    end
    
    always @(*) begin
        qa <= registers[rs];
        qb <= registers[rt];
    end
    
    always @(negedge clk) begin
        if (wwreg == 1) begin
            registers[wdestReg] <= wbData;
        end
    end
endmodule
