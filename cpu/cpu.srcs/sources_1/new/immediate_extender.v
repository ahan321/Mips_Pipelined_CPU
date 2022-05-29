`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 02:37:58 PM
// Design Name: 
// Module Name: immediate_extender
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


module immediate_extender(
    input [15:0] imm,
    output reg [31:0] imm32
    );
    
    always @(*) begin
        imm32 <= {imm,16'b0000000000000000} >>> 16;
    end
endmodule
