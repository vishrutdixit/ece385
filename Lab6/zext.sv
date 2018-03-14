module zext #(parameter width = 4)
(
	input [width-1:0] in,
	output logic [15:0] out
);

assign out = $unsigned(in);

endmodule : zext
