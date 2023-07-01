`include "instruction_def.v"
`include "ctrl_encode_def.v"

module Control_unit(op,func,Z, ALUC, JUMP, M2REG, BRANCH, WMEM, SHIFT, ALUIMM, WREG, SEXT, REGRT, JR, LB, SB, JAL, LH, SH, UNSIGN);
	input[5:0] op;
	input[5:0] func;
	input Z;
	reg[15:0] control_signal;
	output JUMP, M2REG, BRANCH, WMEM, SHIFT, ALUIMM, WREG, SEXT, REGRT, JR, LB, SB, JAL, LH, SH, UNSIGN;
	output reg[3:0] ALUC;
	assign JUMP = control_signal[15];
	assign M2REG = control_signal[14];
	assign BRANCH = control_signal[13];
	assign WMEM = control_signal[12];
	assign SHIFT = control_signal[11];
	assign ALUIMM = control_signal[10];
	assign WREG = control_signal[9];
	assign SEXT = control_signal[8];
	assign REGRT = control_signal[7];
	assign JR = control_signal[6];
	assign LB = control_signal[5];
	assign SB = control_signal[4];
	assign JAL = control_signal[3];
	assign LH = control_signal[2];
	assign SH = control_signal[1];
	assign UNSIGN = control_signal[0];

	initial begin
		control_signal = 16'b0000000000000000;
		ALUC = 4'b0000;
	end
	
	always @(op or func or Z) begin
		case(op)
			`INSTR_RTYPE_OP:begin
				case(func)
					`INSTR_ADD_FUNCT:begin
						control_signal = 16'b0000001000000000;
						ALUC = `ALUOp_ADD;
						$display("Control_unit add");
					end
					`INSTR_ADDU_FUNCT:begin
						control_signal = 16'b0000001000000000;
						ALUC = `ALUOp_ADD;
						$display("Control_unit addu");
					end
					`INSTR_SUB_FUNCT:begin
						control_signal = 16'b0000001000000000;
						ALUC = `ALUOp_SUB;
						$display("Control_unit sub");
					end
					`INSTR_SUBU_FUNCT:begin
						ALUC = `ALUOp_SUB;
						control_signal = 16'b0000001000000000;
						$display("Control_unit subu");
					end
					`INSTR_AND_FUNCT:begin
						ALUC = `ALUOp_AND;
						control_signal = 16'b0000001000000000;
						$display("Control_unit and");
					end
					`INSTR_NOR_FUNCT:begin
						ALUC = `ALUOp_NOR;
						control_signal = 16'b0000001000000000;
						$display("Control_unit nor");
					end
					`INSTR_OR_FUNCT:begin
						ALUC = `ALUOp_OR;
						control_signal = 16'b0000001000000000;
						$display("Control_unit or");
					end
					`INSTR_XOR_FUNCT:begin
						ALUC = `ALUOp_XOR;
						control_signal = 16'b0000001000000000;
						$display("Control_unit xor");
					end
					`INSTR_SLT_FUNCT:begin
						ALUC = `ALUOp_SLT;
						control_signal = 16'b0000001000000000;
						$display("Control_unit slt");
					end
					`INSTR_SLL_FUNCT:begin
						ALUC = `ALUOp_SLL;
						control_signal = 16'b0000101000000000;
						$display("Control_unit sll");
					end
					`INSTR_SRL_FUNCT:begin
						ALUC = `ALUOp_SRL;
						control_signal = 16'b0000101000000000;
						$display("Control_unit srl");
					end
					`INSTR_SRA_FUNCT:begin
						ALUC = `ALUOp_SRA;
						control_signal = 16'b0000101000000000;
						$display("Control_unit sra");
					end
					`INSTR_JR_FUNCT:begin
						ALUC = `ALUOp_ADD;
						control_signal = 16'b1000000001000000;
						$display("Control_unit jr");
					end
				endcase
			end
			
			
			`INSTR_LB_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b0100011110100000;
					$display("Control_unit lb");
			end
			
			`INSTR_LBU_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b0100011110100001;
					$display("Control_unit lbu");
			end
			
			`INSTR_LH_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b0100011110000100;
					$display("Control_unit lh");
			end
			
			`INSTR_SH_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b0001010100000010;
					$display("Control_unit sh");
			end
			
			
			`INSTR_LW_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b0100011110000000;
					$display("Control_unit lw");
			end
			
			`INSTR_SB_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b0001010100010000;
					$display("Control_unit sb");
			end
			
			`INSTR_SW_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b0001010100000000;
					$display("Control_unit sw");
			end
			
			`INSTR_ADDI_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b0000011110000000;
					$display("Control_unit addi");
			end
			
			`INSTR_ANDI_OP:begin
					ALUC = `ALUOp_AND;
					control_signal = 16'b0000011010000000;
					$display("Control_unit andi");
			end
			
			`INSTR_ORI_OP:begin
					ALUC = `ALUOp_OR;
					control_signal = 16'b0000011010000000;
					$display("Control_unit ori");
			end
			
			`INSTR_XORI_OP:begin
					ALUC = `ALUOp_XOR;
					control_signal = 16'b0000011010000000;
					$display("Control_unit xori");
			end
			
			`INSTR_LUI_OP:begin
					ALUC = `ALUOp_LUI;
					control_signal = 16'b0000011010000000;
					$display("Control_unit lui");
			end
			
			`INSTR_SLTI_OP:begin
					ALUC = `ALUOp_SLT;
					control_signal = 16'b0000011110000000;
					$display("Control_unit slti");
			end
			
			`INSTR_BEQ_OP:begin
					ALUC = `ALUOp_EQL;
					control_signal = {2'b00, Z, 13'b0000100000000};
					$display("Control_unit beq");
			end
			
			`INSTR_BNE_OP:begin
					ALUC = `ALUOp_BNE;
					control_signal = {2'b00, Z, 13'b0000100000000};
					$display("Control_unit bne");
			end
			
			`INSTR_J_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b1000000000000000;
					$display("Control_unit j");
			end
			
			`INSTR_JAL_OP:begin
					ALUC = `ALUOp_ADD;
					control_signal = 16'b1000001000001000;
					$display("Control_unit jal");
			end
		endcase
	end


endmodule