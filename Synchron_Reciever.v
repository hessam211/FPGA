module receiver(input sharedClk, serialIn, output reg dataValid, [7:0] data);

reg [3:0] cnt = 0;

always @(posedge sharedClk) begin
	if (cnt <= 7) begin
		data[cnt] = serialIn;
		cnt <= cnt + 1;
	end
	if (cnt == 7)
	begin
		dataValid <= 1;
	end
	if (dataValid == 1) begin
		dataValid <= 0;
		cnt <= 0;
	end
end

endmodule
