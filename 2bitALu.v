module alu_2bit(
 input [1:0] operand_a, // 2-bit operand A
 input [1:0] operand_b, // 2-bit operand B
 input [2:0] operation, // 3-bit operation selection code
 output [1:0] result, // 2-bit result of the operation
 output carry_out // Carry-out bit for arithmetic operations
);
 reg [1:0] ALU_Result; // Internal register to hold the ALU output
 wire [2:0] extended_result; // 3-bit wire for carry calculation in addition

 // Assign the internal ALU_Result to the output port
 assign result = ALU_Result; 
 
 // Calculate extended sum for carry-out: extend operands by 1 bit to capture carry
 assign extended_result = {1'b0, operand_a} + {1'b0, operand_b}; 
 // The carry-out is the most significant bit (bit 2) of the extended result
 assign carry_out = extended_result; 

 // Combinational logic for ALU operations
 always @(*)
 begin
 case (operation)
 // Arithmetic operations
 3'b000: ALU_Result = operand_a + operand_b; // Addition
 3'b001: ALU_Result = operand_a - operand_b; // Subtraction
 
 // Logical operations
 3'b010: ALU_Result = operand_a & operand_b; // Logical AND
 3'b011: ALU_Result = operand_a | operand_b; // Logical OR
 3'b100: ALU_Result = operand_a ^ operand_b; // Logical XOR
 
 default: ALU_Result = 2'bxx; // Default case for unassigned operations (don't care)
 endcase
 end
endmodule
