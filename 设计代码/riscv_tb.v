 `timescale 1ns / 1ns


module riscv_tb(

    );
    
    reg clk,rst;
    risc_v i_risc_v(
        .clk(clk), .rst(rst)
    );
    
    initial begin
        clk = 1;
        rst = 1;
        #5 ;
        rst = 0;
    end
    
    always #10 clk = ~clk;
    
    
   initial begin
    $readmemh("C:/Users/win10/Desktop/multicpu/inst.txt",riscv_tb.i_risc_v.i_IM.rom);
    $readmemb("C:/Users/win10/Desktop/multicpu/data.txt",riscv_tb.i_risc_v.i_DM.dmem);
end
    
endmodule
