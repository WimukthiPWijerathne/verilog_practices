module ram1(addr,data,clk,rd,wr,cs);
    input [9:0] addr; //declare a10 bit input adder
    inout [7:0] data;
    inout clk,rd,wr,cs; //declare a 8 bit input data
    reg [7:0] mem[1023:0]; //declare a 8 bit memory of 1024 words
    reg [7:0] d_out; //declare a 8 bit output data

    assign data = (cs && rd) ? d_out : 8'bz; //if chip select and read are high, output data else high impedance
    always @(posedge clk) begin
        if (cs && wr && !rd) mem[addr] = data;
        
    end
    always @(posedge clk)
        if (cs && rd && !wr)
            d_out = mem[addr]; //if chip select and read are high, output data from memory
endmodule