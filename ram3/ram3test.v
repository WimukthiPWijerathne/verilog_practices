`include "ram3.v"

module RAM_test;
    reg [9:0] address;
    reg [7:0] data_in;
    wire [7:0] data_out;
    reg write, select;
    integer k, myseed;

    // Instantiate RAM
    ram3 RAM (data_out, data_in, address, write, select);

    initial begin
        myseed = 35;

        // Write phase
        for (k = 0; k <= 1023; k = k + 1) begin
            address = k;
            data_in = (k + k) % 256;
            write = 1;
            select = 1;
            #2;
            write = 0;
            select = 0;
        end

        // Read phase
        repeat (20) begin
            #2;
            address = $random(myseed) % 1024;
            write = 0;
            select = 1;
            #1; // Wait for data_out
            $display("Address: %5d, Data: %4d", address, data_out);
            select = 0;
        end
    end
endmodule
