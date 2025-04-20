`include "cmosnandfa.v"

module fa_carry (cout , a , b , cin);

    input a , b , cin;
    output cout;
    wire t0,t1,t2,t3,t4,t5;

    cmos_nand1 N1 (t1 , a , b);
    cmos_nand1 N2 (t2 , a , cin);
    cmos_nand1 N3 (t3 , b , cin);
    cmos_nand1 N4 (t4 , t1 , t2);
    cmos_nand1 N5 (t5 , t4 , t4);
    cmos_nand1 N6 (cout , t5 , t3);

endmodule


