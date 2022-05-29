`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2022 08:37:34 PM
// Design Name: 
// Module Name: not_gate
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


module not_gate(
    input clk,
    output reg clk_output
    );
    
    always @(*) begin
        clk_output <= ~clk;
    end
endmodule
