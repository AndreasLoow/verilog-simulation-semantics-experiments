// Illustrates a problem with allowing arbitrary preemption of procedural processes

// With seed = 0, the following modules print
//
// a = xx, b = xx, c = xx
// a = 00, b = 01, c = 01
// a = 01, b = 10, c = 00
//
// However, if we read the problem1_circuit module as
// synthesis would read the module, this is strange since
// c should always have the same value as b at the end of
// each time step since c just forwards the value of b.

module problem1_circuit(
 input wire[1:0] a,
 output reg[1:0] b,
 output reg[1:0] c);

// Simple combinational logic
always @(*) begin
 // "Default" value for b,
 // a coding-style sometimes
 // used to avoid inferring latches
 b = 0;

 // Some logic for b where b is assigned again...
 b = a + 1;
end

// Simple combinational logic
always @(*) c = b;

endmodule

module problem1_tb;

reg[1:0] a;

wire[1:0] b, c;

always begin
 #1 a <= 0;
 #1 a <= 1;
 #5 $finish;
end

initial $monitor("a = %b, b = %b, c = %b", a, b, c);

problem1_circuit problem1_circuit(.a(a), .b(b), .c(c));

endmodule
