module Single_Cycle_CPU(clk);
	input clk;
	reg [31:0] instruction[1023:0];
	reg[31:0] PC = 32'h00000000;

	reg[31:0] inst;

	wire[5:0] op = inst[31:26];
	wire[4:0] rs = inst[25:21];
	wire[4:0] rt = inst[20:16];
	wire[4:0] rd = inst[15:11];
	wire[4:0] sa = inst[10:6];
	wire[5:0] func = inst[5:0];

	wire[15:0] imme = inst[15:0];
	wire[25:0] target = inst[25:0];

	wire Z;

	//control unit
	wire JUMP, M2REG, BRANCH, WMEM, SHIFT, ALUIMM, WREG, SEXT, REGRT, JR, LB, SB, JAL, LH, SH, UNSIGN;
	wire[3:0] ALUC;
	Control_unit control_unit(op,func,Z, ALUC, JUMP, M2REG, BRANCH, WMEM, SHIFT, ALUIMM, WREG, SEXT, REGRT, JR, LB, SB, JAL, LH, SH, UNSIGN);

	
	// 选择寄存器写入的目标地址
	wire[4:0] ND;
	Rtselector rtselector(rt,rd,REGRT,ND);

	wire[31:0] Q1;
	wire[31:0] Q2;

	wire[31:0] DI;
	wire[4:0] reg_index;
	wire[31:0] reg_data;
	Regfile regfile(rs, rt, reg_index, reg_data,clk, WREG, Q1, Q2);

	wire[31:0] imm;

	Ext ext(imme,SEXT,imm);

	wire[31:0] B;
	Reg_Imm_selector reg_imm_selector(Q2,imm,ALUIMM,B);

	wire[31:0] A;
	Shift_selector shift_selector(Q1,sa,SHIFT,A);


	wire[31:0] ALU_result;
	// wire zero =0;

	ALU alu(A, B, ALUC, Z, ALU_result);

	wire[31:0] mem_data_out;
	wire[31:0] mem_write_data;
	Data_mem data_mem(ALU_result,mem_write_data,WMEM,mem_data_out, clk);
	
	wire[31:0] reg_write_data;
	Mem_Reg_selector mem_Reg_selector(ALU_result,reg_write_data,M2REG,DI);

	LB_selector lb_selector(mem_data_out,LB,LH,UNSIGN,reg_write_data);

	JAL_selector jal_selector(ND, DI, PC, JAL, reg_index, reg_data);

	SB_selector sb_selector(Q2, mem_data_out, SB,SH, mem_write_data);

		always @(posedge clk) begin
			$display("Clk posedge PC is %h",PC);
			
			inst = instruction[PC/4];
			$display("inst is %h",inst);
			
		end

		always @(negedge clk) begin
			$display("ALU_A is %h", A);
			$display("ALU_B is %h", B);
			$display("ALU_RES is %h", ALU_result);
			$display("imm is %h", imm);
			$display("rs is %h", rs);
			$display("rt is %h", rt);
			$display("rd is %h", rd);
			$display("sa is %h", sa);
			if (JUMP==1) begin
				if(JR==1) PC = Q1;
				else PC = {PC[31:28], target, 2'b00};
			end
			else begin
				if (BRANCH==1) begin
					PC = PC + 4 + {imm,2'b00};
				end
				else
					PC = PC + 4;
				end
		end
		// always @(negedge clk) begin
		// 	$display("Clk negedge");
	// end
endmodule