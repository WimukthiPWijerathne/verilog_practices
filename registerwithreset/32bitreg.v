//32 x 32 register bank with reset facility

module regbank_v4(rdData1, rdData2, wrdata, sr1, sr2, dr, write, reset, clk);
    input clk, write, reset;
    input [4:0] sr1, sr2, dr; // source and destination register numbers
    input [31:0] wrdata; // data to be written
    output [31:0] rdData1, rdData2; // data to be read from registers
    integer k;


    reg [31:0] regfile [0:31]; // 32 registers of 32 bits each

    assign rdData1 = regfile[sr1]; // read data from source register 1
    assign rdData2 = regfile[sr2]; // read data from source register 2


    always @(posedge clk)
    begin
        if(reset)
        begin
            for(k=0 ; k<32 ; k=k+1)
            begin
                regfile[k] <= 0; // reset all registers to 0
            end
        end
        else 
        begin
            if(write)
            regfile[dr] <= wrdata; // if write is enabled, write data to destination register
        end
    end
endmodule