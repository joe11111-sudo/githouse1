`include "ctrl_encode_def.v"
`include "instruction_def.v"

module ctrl(
    input [5:0] opcode,
    input [5:0] func,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg MemRead,
    output reg RegWrite,
    output reg MemWrite,
    output reg [1:0] DatatoReg,
    output reg [1:0] PC_sel,
    output reg ExtOp,
    output reg [4:0] ALUCtrl  
   
);


always @(opcode or func ) begin
	case(opcode)
		`INSTR_RTYPE_OP:begin   // R type  
				case(func)
				
				//addu
				`INSTR_ADDU_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_ADDU;
					
					end
		
				//subu
				`INSTR_SUBU_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SUBU;	
				
					end								
      
      // add
      `INSTR_ADD_FUNCT:    
        begin   
          RegDst = 2'b01; 
          ALUSrc = 0; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl = `ALUOp_ADD;  
        
        
        end
        
                  
      // sub
      `INSTR_SUB_FUNCT:  
        begin  
          RegDst = 2'b01; 
          ALUSrc = 0; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_SUB;  
        
        end
        
      // and
      `INSTR_AND_FUNCT: 
        begin  
          RegDst = 2'b01; 
          ALUSrc = 0; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_AND; 
        
        end
        
      // or
      `INSTR_OR_FUNCT:   
        begin 
          RegDst = 2'b01; 
          ALUSrc = 0; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_OR;   
     
        end
        
        
      //slt
      `INSTR_SLT_FUNCT:      
        begin   
          RegDst = 2'b01; 
          ALUSrc = 0; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_SLT;  
       
        end 
        
      // sll
      `INSTR_SLL_FUNCT:      
        begin   
          RegDst = 2'b01; 
          ALUSrc = 1; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_SLL ;  
       
        end
             
       // srl
      `INSTR_SRL_FUNCT:      
        begin   
          RegDst = 2'b01; 
          ALUSrc = 1; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_SRL ; 
               
        end
        
      // sra
      `INSTR_SRA_FUNCT:      
        begin   
          RegDst = 2'b01; 
          ALUSrc = 1; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_SRA ;   
           
        end
                
      //jr
      `INSTR_JR_FUNCT:      
        begin   
          RegDst = 2'b00; 
          ALUSrc = 0; 
          RegWrite = 0;
          MemRead = 0; 
          MemWrite = 0; 
          DatatoReg = 2'b00;    
          PC_sel = 2'b11;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_NOP; 
         
        end
        
      endcase
    end 
      
      //lb
      `INSTR_LB_OP:      
        begin   
          RegDst = 2'b00; 
          ALUSrc = 1; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b01;    
          PC_sel = 2'b00;
          ExtOp = 1;  
          ALUCtrl =  `ALUOp_NOP;     
        
        end   

      	// lw
      `INSTR_LW_OP: 
        begin  
          RegDst = 2'b00; 
          ALUSrc = 1; 
          RegWrite = 1;
          MemRead = 0; 
          MemWrite = 0; 
          DatatoReg = 2'b01;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl = `ALUOp_NOP;
          
        end
          
      //sb
      `INSTR_SB_OP:      
        begin   
          RegDst = 2'b00; 
          ALUSrc = 1; 
          RegWrite = 0;
          MemRead = 1;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0; 
          ALUCtrl =  `ALUOp_NOP;    
        
        end   
        
      // sw
      `INSTR_SW_OP:    
        begin   
          RegDst = 2'b00; 
          ALUSrc = 1; 
          RegWrite = 0;
          MemRead = 1; 
          MemWrite = 0; 
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 0;        
          ALUCtrl = `ALUOp_NOP;   
          
				   
        end
        
      // addi
      `INSTR_ADDI_OP:      
        begin   
          RegDst = 2'b00; 
          ALUSrc = 1; 
          RegWrite = 1;
          MemRead = 0; 
          MemWrite = 0; 
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 1;        
          ALUCtrl =  `ALUOp_ADD;   
      
        end
        
			 //ori
			 `INSTR_ORI_OP:  //6'b001101:
		     begin
			     RegDst = 2'b00;
				   ALUSrc = 1;
				   MemRead = 0;
				   RegWrite = 1;
				   MemRead = 0;
				   MemWrite = 0;
				   DatatoReg = 2'b00;
				   PC_sel = 2'b00;
				   ExtOp = 1;
				   ALUCtrl = `ALUOp_OR;	
				 
		   	end
		    	 
		    
       // lui
      `INSTR_LUI_OP:      
        begin   
          RegDst = 2'b00; 
          ALUSrc = 1; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 1;        
          ALUCtrl =  `ALUOp_LUI ;   
         
        end	 
        
      //slti
      `INSTR_SLTI_OP:      
        begin   
          RegDst = 2'b00; 
          ALUSrc = 1; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b00;    
          PC_sel = 2'b00;
          ExtOp = 1;        
          ALUCtrl =  `ALUOp_NOP;  
         
        end 
		    	 
		   //beq 
			 `INSTR_BEQ_OP:  
		    	begin
			     RegDst = 2'b00;
				   ALUSrc = 0;
				   MemRead = 0;
				   RegWrite = 0;
				   MemRead = 0;
				   MemWrite = 0;
				   
				   DatatoReg = 2'b00;
				   PC_sel = 2'b01;
				   ExtOp = 0;
				   ALUCtrl = `ALUOp_EQL;				
				 
			   end
  
      // bne
      `INSTR_BNE_OP:      
        begin   
          RegDst = 2'b00; 
          ALUSrc = 0; 
          RegWrite = 0;
          MemRead = 0; 
          MemWrite = 0; 
          DatatoReg = 2'b00;    
          PC_sel = 2'b01;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_BNE ; 
                  
        end
      
      // j
      `INSTR_J_OP:      
        begin   
          RegDst = 2'b00; 
          ALUSrc = 0; 
          RegWrite = 0;
          MemRead = 0; 
          MemWrite = 0; 
          DatatoReg = 2'b00;    
          PC_sel = 2'b10;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_NOP;  
                 
        end
     
       
       // jal
      `INSTR_JAL_OP:      
        begin   
          RegDst = 2'b01; 
          ALUSrc = 0; 
          RegWrite = 1;
          MemRead = 0;  
          MemWrite = 0;
          DatatoReg = 2'b01;    
          PC_sel = 2'b11;
          ExtOp = 0;        
          ALUCtrl =  `ALUOp_NOP;
        
        end 
  
					
			endcase
	end
endmodule    
         
      
