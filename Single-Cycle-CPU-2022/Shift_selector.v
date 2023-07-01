module Shift_selector(regdata,sa,SHIFT,outputdata);
	input[31:0] regdata;
	input[4:0] sa;
	input SHIFT;
	output reg[31:0] outputdata;

	initial begin
		outputdata = 0;
	end

	

	always @(regdata or sa or SHIFT) begin
		if (SHIFT == 0) begin
			outputdata = regdata;
		end
		else begin
			outputdata = {27'h0000000,sa[4:0]};
		end
	end
endmodule
