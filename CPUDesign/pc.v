module pc(
    input [31:0] newpc,
    input clk,
    input reset,
    output [31:0] oldpc
    );
	
	reg [31:0] _pc;
	
always@(posedge clk or posedge reset)begin
		  if(reset == 1'b1) begin
		      _pc <= 32'h00003000;
		  end
		  else begin
			   _pc  <= newpc;
		  end
	 end	
	assign oldpc = _pc;
endmodule


