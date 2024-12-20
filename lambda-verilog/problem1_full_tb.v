module problem1_full_tb;

wire a, b;

reg clk = 0;
   
always #1 clk = !clk;

initial #5 $finish;

initial $monitor("a = %b, b = %b", a, b);

problem1_full_circuit problem1_full_circuit(.clk(clk), .a(a), .b(b));

endmodule
