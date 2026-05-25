module counter_bad (
    input  logic       clk,
    input  logic       rst_n,
    input  logic       inc,
    input  logic       dec,
    output logic [7:0] count
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 8'd0;
        end
        else begin
            if (inc)
                count <= count + 1;
            else
                count <= count;

            if (dec)
                count <= count - 1;
            else
                count <= count;
        end
    end


endmodule