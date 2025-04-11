`timescale 10ns/1ns

module testbench;

  reg a, b, c;               // Declare inputs as registers
  wire sum, cout;            // Declare outputs as wires

  integer i;

  // Instantiate the full adder module
  full_adder FA (sum, cout, a, b, c);

  initial begin
    $dumpfile("fulladder.vcd");         // Output file for GTKWave
    $dumpvars(0, testbench);            // Dump all variables in this module

    for (i = 0; i < 8; i = i + 1) begin
      {a, b, c} = i; #5;                // Test all input combinations
      $display("T=%2d a=%b b=%b c=%b sum=%b cout=%b", $time, a, b, c, sum, cout);
    end

    #5 $finish;                         // End simulation
  end

endmodule
