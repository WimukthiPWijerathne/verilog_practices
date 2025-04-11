`timescale 10ns/1ns

module shift_test;
  reg clk, clr, in;
  wire out; 
  integer i;

  // Make sure this module is defined somewhere
  shiftregister_4bit SR (clk, clr, in, out);

  // Initial block to set initial values
  initial begin 
    clk = 1'b0;
    clr = 0;
    #2 clr = 1;  // <-- Fixed: #clr=1; is invalid
  end

  // Clock generation every 5 time units (10ns period)
  always #5 clk = ~clk;

  // Input stimulus generation
  initial begin
    #2; // wait 2 time units after simulation starts
    repeat (2) begin
      #10 in = 0;
      #10 in = 0;
      #10 in = 1;
    end
  end

  // Dump waveforms to a .vcd file for GTKWave
  initial begin
    $dumpfile("shift.vcd");
    $dumpvars(0, shift_test);
    #200 $finish;
  end
endmodule
