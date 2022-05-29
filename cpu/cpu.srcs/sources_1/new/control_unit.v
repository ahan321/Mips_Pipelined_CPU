`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 09:09:56 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [5:0] op,
    input [5:0] func,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] mrn,
    input mm2reg,
    input mwreg,
    input [4:0] ern,
    input em2reg,
    input ewreg,
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0] aluc,
    output reg aluimm,
    output reg regrt,
    output reg [1:0] fwda,
    output reg [1:0] fwdb
    );
    
    always @(*) begin
        case (op)
            6'b000000:
            begin
                case (func)
                    6'b100000:
                    begin
                    wreg <= 1'b1;
                    m2reg <= 1'b0;
                    wmem <= 1'b0;
                    aluc <= 4'b0010;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    end
                endcase
            end
            6'b100011:
            begin
            wreg <= 1'b1;
            m2reg <= 1'b1;
            wmem <= 1'b0;
            aluc <= 4'b0010;
            aluimm <= 1'b0;
            regrt <= 1'b0;
            end
        endcase
        if (ewreg != 0 && ern != 0 && ern == rs && em2reg == 0) begin
            fwda <= 2'b01;
        end
        else if (mwreg != 0 && mrn != 0 && mrn == rs && mm2reg == 0) begin
            fwda <= 2'b10;
        end
        else if (mwreg != 0 && mrn != 0 && mrn == rs && mm2reg == 1) begin
            fwda <= 2'b11;
        end
        else begin
            fwda <= 2'b00;
        end
        
        if (ewreg != 0 && ern != 0 && ern == rt && em2reg == 0) begin
            fwdb <= 2'b01;
        end
        else if (mwreg != 0 && mrn != 0 && mrn == rt && mm2reg == 1) begin
            fwdb <= 2'b10;
        end
        else if (mwreg != 0 && mrn != 0 && mrn == rt && mm2reg == 1) begin
            fwdb <= 2'b11;
        end
        else begin
            fwdb <= 2'b00;
        end
     end
endmodule
