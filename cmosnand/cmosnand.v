module cmos_nand (f,x,y);
    input x,y;
    output f;
    supply1 vdd;
    supply0 gnd;
    wire a;
    

    pmos p1 (f,vdd,x);
    pmos p2 (f,vdd,y);
    nmos n1 (f,a,x);
    nmos n2 (a,gnd,y);

endmodule
