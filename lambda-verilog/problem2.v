// Illustrates a similar problem to problem1, except that this time we are
// using nonblocking assignments

// With seed = 2, the following modules print
//
// a = 1, b = x, c = x
// a = 1, b = 1, c = 0
//
// Which is again strange since c should always
// be equal to b at the end of each time step
// for the same reason as in problem1.

module problem2_circuit(
 input wire clk,
 input wire a,
 output reg b,
 output reg c);

// Simple sequential logic
always @(posedge clk) begin
 // Some default value
 b <= 0;

 // Again, some logic updating b...
 b <= a;
end

// Simple combinational logic
always @(*) c = b;

endmodule

module problem2_tb;

reg a;

wire b, c;

reg clk = 0;

always #1 clk = !clk;

initial begin
 @(negedge clk) a <= 1;
 @(negedge clk) $finish;
end

initial $monitor("a = %b, b = %b, c = %b", a, b, c);

problem2_circuit problem2_circuit(.clk(clk), .a(a), .b(b), .c(c));

endmodule
