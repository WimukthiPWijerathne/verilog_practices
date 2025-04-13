//4 x 32 register file


module regbank_v1(rdData1,rdData2,wrData,sr1,sr2,dr,write,clk);

    input clk,write;
    input [1:0] sr1,sr2,dr; //source and destination register numbers
    input [31:0] wrData; //data to be written
    output reg [31:0] rdData1,rdData2; //data to be read from registers
    reg [31:0] R0 , R1 , R2 , R3; //4 registers of 32 bits each


    always @(*)
    begin
        case(sr1) //read data from source register 1
            2'b00: rdData1 = R0;
            2'b01: rdData1 = R1;
            2'b10: rdData1 = R2;
            2'b11: rdData1 = R3;
            default: rdData1 = 32'hxxxxxxxxxx;


        endcase
        case(sr2) //read data from source register 2
            2'b00: rdData2 = R0;
            2'b01: rdData2 = R1;
            2'b10: rdData2 = R2;
            2'b11: rdData2 = R3;
            default: rdData2 = 32'hxxxxxxxxxx;
        endcase
    end
    always @(posedge clk)
    begin
        if(write) //if write is enabled, write data to destination register
        begin
            case(dr)
                2'b00: R0 <= wrData;
                2'b01: R1 <= wrData;
                2'b10: R2 <= wrData;
                2'b11: R3 <= wrData;
                
            endcase
        end
    end
endmodule
       