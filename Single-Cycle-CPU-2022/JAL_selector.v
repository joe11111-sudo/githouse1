module JAL_selector(ND, DI, PC, JAL, reg_index, reg_data);
	input[4:0] ND;
	input[31:0] DI;
	input[31:0] PC;
	input JAL;
	output reg[4:0] reg_index;
	output reg[31:0] reg_data;

	initial begin
		reg_index = 5'b00000;
		reg_data = 32'h00000000;
	end
	always @(ND or DI or JAL) begin
		if (JAL == 0) begin
			reg_index = ND;
		  reg_data = DI;
		end
		else begin
			reg_index = 5'b11111;
			reg_data = PC + 4;
		end
	end
endmodule