`include "cmosnand2.v"

module myxor2 (out , a , b);

    input a,b;
    output out;
    wire t1,t2,t3,t4;

    cmos_nand2 N1 (t1 , a , a);
    cmos_nand2 N2 (t2 , b , b);
    cmos_nand2 N3 (t3 , a , t2);
    cmos_nand2 N4 (t4 , b , t1);
    cmos_nand2 N5 (out , t3 , t4);
endmodule


