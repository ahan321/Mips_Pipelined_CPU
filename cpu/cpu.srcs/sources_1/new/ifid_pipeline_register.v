`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 12:52:56 AM
// Design Name: 
// Module Name: ifid_pipeline_register
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


module ifid_pipeline_register(
    input [31:0] inst_out,
    input clk,
    output reg [31:0] d_inst_out
    );
    
    always @(posedge clk) begin
    d_inst_out <= inst_out;
    end
endmodule
