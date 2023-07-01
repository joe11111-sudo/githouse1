module Regfile(N1, N2, ND, DI, clk, WE, Q1, Q2);
	input[4:0] N1;
	input[4:0] N2;
	input[4:0] ND;
	input[31:0] DI;
	input clk;
	input WE;
	output [31:0] Q1;
	output [31:0] Q2;

	integer i = 0;


		reg[31:0] register[31:0];


	initial
	begin
		for (i = 0; i<32;i = i+1)begin
			register[i] = 0;
		end	
	end


	assign Q1 = register[N1];
	assign Q2 = register[N2];

	
	always @(negedge clk) begin
		//$display("Regfile: negedge");
		if (WE) begin
			register[ND] = DI;
			$display("Regfile: ND is %h, register[ND] is %h", ND, register[ND]);	
		end
	end
endmodule