module SB_selector(Q2, memdata, SB,SH, mem_write_data);
	input[31:0] Q2, memdata;
	input SB,SH;
	output reg[31:0] mem_write_data;

	initial begin
		mem_write_data = Q2;
	end
	always @(Q2 or memdata or SB or SH) begin
		if ((SB == 0) && (SH == 0)) begin
			mem_write_data = Q2;
		end
		if ((SB == 0) && (SH !=0)) begin
			mem_write_data = {memdata[31:16],Q2[15:0]};
		end
		if ((SB != 0) && (SH ==0)) begin
			mem_write_data = {memdata[31:7],Q2[7:0]};
		end
	end
endmodule
