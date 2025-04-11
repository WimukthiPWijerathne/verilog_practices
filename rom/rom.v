//here we are designing a ROM.since rom is only a read only memory it is easy to design

module rom (addr,data,rd_en,cs);
    input [2:0] addr; input rd_en,cs;
    output reg [7:0] data;

    always @(addr or rd_en or cs)begin
        case(addr)
            3'b000: data = 8'b00000001;
            3'b001: data = 8'b00000010;
            3'b010: data = 8'b00000100;
            3'b011: data = 8'b00001000;
            3'b100: data = 8'b00010000;
            3'b101: data = 8'b00100000;
            3'b110: data = 8'b01000000;
            3'b111: data = 8'b10000000;
            default: data = 8'b00000000;
        endcase
    end 
endmodule
