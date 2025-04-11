`timescale 1ns/1ps

module testbench;
  reg A, B, C, D, E, F; // 'reg' for inputs
  wire Y;               // 'wire' for output

  // Instantiate the module under test (DUT)
  example DUT(A, B, C, D, E, F, Y);

  initial begin
    // Dump file for GTKWave
    $dumpfile("waveform.vcd");
    $dumpvars(0, testbench);

    // Display signal values during simulation
    $monitor($time, " A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, Y=%b", A, B, C, D, E, F, Y);

    // Test cases
    A = 0; B = 0; C = 0; D = 0; E = 0; F = 0;
    #5 A = 1; B = 0; C = 0; D = 1; E = 0; F = 0;
    #5 A = 0; B = 0; C = 1; D = 1; E = 0; F = 0;
    #5 A = 1; C = 0;
    #5 F = 1;  // Fixed case-sensitive mistake

    #5 $finish;
  end
endmodule
