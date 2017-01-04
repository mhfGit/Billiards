module palette(input [3:0] code,
					output [7:0] red,
					output [7:0] green,
					output [7:0] blue);

always comb
begin
	if(code == 4'b0000) //pink
	begin
		red = 8'b11111111;
		green = 8'b00000000;
		blue = 8'b11111111;
	end
	else if(code == 4'b0001) //black
	begin
		red = 8'b00000000;
		green = 8'b00000000;
		blue = 8'b00000000;
	end
	else if(code == 4'b0010) //white
	begin
		red = 8'b11111111;
		green = 8'b11111111;
		blue = 8'b11111111;
	end
	else if(code == 4'b0011) // gold
	begin
		red = 8'b11111111;
		green = 8'b11001001;
		blue = 8'b00001110;
	end
	else if(code == 4'b0100) // blue
	begin
		red = 8'b00100110;
		green = 8'b00110100;
		blue = 8'b11011001;
	end	
	else if(code == 4'b0101) // red
	begin
		red = 8'b111101101;
		green = 8'b00011100;
		blue = 8'b00100100;
	end	
	else if(code == 4'b0110) // purple
	begin
		red = 8'b10000000;
		green = 8'b00000000;
		blue = 8'b11111111;
	end	
	else if(code == 4'b0111) // orange
	begin
		red = 8'b11111111;
		green = 8'b01111111;
		blue = 8'b00100111;
	end	
	else if(code == 4'b1000) // maroon
	begin
		red = 8'b10001000;
		green = 8'b00000000;
		blue = 8'b00010101;
	end	
	else if(code == 4'b1001) // beige
	begin
		red = 8'b11100110;
		green = 8'b11001110;
		blue = 8'b11000001;
	end	
	else if(code == 4'b1010) // light blue
	begin
		red = 8'b00000000;
		green = 8'b10100010;
		blue = 8'b11101000;
	end	
	else if(code == 4'b1011) // dark green
	begin
		red = 8'b00000000;
		green = 8'b10000000;
		blue = 8'b00000000;
	end	
	else if(code == 4'b1100) // dark red
	begin
		red = 8'b01011110;
		green = 8'b00000000;
		blue = 8'b00001110;
	end	
	else if(code == 4'b1101) // light green
	begin
		red = 8'b00100010;
		green = 8'b10110001;
		blue = 8'b01001100;
	end	
	else // brown
	begin
		red = 8'b01111110;
		green = 8'b01001111;
		blue = 8'b00110100;
	end
end

endmodule