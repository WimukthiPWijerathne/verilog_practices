`include "cmosnand.v" // including the nand gate module


module testc ;

    reg in1 , in2;
    wire out;
    integer k;
    cmos_nand MYNAND (out,in1,in2); //instantiating the nand gate using cmos

    initial 
    begin
        for (k=0 ; k<4 ; k=k+1)
        begin
            #5 {in1,in2} = k;
            $display ("IN1 : %b , IN2 : %b , OUT : %b",in1,in2,out);
        end
    end

    endmodule
