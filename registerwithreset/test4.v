`include "32bitreg.v"

module regfiletest;
reg [4:0] sr1,sr2,dr; //source and destination register numbers
reg [31:0] wrdata; //data to be written
reg write,reset,clk; //write and reset signals
wire [31:0] rdData1,rdData2; //data to be read from registers
integer k;

regbank_v4 REG (rdData1 , rdData2 , wrdata , sr1 , sr2 , dr , write , reset , clk); //register bank instance    

initial clk = 0;

always #5 clk = ~clk;  //clock genegeration

initial
    begin
        $dumpfile ("test4.vcd");
        $dumpvars (0,regfiletest); //dump file generation
        #1 reset = 1; write = 0;
        #5 reset = 0;
    end
initial
    begin 
        #7
        for (k=0 ; k<32 ; k=k+1)
        begin
            dr = k;
            wrdata = 10*k;
            write = 1; //write enable
            #10 write = 0;
        end
        #20
        for (k=0 ; k<32 ; k=k+1)
        begin
            sr1 = k;
            sr2 = k+1;
            #5;
            $display ("reg[%2d] = %d , reg[%2d] = %d" ,sr1,rdData1,sr2,rdData2);
        end
        #200 $finish; //end simulation
    end
    endmodule
