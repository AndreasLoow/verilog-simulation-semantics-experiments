module problem1_minimal;

reg a, r;

wire w;

always @(*) r = a;

assign w = a;

initial begin
 a = 0;
 a = 1;
end

initial $monitor("a = %b, r = %b, w = %b", a, r, w);

endmodule
