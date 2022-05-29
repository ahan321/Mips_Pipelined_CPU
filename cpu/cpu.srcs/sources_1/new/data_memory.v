`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 10:11:46 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input [31:0] mr,
    input [31:0] mqb,
    input mwmem,
    input clk,
    output reg [31:0] mdo
    );
    reg [31:0] memory[0:63];
    
    initial begin
        memory[0] <= 'hA00000AA;
        memory[1] <= 'h10000011;
        memory[2] <= 'h20000022;
        memory[3] <= 'h30000033;
        memory[4] <= 'h40000044;
        memory[5] <= 'h50000055;
        memory[6] <= 'h60000066;
        memory[7] <= 'h70000077;
        memory[8] <= 'h80000088;
        memory[9] <= 'h90000099;
    end
    
    always @(*) begin
        mdo <= memory[mr];
    end
    
    always @(negedge clk) begin
        if (mwmem == 1) begin
            memory[mr] <= mqb;
        end
    end
    
endmodule
