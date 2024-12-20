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

