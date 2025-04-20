`include "4to1mux.v"

module testmux;
    reg s0,s1,i0,i1,i2,i3;
    wire out;
    integer k;
    mux_4to1 MYMUX (out,s0,s1,i0,i1,i2,i3);//initiate the mux module

    initial
    begin
        for (k=0 ; k<64 ; k=k+1)
        begin
            #5 {s0,s1,i0,i1,i2,i3} = k; // Generate all combinations of s0, s1, i0, i1, i2, and i3
            $display ("Sel : 2%b ,IN : 4%b, OUT : %b",{s0,s1},{i0,i1,i2,i3},out); // Display the inputs and output
        end
    end
    endmodule
    
