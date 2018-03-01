	//------------------------------------------------------------------------------
// Company:          UIUC ECE Dept.
// Engineer:         Stephen Kempf
//
// Create Date:    17:44:03 10/08/06
// Design Name:    ECE 385 Lab 6 Given Code - Incomplete ISDU
// Module Name:    ISDU - Behavioral
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 02-13-2017
//    Spring 2017 Distribution
//------------------------------------------------------------------------------


module ISDU (input logic			Clk, Reset, Run, Continue,
				 input logic   [3:0] Opcode, 
				 input logic         IR_5,
				 input logic         IR_11,
				 input logic         BEN,
				  
				 output logic        LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED, // for PAUSE instruction				
				 output logic        GatePC, GateMDR, GateALU, GateMARMUX,
									
				 output logic  [1:0] PCMUX,
				 output logic        DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
				 output logic  [1:0] ADDR2MUX, ALUK,
				  
				 output logic        Mem_CE, Mem_UB, Mem_LB, Mem_OE, Mem_WE
				);

	enum logic [4:0] {Halted, 
							PauseIR1, 
							PauseIR2, 
							S_18, 
							S_33_1, 
							S_33_2, 
							S_35, 
							S_32, 
							S_01,
							S_AND,
							S_NOT,
							S_BR,
							S_BR1,
							S_JMP,
							S_JSR,
							S_JSR1,
							S_LDR,
							S_LDR1_1,
							S_LDR1_2,
							S_LDR2,
							S_STR,
							S_STR1,
							S_STR2_1,
							S_STR2_2}   State, Next_state;   // Internal state logic
		
	always_ff @ (posedge Clk)
	begin
		if (Reset) 
			State <= Halted;
		else 
			State <= Next_state;
	end
   
	always_comb
	begin 
		// Default next state is staying at current state
		Next_state = State;
		
		// Default controls signal values
		LD_MAR = 1'b0;
		LD_MDR = 1'b0;
		LD_IR = 1'b0;
		LD_BEN = 1'b0;
		LD_CC = 1'b0;
		LD_REG = 1'b0;
		LD_PC = 1'b0;
		LD_LED = 1'b0;
		 
		GatePC = 1'b0;
		GateMDR = 1'b0;
		GateALU = 1'b0;
		GateMARMUX = 1'b0;
		 
		ALUK = 2'b00;
		 
		PCMUX = 2'b00;
		DRMUX = 1'b0;
		SR1MUX = 1'b0;
		SR2MUX = 1'b0;
		ADDR1MUX = 1'b0;
		ADDR2MUX = 2'b00;
		 
		Mem_OE = 1'b1;
		Mem_WE = 1'b1;
	
		// Assign next state
		unique case (State)
			Halted : 
				if (Run) 
					Next_state = S_18;                      
			S_18 : 
				Next_state = S_33_1;
			// Any states involving SRAM require more than one clock cycles.
			// The exact number will be discussed in lecture.
			S_33_1 : 
				Next_state = S_33_2;
			S_33_2 : 
				Next_state = S_35;
			S_35 : 
				Next_state = S_32;
			// PauseIR1 and PauseIR2 are only for Week 1 such that TAs can see 
			// the values in IR.
			PauseIR1 : 
				if (~Continue) 
					Next_state = PauseIR1;
				else 
					Next_state = PauseIR2;
			PauseIR2 : 
				if (Continue) 
					Next_state = PauseIR2;
				else 
					Next_state = S_18;
			S_32 : 
				case (Opcode)
					4'b0001 : 
						Next_state = S_01;
					4'b0101 : 
						Next_state = S_AND;
					4'b1001 :
						Next_state = S_NOT;
					4'b0000 :
						Next_state = S_BR;
					4'b1100 :
						Next_state = S_JMP;
					4'b0100 :
						Next_state = S_JSR;
					4'b0110 :
						Next_state = S_LDR;
					4'b0111 : 
						Next_state = S_STR;
					4'b1101 : 
						Next_state = PauseIR1;
					
			default : 
						Next_state = S_18;
				endcase
			S_01 : 
				Next_state = S_18;
			S_AND : 
				Next_state = S_18;
			S_NOT :
				Next_state = S_18;
			S_BR :
				if(BEN) Next_state = S_BR1;
				else Next_state = S_18;
			S_BR1:
				Next_state = S_18;
			S_JMP : 
				Next_state = S_18;
			S_JSR :
				Next_state = S_JSR1;
			S_JSR1 :
				Next_state = S_18;
			S_LDR :
				Next_state = S_LDR1_1;
			S_LDR1_1 :
				Next_state = S_LDR1_2;
			S_LDR1_2 :
				Next_state = S_LDR2;
			S_LDR2 :
				Next_state = S_18;
			S_STR :
				Next_state = S_STR1;
			S_STR1 :
				Next_state = S_STR2_1;
			S_STR2_1 :
				Next_state = S_STR2_2;
			S_STR2_2 :
				Next_state = S_18;

			default : ;

		endcase
		
		// Assign control signals based on current state
		case (State)
			Halted: ;
			S_18 : 
				begin 
					GatePC = 1'b1;
					LD_MAR = 1'b1;
					PCMUX = 2'b00;
					LD_PC = 1'b1;
				end
			S_33_1 :
				begin
					Mem_OE = 1'b0;					
				end
			S_33_2 : 
				begin 
					Mem_OE = 1'b0;
					LD_MDR = 1'b1;
				end
			S_35 : 
				begin 
					GateMDR = 1'b1;
					LD_IR = 1'b1;
				end
			PauseIR1: 
				begin
					LD_LED = 1'b1;
				end
			PauseIR2: 
				begin
					LD_LED = 1'b1;
				end
			S_32 : 
				LD_BEN = 1'b1;
			S_01 : 							    // R(DR) <- R(SR1) + R(SR2) (or SEXT(imm5))
				begin
					SR2MUX = IR_5;
					ALUK = 2'b00;  			 //add
					GateALU = 1'b1;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
				end
			S_AND :  							 //R(DR) <- R(SR1) AND R(SR2) (or SEXT(imm5))
				begin
					SR2MUX = IR_5;
					ALUK = 2'b01; 				 //and
					GateALU = 1'b1;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
				end
			S_NOT : 								 // R(DR) <- NOT R(SR)
				begin
					ALUK = 2'b10; 				 // NOT 
					GateALU = 1'b1;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
				end
			S_BR : ;
			S_BR1  :  							 // PC <- PC + SEXT(PCoffset9)
				begin
					ADDR1MUX = 1'b0; 			 // from PC
					ADDR2MUX = 2'b10; 		 // offset9
					PCMUX = 2'b10; 			 // from adder
					LD_PC = 1'b1;
				end
			S_JMP:                         // PC <- R(BaseR)
				begin
					ADDR1MUX = 1'b1;         // from Base R 
					ADDR2MUX = 2'b00;        // 0
					PCMUX = 2'b10;           // from adders
					LD_PC =  1'b1;
				end
			S_JSR:								 // R(7) <- PC
				begin	
					GatePC = 1'b1;
					DRMUX = 1'b1; 				 // R7
					LD_REG = 1'b1;
				end
			S_JSR1:								 // PC <- PC + SEXT(PCoffset11)
				begin 
					ADDR1MUX = 1'b0;         // from PC
					ADDR2MUX = 2'b11;        // PCoffset11
					PCMUX = 2'b10;           // from adder
					LD_PC = 1'b1;
				end
			S_LDR:	 							 // MAR <- B + off6
				begin
					ADDR1MUX = 1'b1; 			 // from BaseR
					ADDR2MUX = 2'b01; 		 // offset6
					GateMARMUX = 1'b1;		 
					LD_MAR = 1'b1;
				end
			S_LDR1_1:							 // MDR <- M[MAR]
				begin
					Mem_OE = 1'b0;					
				end
			S_LDR1_2 : 
				begin 
					Mem_OE = 1'b0;
					LD_MDR = 1'b1;
				end
			S_LDR2 :							    // DR <- MDR; set CC	 
				begin
					GateMDR = 1'b1;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
				end
			S_STR :                        // MAR <- B + off6
				begin
					ADDR1MUX = 1'b1; 			 // from BaseR
					ADDR2MUX = 2'b01; 		 // offset6
					GateMARMUX = 1'b1;		 
					LD_MAR = 1'b1;
				end
			S_STR1 : 							 // MDR <- SR
				begin
					SR1MUX = 1'b1; 			 // IR[11:9]
					ALUK = 2'b11;				 // Pass A
					GateALU = 1'b1;
					LD_MDR = 1'b1;	
				end
			S_STR2_1 :					       // M[MAR} <- MDR
				begin 
					Mem_WE = 1'b0;
					GateMDR = 1'b1;
				end
			S_STR2_2 :
				begin
					Mem_WE = 1'b0;
					GateMDR = 1'b1;
					LD_MAR = 1'b1;
				end
			default : ;
		endcase
	end 

	 // These should always be active
	assign Mem_CE = 1'b0;
	assign Mem_UB = 1'b0;
	assign Mem_LB = 1'b0;
	
endmodule
