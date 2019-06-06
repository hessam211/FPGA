module p_counter (clk, clkout, count);
  parameter n = 59;
  parameter len = 6;
 
  output reg [len-1:0] count;
  input clk;
  output wire clkout;
  reg temp = 0;
 
  initial begin
    count = 0;

end

 assign clkout = temp;
  
  always @(posedge clk)
    if (count == n) begin
      count = 0;
      temp = ~temp;
	end 
    else begin
      count = count + 1;
	temp = 0;
end
	
	
	  
 
endmodule



module calendar(clk, y,m,d,h,mi,s);
input clk;
output [10:0] y;
output [3:0] m;
output [4:0] d;
output [4:0] h;
output [5:0] mi;
output [5:0] s;
wire clk1;
wire clk2;
wire clk3;
wire clk4;
wire clk5;
wire clk6;

p_counter #(.n(59), .len(5)) sec( .clk(clk), .clkout(clk1), .count(s));
p_counter #(.n(59), .len(5)) min( .clk(clk1), .clkout(clk2), .count(mi));
p_counter #(.n(23), .len(4)) hour( .clk(clk2), .clkout(clk3), .count(h));
p_counter #(.n(29), .len(4)) day( .clk(clk3), .clkout(clk4), .count(d));
p_counter #(.n(11), .len(3)) month( .clk(clk4), .clkout(clk5), .count(m));
p_counter #(.n(23), .len(11)) year( .clk(clk5), .clkout(clk6), .count(y));

endmodule

module p_counter (clk, rst, clkout, count);
  parameter n = 59;
  parameter len = 6;
 
  output reg [len-1:0] count;
  input clk;
  output wire clkout;
  reg temp = 0;
 
  initial begin
    count = 0;

end

 assign clkout = temp;
  
  always @(posedge clk)
    if (count == n) begin
      count = 0;
      temp = ~temp;
	end 
    else begin
      count = count + 1;
	temp = 0;
end
		  
assign clkout = !rst ? temp : 0;
assign count = !rst ? count : 0;
 
endmodule
