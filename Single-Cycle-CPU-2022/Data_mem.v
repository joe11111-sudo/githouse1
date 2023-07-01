module Data_mem(address, data_in , WE, data_out, clk);
	input[31:0] address;
	input[31:0] data_in;
	input WE;
	input clk;
	output [31:0] data_out;


	reg[31:0] memory[0:64];
  
  integer i;
  
  initial begin
		for (i = 0; i<64;i = i+1)begin
			memory[i] = 0;
		end	
	end
  
	assign data_out = memory[address/4];
	
	always @(negedge clk) begin
		if (WE == 1) begin
			memory[address/4] = data_in;
			$display("memory[%h] is %h",address,data_in);
		end
	end

endmodule