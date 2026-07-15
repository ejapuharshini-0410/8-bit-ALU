`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 22:25:45
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
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module eightbitalu (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] opcode,
    output reg [7:0] Result,
    output reg       Carry,
    output reg       Zero
);

always @(*) begin
    // Default values
    Result = 8'b0;
    Carry  = 1'b0;

    case (opcode)

        // Addition
        3'b000: begin
            {Carry, Result} = A + B;
        end

        // Subtraction
        3'b001: begin
            {Carry, Result} = A - B;
        end

        // Bitwise AND
        3'b010: begin
            Result = A & B;
        end

        // Bitwise OR
        3'b011: begin
            Result = A | B;
        end

        // Bitwise XOR
        3'b100: begin
            Result = A ^ B;
        end

        // Bitwise NOT
        3'b101: begin
            Result = ~A;
        end

        // Left Shift
        3'b110: begin
            Carry  = A[7];
            Result = A << 1;
        end

        // Right Shift
        3'b111: begin
            Carry  = A[0];
            Result = A >> 1;
        end

        default: begin
            Result = 8'b0;
            Carry  = 1'b0;
        end

    endcase

    // Zero flag
    Zero = (Result == 8'b0);

end

endmodule