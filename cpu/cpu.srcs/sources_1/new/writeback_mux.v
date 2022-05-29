`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 04:00:04 PM
// Design Name: 
// Module Name: writeback_mux
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


module writeback_mux(
    input [31:0] wr,
    input [31:0] wdo,
    input wm2reg,
    output reg [31:0] wbData
    );
    always @(*) begin
        if (wm2reg == 0) begin
            wbData <= wr;
        end
        if (wm2reg == 1) begin
            wbData <= wdo;
        end
    end
endmodule
