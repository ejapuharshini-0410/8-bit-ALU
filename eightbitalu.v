`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 22:48:30
// Design Name: 
// Module Name: eightbitalu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
`timescale 1ns/1ps

module eightbitalu_tb;

reg  [7:0] A;
reg  [7:0] B;
reg  [2:0] opcode;

wire [7:0] Result;
wire Carry;
wire Zero;

integer i;

// Instantiate ALU
eightbitalu uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .Result(Result),
    .Carry(Carry),
    .Zero(Zero)
);

initial
begin

    // Initialize inputs
    A = 8'd0;
    B = 8'd0;
    opcode = 3'b000;

    #10;

    // ADD
    A = 8'd10;
    B = 8'd5;
    opcode = 3'b000;
    #20;

    // SUB
    A = 8'd20;
    B = 8'd7;
    opcode = 3'b001;
    #20;

    // AND
    A = 8'hCC;
    B = 8'hAA;
    opcode = 3'b010;
    #20;

    // OR
    A = 8'hCC;
    B = 8'hAA;
    opcode = 3'b011;
    #20;

    // XOR
    A = 8'hCC;
    B = 8'hAA;
    opcode = 3'b100;
    #20;

    // NOT
    A = 8'hCC;
    opcode = 3'b101;
    #20;

    // LEFT SHIFT
    A = 8'b10010110;
    opcode = 3'b110;
    #20;

    // RIGHT SHIFT
    A = 8'b10010110;
    opcode = 3'b111;
    #20;

    // Random tests
    for (i = 0; i < 20; i = i + 1)
    begin
        A = $random;
        B = $random;
        opcode = $random & 3'b111;
        #20;
    end

    $finish;

end

endmodule