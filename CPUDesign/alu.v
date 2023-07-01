`include "ctrl_encode_def.v"

module alu(
  input [31:0] A,
    input [31:0] B,
    input [4:0] ALUOp,
    output reg [31:0] C,  
	  output reg zero
    );
    
  initial begin
	   C    = 32'b0;
	   zero = 0;
	end

	 always @(A or B or ALUOp)begin
		case(ALUOp)
			`ALUOp_ADD: C = A + B;         //add
			`ALUOp_SUB: C = A - B;         //sub
			`ALUOp_OR:   C = A | B; 
			`ALUOp_NOR:  C = ~(A | B); 
			`ALUOp_XOR:  C = A ^ B;  
			`ALUOp_EQL:  zero=(A==B)?1'b1:1'b0;
			`ALUOp_BNE:  zero=(A==B)?1'b0:1'b1;
      `ALUOp_AND:  C = A & B;  
      `ALUOp_SLL:  C = B << (A[4:0]);
      `ALUOp_SLT:  C = (A < B) ? 32'd1 : 32'd0; 
     	`ALUOp_SRL:  C = B >> (A[4:0]);
			`ALUOp_SRA:  C = ({{31{B[31]}},1'b0} << (~A[4:0]))|(B >> A[4:0]); 
			`ALUOp_LUI:  C = {B[15:0],16'b0}; 
			`ALUOp_SLTU: C = ({1'b0, A} < {1'b0, B}) ? 32'd1 : 32'd0;
			`ALUOp_NOP:  C = A; 
			 default:   C = A; 
  		endcase
	end
endmodule



