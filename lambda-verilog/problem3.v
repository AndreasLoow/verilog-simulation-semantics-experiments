// Variant of problem1 using a continuous assignments instead of an always block
// to model combinational logic

// With seed = 2, the following modules print
//
// a = 1, b = x, c = x
// a = 1, b = 1, c = 0
//
// Which, again, is strange.

module problem3_circuit(
 input wire[1:0] a,
 output wire[1:0] b,
 output wire[1:0] c);

reg [1:0] b_int;
reg [1:0] c_int;

assign b = b_int;
assign c = c_int;

// Simple combinational logic
always @(*) c_int = b_int;

// Simple combinational logic
always @(*) begin
 b_int = a;
 b_int = c_int + 1;
end

endmodule

module problem3_tb;

reg[1:0] a;

wire[1:0] b, c;

always begin
 #1 a <= 0;
 #1 a <= 1;
 #5 $finish;
end

initial $monitor("a = %b, b = %b, c = %b", a, b, c);

problem3_circuit problem3_circuit(.a(a), .b(b), .c(c));

endmodule
