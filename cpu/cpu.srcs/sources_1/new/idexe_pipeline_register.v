`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 02:55:00 PM
// Design Name: 
// Module Name: idexe_pipeline_register
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


module idexe_pipeline_register(
    input clk,
    input wreg,
    input m2reg,
    input wmem,
    input [3:0] aluc,
    input aluimm,
    input [4:0] dest_reg,
    input [31:0] qa,
    input [31:0] qb,
    input [31:0] imm32,
    output reg ewreg,
    output reg em2reg,
    output reg ewmem,
    output reg [3:0] ealuc,
    output reg ealuimm,
    output reg [4:0] edest_reg,
    output reg [31:0] eqa,
    output reg [31:0] eqb,
    output reg [31:0] eimm32
    );
    
    always @(posedge clk) begin
        ewreg <= wreg;
        em2reg <= m2reg;
        ewmem <= wmem;
        ealuc <= aluc;
        ealuimm <= aluimm;
        edest_reg <= dest_reg;
        eqa <=qa;
        eqb <= qb;
        eimm32 <= imm32;
    end
endmodule
