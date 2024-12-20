module mod(output wire foo);

assign foo = 0;

initial $monitor(foo);

endmodule

module top;

wire foo = 1;

mod mod(.foo(foo));

endmodule
