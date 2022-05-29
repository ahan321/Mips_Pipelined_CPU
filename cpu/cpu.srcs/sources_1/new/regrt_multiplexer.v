`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 01:11:17 PM
// Design Name: 
// Module Name: regrt_multiplexer
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


module regrt_multiplexer(
    input [4:0] rt,
    input [4:0] rd,
    input regrt,
    output reg [4:0] dest_reg
    );
    always @(*) begin
        if (regrt == 0) begin
            dest_reg <= rd;
        end
        if (regrt == 1) begin
            dest_reg <= rt;
        end
    end
endmodule
