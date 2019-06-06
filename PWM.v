module PWM(clk, HighTime, LowTime, HighWrite, LowWrite, pwm);
input  [15:0] HighTime, LowTime;
output pwm;
input clk;
input  HighWrite, LowWrite;
reg [15:0] cnt = 0;
reg [15:0] high, low;
reg temp = 1;
assign pwm = temp;
always @(posedge (clk)) begin
	
	if (temp && cnt >= high) begin
		cnt = 0;
		temp = 0;
	end
	
	if (~temp && cnt >= low) begin
		cnt = 0;
		temp = 1;
	end
	cnt = cnt + 1;
	
end
always @(HighWrite)
	high = HighTime;
always @(LowWrite)
	low = LowTime;

endmodule
	

