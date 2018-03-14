module sext #(parameter width = 4)
(
	input [width-1:0] in,
	output logic [15:0] out
);

assign out = $signed(in);

endmodule : sext
