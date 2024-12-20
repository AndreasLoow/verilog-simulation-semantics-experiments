module problem1_minimal;

reg a, b;

always @(*) b = a;

initial begin
 a = 0;
 a = 1;
end

initial $monitor("a = %b, b = %b", a, b);

endmodule
