`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 05:47:11 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk;
    wire wwreg;
    wire [4:0] wdestReg;
    wire [31:0] wdo;
    wire wm2reg;
    wire [31:0] wr;

    initial begin
    clk = 0;
    end
    
    datapath datapath(clk,wwreg,wdestReg,wdo,wm2reg,wr);

    always begin
        #5;
        clk = ~clk;
    end

endmodule
