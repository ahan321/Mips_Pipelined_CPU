`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 12:40:13 AM
// Design Name: 
// Module Name: pc_adder
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


module pc_adder(
    input [31:0] pc,
    output reg [31:0] next_pc
    );
    
    initial next_pc = 100;
    
    always @(*) begin
        next_pc <= pc + 32'd4;
    end
endmodule
