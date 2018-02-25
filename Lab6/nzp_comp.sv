module nzp_comp #(parameter width = 3)
(
	input logic [2:0] a, 
	input logic [2:0] b,
	output logic out
);
always_comb
begin
if (a[0] && b[0] || a[1] && b[1] || a[2] && b[2])
	out = 1;
else
	out = 0;
end
endmodule : nzp_comp