`timescale 1ns / 1ps
 
`include "ctrl_encode_def.v"

//获得下一条指令地址
module NPC(
    input [11:0]  PC,
    input [31:0] IMM,
    input [31:0] alu_result,  //jalr auipc 需要将alu计算结果写入pc
    input [1:0]  NPCop,
    output reg [31:0] NPC

    );
    
    always @(*) begin
        case(NPCop)
            `NPC_PLUS4  : NPC = PC + 4;
            `NPC_BRANCH : NPC = PC + IMM - 3'd4;
            `NPC_JUMP   : NPC = PC + IMM - 3'd4;
            `NPC_AUIPC  : NPC = alu_result;
        endcase
    end
    
endmodule
