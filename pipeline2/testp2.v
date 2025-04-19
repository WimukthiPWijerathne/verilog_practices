`include "pipeline2.v"

module pipe2_test;
    wire [15 : 0] Z;
    reg [3 : 0] rs1 , rs2 , rd , func;
    reg [7 : 0] addr; //8 bit address
    reg clk1 , clk2; // two phase clock
    integer k;


    pipe_ex2 MYPIPE (Z,rs1,rs2,rd,func,addr,clk1,clk2); // Instantiate the pipeline module

    initial
        begin
            clk1 = 0;  clk2 = 0;
            repeat (20)
            begin
                #5 clk1 = 1; #5 clk1 = 0; // Generate clock signal for clk1
                #5 clk2 = 1; #5 clk2 = 0; // Generate clock signal for clk2
            end
        end


    initial
        for (k = 0 ; k<16 ; k=k+1)
        MYPIPE.regbank[k] = k; // Initialize the register bank with values 0 to 15

    initial
        begin
            #5 rs1 = 3; rs2 = 5; rd = 10; func = 0; addr = 125;
            #20 rs1 = 4; rs2 = 6; rd = 11; func = 1; addr = 126;
            #20 rs1 = 5; rs2 = 7; rd = 12; func = 2; addr = 127;
            #20 rs1 = 6; rs2 = 8; rd = 13; func = 3; addr = 128;
            #20 rs1 = 7; rs2 = 9; rd = 14; func = 4; addr = 129;
            #20 rs1 = 8; rs2 = 10; rd = 15; func = 5; addr = 130;


            #60 for (k = 125 ; k<131 ; k=k+1)
            $display ("Mem[%3d] = 3%d",k,MYPIPE.mem[k]); // Display the memory contents after the operations

        end

        initial
            begin
                $dumpfile("pipeline2.vcd"); // Specify the name of the VCD file for waveform output
                $dumpvars(0, pipe2_test); // Dump all variables in the testbench
                $monitor ("Time : 3%d , F = 3%d", $time,Z);
                #300 $finish; // End the simulation after 300 time units
            end


            endmodule
