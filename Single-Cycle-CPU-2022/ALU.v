`include "ctrl_encode_def.v"
module ALU(A, B, ALUC, zero, result);
	input signed [31:0] A, B;
	input[3:0] ALUC;
	output reg zero;
	output reg [31:0] result;

	initial begin
		result = 0;
		zero = 0;
	end

	always @(A, B, ALUC) begin
		case(ALUC)
			`ALUOp_ADD: result = A + B;         //addu
			`ALUOp_SUB: result = A - B;         //subu
			`ALUOp_AND: result = A & B;
			`ALUOp_OR: result = A | B; 
			`ALUOp_NOR: result = ~(A | B); 
			`ALUOp_XOR: result = A ^ B; 
			`ALUOp_SLT: result = (A < B)?32'h00000001:32'h00000000; 
			`ALUOp_EQL: zero=(A==B)?1'b1:1'b0;//beq
			`ALUOp_BNE: zero=(A==B)?1'b0:1'b1;//bne
			`ALUOp_SLL: result = B << A;
			`ALUOp_SRL: result = B >> A;
			`ALUOp_SRA: result = B >>> A;
			`ALUOp_LUI: result = {B[15:0],16'h0000};
		endcase
	end
endmodule