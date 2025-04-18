`include "pipe.v"

module pipel_test;

    parameter N = 10; // Define the bit-width of the inputs and outputs
    reg [N-1:0] A, B, C, D; // Declare input registers
    reg clk; // Declare clock signal
    wire [N-1:0] F; // Declare output wire

    pipe_ex MYPIPE (F, A, B, C, D, clk); // Instantiate the pipeline module

    initial clk =0;

    always #10 clk = ~clk; // Generate a clock signal with a period of 10 time units


    initial
        begin
            #5 A = 10; B = 12; C = 6; D = 3; // Initialize inputs
            #20 A = 20; B = 30; C = 15; D = 5; // Change inputs after some time
            #20 A = 25; B = 35; C = 20; D = 10; // Change inputs again
            #20 A = 30; B = 40; C = 25; D = 15; // Change inputs again
            #20 A = 35; B = 45; C = 30; D = 20; // Change inputs again
            #20 A = 40; B = 50; C = 35; D = 25; // Change inputs again
            #20 A = 45; B = 55; C = 40; D = 30; // Change inputs again
            #20 A = 50; B = 60; C = 45; D = 35; // Change inputs again
        end

    initial
        begin
            $dumpfile("testp.vcd"); // Specify the name of the VCD file for waveform output
            $dumpvars(0, pipel_test); // Dump all variables in the testbench
            $monitor ("Time : %d , F = %d", $time,F);
            #300 $finish; // End the simulation after 300 time units
        end
    endmodule