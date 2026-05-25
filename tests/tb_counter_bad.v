`timescale 1ns/1ps

module tb_counter_bad;

    logic       clk;
    logic       rst_n;
    logic       inc;
    logic       dec;
    logic [7:0] count;

    counter_bad dut (
        .clk   (clk),
        .rst_n (rst_n),
        .inc   (inc),
        .dec   (dec),
        .count (count)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst_n = 0;
        inc   = 0;
        dec   = 0;

        repeat (3) @(posedge clk);
        rst_n = 1;

        @(posedge clk);
        inc = 1;
        dec = 0;

        @(posedge clk);
        $display("inc=%0b dec=%0b count=%0d", inc, dec, count);

        inc = 0;
        dec = 1;

        @(posedge clk);
        $display("inc=%0b dec=%0b count=%0d", inc, dec, count);

        inc = 1;
        dec = 1;

        @(posedge clk);
        $display("inc=%0b dec=%0b count=%0d", inc, dec, count);

        if (count != 8'd0) begin
            $error("FAILED: When inc=1 and dec=1, expected count to hold, but count=%0d", count);
        end
        else begin
            $display("PASSED");
        end

        $finish;
    end

endmodule