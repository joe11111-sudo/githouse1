	module inst_mem(PC,inst);
	output inst;
	input PC;
	reg [7:0] instraction[0:31];
	initial
		begin
			instraction[0]= 32'b00000000000000010000100000100000;
			instraction[1]= 32'b00000000000000010000100000100000;
			instraction[2]= 32'b00000000000000010000100000100000;
			instraction[3]= 32'b00000000000000010000100000100000;
			instraction[4]= 32'b00000000000000010000100000100000;
			instraction[5]= 32'b00000000000000010000100000100000;
			instraction[6]= 32'b00000000000000010000100000100000;
			instraction[7]= 32'b00000000000000010000100000100000;
		end
endmodule
