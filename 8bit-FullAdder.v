
module Full_Adder(input a, c, cin, output s, cout);
assign {cout, s} = a + c + cin;
endmodule


module SUBFA(input [0:7]a, [0:7]b, control, output [0:7]c, cout);
	reg [0:7]t;
	assign t = b;
	Eight_Bit_Adder e(.x(a), .y(t), .cin8(~control), .z(c), .cout(cout));
	always @(*)
	begin
		if(control==1'b1)
		begin
			t = ~t;
		end
	end
endmodule


module Eight_Bit_Adder(input [0:7]x, [0:7]y, cin8, output [0:7]z, cout);
wire t1,t2,t3,t4,t5,t6,t7;
Full_Adder u7( .a(x[7]), .c(y[7]), .cin(cin8), .s(z[7]) , .cout(t7));
Full_Adder u6( .a(x[6]), .c(y[6]), .cin(t7), .s(z[6]) , .cout(t6));
Full_Adder u5( .a(x[5]), .c(y[5]), .cin(t6), .s(z[5]) , .cout(t5));
Full_Adder u4( .a(x[4]), .c(y[4]), .cin(t5), .s(z[4]) , .cout(t4));
Full_Adder u3( .a(x[3]), .c(y[3]), .cin(t4), .s(z[3]) , .cout(t3));
Full_Adder u2( .a(x[2]), .c(y[2]), .cin(t3), .s(z[2]) , .cout(t2));
Full_Adder u1( .a(x[1]), .c(y[1]), .cin(t2), .s(z[1]) , .cout(t1));
Full_Adder u0( .a(x[0]), .c(y[0]), .cin(t1), .s(z[0]) , .cout(cout));

endmodule