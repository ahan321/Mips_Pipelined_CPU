`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 09:10:30 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] eqa,
    input [31:0] b,
    input [3:0] ealuc,
    output reg [31:0] r
    );
    always @(*) begin
        if (ealuc == 'b0000) begin
            r <= eqa & b;
        end
        if (ealuc == 'b0001) begin
            r <= eqa | b;
        end
        if (ealuc == 'b0010) begin
            r <= eqa + b;
        end
        if (ealuc == 'b0110) begin
            r <= eqa - b;
        end
        if (ealuc == 'b0011) begin
            r <= eqa ^ b;
        end
    end
endmodule
