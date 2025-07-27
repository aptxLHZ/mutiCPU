`timescale 1ns / 1ps
 


module flopr #(parameter WIDTH = 8)(
    input              clk,
    input              rst,
    input  [WIDTH-1:0] din,
    output [WIDTH-1:0] dout
);
    reg [WIDTH-1:0] dout_reg;
    
    always @(posedge clk or posedge rst) begin
        if(rst)
            dout_reg <= 0;
        else
            dout_reg <= din;
    end
    
    assign dout = dout_reg;
    
endmodule
