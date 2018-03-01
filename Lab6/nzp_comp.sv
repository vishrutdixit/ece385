module nzp_comp 
(
	input clk, Reset, load,
	input logic [15:0] data, 
	input logic [2:0] cc,
	output logic out
);

logic n, z, p;

always_ff @ (posedge clk)
	begin
		if(~Reset)
			begin 
				n = 0;
				z = 0;
				p = 0;
			end
		else if (load)
			begin
				if(data[15])
					begin
						n = 1; 
						z = 0;
						p = 0;
					end
				else if(data == 16'd0)
					begin
						n = 0;
						z = 1;
						p = 0;
					end
				else if(~data[15])
					begin
						n = 0;
						z = 0;
						p = 1;
					end
			end
		else
			begin
				n = n;
				z = z;
				p = p;
			end
	end

always_comb
	begin
		if (n && cc[2] || z && cc[1] || p && cc[0])
			out = 1;
		else
			out = 0;
	end
	
endmodule 