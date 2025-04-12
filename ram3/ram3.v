module ram3 (data_out, data_in, addr,wr,cs);

parameter addr_size = 10;//address size
parameter word_size = 8;//data size
parameter memory_size = 1024;//memory size


input [addr_size-1:0] addr;//address input
input [word_size-1:0] data_in;//data input
input wr,cs;//write and chip select signals
output [word_size-1:0] data_out;//data output
reg [word_size-1:0] mem [memory_size-1:0];//memory array


assign data_out = mem[addr];

always @(wr or cs)

    if(wr)
        mem[addr] = data_in;//write data to memory
endmodule


