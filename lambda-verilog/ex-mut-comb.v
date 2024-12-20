// If we reorder blocks, the result becomes different.
module main();
  reg a, b, c1;
  wire c2;

  initial begin
    a = 1; b = 0; #0;
    if (c1 == c2) $display("same");
    else $display("different");
  end

  assign c2 = a & b;
  always_comb
    c1 = a & b;

endmodule
