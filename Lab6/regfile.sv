module regfile
(
    input clk,
    input load,
    input logic [15:0] in,
    input logic [2:0] src_a, src_b, dest,
    output logic [15:0] sr1_out, sr2_out
);

logic [15:0] data [7:0] /* synthesis ramstyle = "logic" */;

/* Altera device registers are 0 at power on. Specify this
 * so that Modelsim works as expected.
 */
initial
begin
    for (int i = 0; i < $size(data); i++)
    begin
        data[i] = 16'b0;
    end
end

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data[dest] = in;
    end
end

always_comb
begin
    sr1_out = data[src_a];
    sr2_out = data[src_b];
end

endmodule : regfile
