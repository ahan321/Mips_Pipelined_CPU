`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2022 06:07:27 PM
// Design Name: 
// Module Name: fwd_b_mux
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


module fwd_b_mux(
    input [1:0] fwdb,
    input [31:0] qb,
    input [31:0] r,
    input [31:0] mr,
    input [31:0] mdo,
    output reg [31:0] fwdb_output
    );
    
    always@(*) begin
        if (fwdb == 2'b00) begin
            fwdb_output <= qb;
        end
        else if (fwdb == 2'b01) begin
            fwdb_output <= r;
        end
        else if (fwdb == 2'b10) begin
            fwdb_output <= mr;
        end
        else if (fwdb == 2'b11) begin
            fwdb_output <= mdo;
        end
    end
endmodule
