module pipe_ex2 (Zout , rs1 , rs2 , rd , func , addr , clk1 , clk2);


    input [3 : 0] rs1 , rs2 , rd , func;
    input [8 : 0] addr; //defining 8bit address
    input  clk1 , clk2; // two phase clock
    output [15:0] Zout;

    reg [15 : 0] L12_A , L12_B , L23_z , L34_z;
    reg [3 :0] L12_rd , L12_func , L23_rd ;
    reg [7 : 0] L12_addr , L23_addr , L34_addr;


    reg [15:0] regbank [0:15]; // 16 registers of 16 bits each
    reg [15:0] mem [0:255]; // 256 memory locations of 16 bits each

    assign Zout = L34_z; // output of the pipeline stage 4

    always @(posedge clk1)  //stage 1
    begin
        L12_A <= #2 regbank[rs1]; //read the data available at the rs1 register
        L12_B <= #2 regbank[rs2]; //read the data available at the rs2 register
        L12_rd <= #2 rd; //read the destination register
        L12_func <= #2 func; //read the function code
        L12_addr <= #2 addr; //read the address
    end
    always @(posedge clk2)  //stage 2
    begin
        case (func)
            0: L23_z <= #2 L12_A + L12_B; //addition
            1: L23_z <= #2 L12_A - L12_B; //subtraction
            2: L23_z <= #2 L12_A * L12_B; //multiplication
            3: L23_z <= #2 L12_A ;
            4: L23_z <= #2 L12_B;
            5: L23_z <= #2 L12_A & L12_B; //and
            6: L23_z <= #2 L12_A | L12_B; //or
            7: L23_z <= #2 L12_A ^ L12_B; //xor
            8: L23_z <= #2 - L12_A; //negation
            9: L23_z <= #2 - L12_B; //negation
            10: L23_z <= #2 L12_A >> 1; //left shift
            11: L23_z <= #2 L12_A << 1; //right shift
            default : L23_z <= #2 16'hxxxx; //default case
        endcase
        L23_rd <= #2 L12_rd; //write the destination register
        L23_addr <= #2 L12_addr; //write the address
    end
    always @(posedge clk1)  //stage 3
    begin
        L34_addr <= #2 L23_addr; //write the address
        L34_z <= #2 L23_z; //write the data to the memory
        regbank[L23_rd] <= #2 L23_z; //write the data to the destination register
    end
    always @(posedge clk2)  //stage 4
    begin
        mem[L34_addr] <= #2 L34_z; //write the data to the memory
    end
endmodule
