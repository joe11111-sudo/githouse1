
module Simulator;
	reg clk = 1'b1;	
	
	Single_Cycle_CPU single_cycle_computer(clk);
	
	initial
		begin
		    $readmemh( "inst.txt", single_cycle_computer.instruction);
			#50 clk = ~clk;
		end
	always #50 clk = ~clk;  
endmodule