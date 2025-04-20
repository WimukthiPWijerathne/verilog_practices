`include "fulladr.v"

module fulladr_test ;

    reg a,b,cin;
    wire sum,cout;
    integer k;
    fulladder FA (sum , cout , a , b , cin); // Instantiate the full adder module


    initial
    begin
        for (k=0 ; k<8 ; k=k+1)
        begin
            #5 {a,b,cin} = k; // Generate all combinations of a, b, and cin
            $display ("Inputs : %3b, SUM : %b , COUT : %b",{a,b,cin},sum,cout); // Display the inputs and outputs
        end
    end
    endmodule