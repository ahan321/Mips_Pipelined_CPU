`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2022 05:52:05 PM
// Design Name: 
// Module Name: fwdamux
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


module fwdamux(
    input [1:0] fwda,
    input [31:0] qa,
    input [31:0] r,
    input [31:0] mr,
    input [31:00] mdo,
    output reg [31:00] fwda_output
    );
    always @(*) begin
        if (fwda == 2'b00) begin
            fwda_output <= qa;
        end
        else if (fwda == 2'b01) begin
            fwda_output <= mr;
        end
        else if (fwda == 2'b10) begin
            fwda_output <= mr;
        end
        else if (fwda == 2'b11) begin
            fwda_output <= mdo;
        end
    end
endmodule
