`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 02:59:22 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input clk,
    output wire wwreg,
    output wire [4:0] wdestReg,
    output wire [31:0] wdo,
    output wire wm2reg,
    output wire [31:0] wr
    );
    
    
    wire [4:0] mdestReg;
    wire mm2reg_out;
    wire [31:0] mqb_out;
    wire [31:0] mr_out;
    wire mwmem_out;
    wire mwreg_out;
    wire [31:0] pc;
    wire [31:0] dinst_out;
    wire [31:0] mdo;
    
    
    
    wire [31:0] adder_to_pc;
    wire [31:0] pc_to_adder;
    wire [31:0] instr_mem_to_ifid;
    wire [31:0] ifid_out;
    wire control_to_multiplexer;
    wire [31:0] qa_to_eqa;
    wire [31:0] qb_to_eqb;
    wire [31:0] imm_to_imm32;
    wire wreg_to_ewreg;
    wire m2reg_to_em2reg;
    wire wmem_to_ewmem;
    wire [3:0] aluc_to_ealuc;
    wire aluimm_to_ealuimm;
    wire [4:0] destreg_to_edestreg;
    
    
    wire [31:0] qa_to_a;
    wire [31:0] qb_to_mux;
    wire [31:0] r_to_b;
    wire [31:0] eimm32;
    wire [3:0] ealuc;
    wire [31:0] r_to_exemem;
    wire ewreg;
    wire em2reg;
    wire ewmem;
    wire ealuimm;
    wire [4:0] edest_reg;
    //wire mwreg_out;
    //wire mm2reg_out;
    //wire mwmem_out;
    wire [4:0] mdestReg_out;
    //wire [31:0] mr_out;
    //wire [31:0] mqb_out;
    //wire [31:0] mdo;
    wire [31:0] wbData;
    wire [1:0] fwd_a_pin;
    wire [1:0] fwd_b_pin;
    wire [31:0] fwd_a_out;
    wire [31:0] fwd_b_out;
    wire [31:0] mqa_out;
    wire [31:0] a;
    wire [31:0] b;
    
    
    //wire branch1 = {pc_to_adder,pc};
   
   wire clk_inv;
   not_gate not_gate(clk,clk_inv);
   
        
    program_counter program_counter(
    .clk (clk), 
    .nextPc (adder_to_pc), 
    .pc (pc));
    
    //
    
    pc_adder pc_adder(
    .pc (pc),
    .next_pc (adder_to_pc));
    
    instruction_memory instruction_memory(.pc (pc), 
    .do (instr_mem_to_ifid));
    
    
    ifid_pipeline_register ifid_pipeline_register(.inst_out (instr_mem_to_ifid), .clk (clk), .d_inst_out (dinst_out));
    control_unit control_unit(.op (dinst_out[31:26]), .func (dinst_out[5:0]), .wreg (wreg_to_ewreg), .m2reg (m2reg_to_em2reg), 
    .wmem (wmem_to_ewmem), .aluc (aluc_to_ealuc), .aluimm (aluimm_to_ealuimm), .regrt (control_to_multiplexer), .mrn(mdestReg), .mm2reg(mm2reg_out), .mwreg(mwreg_out), .ern(edest_reg), .em2reg(em2reg), .ewreg(ewreg), .rs (dinst_out[25:21]), 
    .rt (dinst_out[20:16]),.fwda(fwd_a_pin), .fwdb(fwd_b_pin));
    
    fwd_a_mux fwd_a_mux(.fwda(fwd_a_pin),.r(r_to_exemem), .qa(mqa_out), .mdo(mdo), .mr(mr_out), .fwda_output(fwd_a_out));
    fwd_b_mux fwd_b_mux(.fwdb(fwd_b_pin), .r(r_to_exemem), .qb(b), .mdo(mdo), .mr(mr_out),.fwdb_output(fwd_b_out));
    
    regrt_multiplexer regrt_multiplexer(.rt (dinst_out[20:16]), .rd (dinst_out[15:11]), .regrt (control_to_multiplexer), 
    .dest_reg (destreg_to_edestreg));    
    
    
    register_file register_file(.clk (clk_inv), .wdestReg(wdestReg), .wbData (wbData), .wwreg (wwreg), .rs (dinst_out[25:21]), 
    .rt (dinst_out[20:16]), .qa (mqa_out), .qb (b));
    immediate_extender immediate_extender(.imm (dinst_out[15:0]), .imm32 (imm_to_imm32));
    
    idexe_pipeline_register idexe_pipeline_register(
    .clk (clk), 
    .wreg (wreg_to_ewreg), 
    .m2reg (m2reg_to_em2reg), 
    .wmem (wmem_to_ewmem), 
    .aluc (aluc_to_ealuc), 
    .aluimm (aluimm_to_ealuimm), 
    .dest_reg (destreg_to_edestreg), 
    .qa (fwd_a_out), 
    .qb (fwd_b_out), 
    .imm32 (imm_to_imm32), 
    .ewreg (ewreg), 
    .em2reg (em2reg), 
    .ewmem (ewmem), 
    .ealuc (ealuc), 
    .ealuimm (ealuimm), 
    .edest_reg (edest_reg), 
    .eqa (qa_to_a), 
    .eqb (qb_to_mux), 
    .eimm32 (eimm32));
    
    alu_mux alu_mux(.eqb (qb_to_mux), .eimm32 (eimm32), .ealuimm (ealuimm), .b (r_to_b));
    alu alu(.eqa (qa_to_a), .b (r_to_b), .ealuc (ealuc), .r (r_to_exemem));
    exmem_pipeline_register exmem_pipeline_register(.clk (clk), .ewreg (ewreg), .em2reg (em2reg),
     .ewmem (ewmem), .edestReg (edest_reg), .r (r_to_exemem), .eqb (qb_to_mux), .mwreg (mwreg_out), .mm2reg (mm2reg_out),
      .mwmem(mwmem_out), .mdestReg (mdestReg), .mr (mr_out), .mqb (mqb_out));
    data_memory data_memory(.mr (mr_out), .mqb (mqb_out), .mwmem (mwmem_out), .clk (clk), .mdo (mdo));
    memwb_pipeline_register memwb_pipeline_register(.mwreg (mwreg_out), .mm2reg (mm2reg_out), .mdestReg (mdestReg),
     .mr (mr_out), .mdo (mdo), .clk (clk), .wwreg (wwreg), .wm2reg (wm2reg), .wdestReg (wdestReg), .wr (wr), .wdo (wdo));
    
    writeback_mux writeback_mux(.wr (wr), .wdo (wdo), .wm2reg (wm2reg), .wbData(wbData));
    
    
endmodule
