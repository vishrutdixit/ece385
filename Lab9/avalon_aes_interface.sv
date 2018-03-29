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
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
	
	// Registers
	logic [31:0] data [15:0];
	
	initial
	begin
    for (int i = 0; i < $size(data); i++)
    begin
        data[i] = 32'b0;
    end
	end
	
	always_ff @(posedge clk)
	begin
    if (AVL_WRITE == 1 && AVL_CS == 1)
    begin
		for (int i = 0; i < 3; i++)
		begin
			if(AVL_BYTE_EN[i] == 1)
			begin
				data[AVL_ADDR][(8*i)+7:8*i] <= AVL_WRITEDATA[(8*i)+7:8*i];		
			end
		end
    end
	end
	
	always_comb
	begin
		if(AVL_READ == 1 && AVL_CS == 1)
		begin
			//EXPORT_DATA should be assigned to the first 2 and last 2 bytes of AES Key
			EXPORT_DATA = {data[3][31:24],data[0][17:0]};
		end
	end
	
);


endmodule
