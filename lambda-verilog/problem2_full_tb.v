module problem2_full_tb;

wire a, b;

reg clk = 0;
   
always #1 clk = !clk;

initial #5 $finish;

initial $monitor("a = %b, b = %b", a, b);

problem2_full_circuit problem2_full_circuit(.clk(clk), .a(a), .b(b));

endmodule
