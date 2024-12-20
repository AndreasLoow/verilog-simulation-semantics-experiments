module problem2_full_circuit(
 input wire clk,
 output reg a,
 output reg b);

// Simple combinational logic
always @(*) b = a;

// Simple sequential logic
always @(posedge clk) begin
 a <= 0;
 a <= 1;
end

endmodule
