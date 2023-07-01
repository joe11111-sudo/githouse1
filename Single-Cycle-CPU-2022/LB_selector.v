module LB_selector(memdata,LB,LH,UNSIGN,outputdata);
	input[31:0] memdata;
	input LB,LH,UNSIGN;
	output reg[31:0] outputdata;

	initial begin
		outputdata = 0;
	end
	always @(memdata or LB or LH) begin
		if ((LB == 0) && (LH == 0)) begin
			outputdata = memdata;
		end
		if ((LB == 0) && (LH !=0)) begin
		  if(UNSIGN==1||memdata[15]==0) outputdata = {16'h0000,memdata[15:0]};
		  else outputdata = {16'hffff,memdata[15:0]};
		end
		if ((LB != 0) && (LH ==0)) begin
			if(UNSIGN==1||memdata[15]==0) outputdata = {24'h000000,memdata[7:0]};
			else outputdata = {24'hffffff,memdata[7:0]};
		end
	end
endmodule
