`include "fa_carry.v"
`include "fa_sum.v"



module fulladder (sum , cout , a , b , cin);
    input a , b , cin;
    output sum , cout;

    fa_sum SUM (sum , a , b , cin); // Instantiate the sum module
    fa_carry COUT (cout , a , b , cin); // Instantiate the carry module
endmodule
