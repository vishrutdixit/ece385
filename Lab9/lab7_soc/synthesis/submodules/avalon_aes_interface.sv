/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/

module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [31:0] EXPORT_DATA);		// Exported Conduit Signal to LEDs
	
	// Registers
	logic [31:0] data [15:0];
	
	assign EXPORT_DATA = {data[3][31:16],data[0][15:0]};
	
	initial
	begin
		for (int i = 0; i < $size(data); i++)
		begin
        data[i] = 32'b0;
    end
	end
	
	always_ff @(posedge CLK)
	begin
    if (AVL_WRITE == 1 && AVL_CS == 1)
    begin
		case(AVL_BYTE_EN)
			4'b1111: begin
				data[AVL_ADDR][31:0] <= AVL_WRITEDATA[31:0];
         end
         4'b1100: begin
            data[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16];
         end
         4'b0011: begin
            data[AVL_ADDR][15:0] <= AVL_WRITEDATA[15:0];
         end
         4'b1000: begin
            data[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];
         end
         4'b0100: begin
            data[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];
         end
         4'b0010: begin
            data[AVL_ADDR][15:8] <= AVL_WRITEDATA[15:8];
         end
         4'b0001: begin
            data[AVL_ADDR][7:0] <= AVL_WRITEDATA[7:0];
         end
		endcase
    end
	 if(AVL_READ == 1 && AVL_CS == 1)
		begin
			AVL_READDATA = data[AVL_ADDR];
		end
	end

endmodule
