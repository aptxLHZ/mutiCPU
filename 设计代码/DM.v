`timescale 1ns / 1ps
 

//data memory
module DM(
    input        clk,
    input [11:2] addr,
    input [31:0] din,
    input [3:0]  WRbe,
    input        DMwr,
    output[31:0] dout
    
    );
    
    reg [31:0] dmem[1023:0];
    reg [31:0] dout_reg;
    
    always @(posedge clk)
    begin
        if(DMwr)
        begin
          if(WRbe[0]) dmem[addr][7:0] <= din[7:0];
          if(WRbe[1]) dmem[addr][15:8] <= din[15:8];
          if(WRbe[2]) dmem[addr][23:16] <= din[23:16];
          if(WRbe[3]) dmem[addr][31:24] <= din[31:24];
        end
    end
    
    assign dout = dmem[addr];
    
endmodule
