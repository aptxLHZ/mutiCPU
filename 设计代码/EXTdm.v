`timescale 1ns / 1ps
 
`include "ctrl_encode_def.v"

//对load出数据扩展
module EXTdm(
    input [31:0] dmout,
    input [2:0]  DMEXTop,  
    output reg [31:0] DMout

    );
    
    always @(*) begin
        case(DMEXTop)
            `DMEXT_LB  : DMout = {{ 24{dmout[7]} },dmout[7:0]};
            `DMEXT_LH  : DMout = {{ 16{dmout[15]} },dmout[15:0]};
            `DMEXT_LW  : DMout = dmout;
            `DMEXT_LBU : DMout = {24'b0,dmout[7:0]};
            `DMEXT_LHU : DMout = {16'b0,dmout[15:0]};         
        endcase
    end
    
endmodule
