`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 05:06:43 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input [31:0] pc,
    output reg [31:0] do
    );
    reg [31:0] memory[0:63];
    
    initial begin
        memory[25] <= {6'b100011,5'b00001,5'b00010,5'b00011,5'b00000,6'b100000};
        memory[26] <= {6'b100011,5'b01001,5'b00011,5'b00100,5'b00000,6'b100010};
        memory[27] <= {6'b100011,5'b00011,5'b01001,5'b00101,5'b00000,6'b100101};
        memory[28] <= {6'b100011,5'b00011,5'b01001,5'b00110,5'b00000,6'b100110};
        memory[29] <= {6'b000000,5'b00011,5'b01001,5'b00111,5'b00000,6'b100100};
    end
    
    always @(*) begin
        do <= memory[pc[7:2]];
    end
endmodule
