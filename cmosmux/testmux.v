`include "cmosmux.v" // including the mux module

module testmux;

    reg sel,in0,in1;
    wire out;
    integer k;

    mux_2to1 MYMUX (out,sel,in0,in1);//initiate the mux module

    initial
    begin
        for (k=0 ; k<8 ; k=k+1)
        begin
            #5 {sel,in0,in1} = k; // Generate all combinations of sel, in0, and in1
            $display ("SEL : %b , IN0 : %b , IN1 : %b , OUT : %b",sel,in0,in1,out); // Display the inputs and output
        end
    end

endmodule
