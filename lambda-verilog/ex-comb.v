// model two AND gates using a continuous assignment and an always block.
module main();
  reg a, b, c1;
  wire c2;

  assign c2 = a & b;

  always_comb
    c1 = a & b;

  // Test the equivalence of the result.
  // The output should be the same intuitively.
  initial begin
    a = 1; b = 0; #0;
    if (c1 == c2) $display("same");
    else $display("different");
  end

endmodule
