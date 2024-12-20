module problem1_full;

reg a, b;

// Test bench part

reg clk = 0;
   
always #1 clk = !clk;

initial #5 $finish;

initial $monitor("a = %b, b = %b", a, b);

// Circuit part

always @(*) b = a;

always @(posedge clk) begin
 a = 0;
 a = 1;
end

endmodule

