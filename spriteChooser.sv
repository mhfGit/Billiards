module spriteChooser(
							input logic [4:0] select,
							input logic [16:0] collision,
							input logic [3:0]	codept, 
							input logic [3:0]	code1b, 
							input logic [3:0] code2b, 
							input logic [3:0] code3b, 
							input logic [3:0]	code4b, 
							input logic [3:0]	code5b, 
							input logic [3:0]	code6b, 
							input logic [3:0]	code7b, 
							input logic [3:0]	code8b, 
							input logic [3:0]	code9b, 
							input logic [3:0]	code10b, 
							input logic [3:0]	code11b, 
							input logic [3:0]	code12b, 
							input logic [3:0]	code13b, 
							input logic [3:0]	code14b, 
							input logic [3:0]	code15b, 
							input logic [3:0]	codecue, 
							input logic [3:0]	codep1cue,
							input logic [3:0]	codep1cue45,
							input logic [3:0]	codep1cue90,
							input logic [3:0]	codep1cue135,
							input logic [3:0]	codep1cue180,
							input logic [3:0]	codep1cue225,
							input logic [3:0]	codep1cue270,
							input logic [3:0]	codep1cue315,
							output logic [3:0] code
							);
					
logic [16:0] oneint = 17'b00000000000000001;
logic [16:0] twoint = 17'b00000000000000010;
logic [16:0] threeint = 17'b00000000000000100;
logic [16:0] fourint = 17'b00000000000001000;
logic [16:0] fiveint = 17'b00000000000010000;
logic [16:0] sixint = 17'b00000000000100000;
logic [16:0] sevenint = 17'b00000000001000000;
logic [16:0] eightint = 17'b00000000010000000;
logic [16:0] nineint = 17'b00000000100000000;
logic [16:0] tenint = 17'b00000001000000000;
logic [16:0] elevenint = 17'b00000010000000000;
logic [16:0] twelveint = 17'b00000100000000000;
logic [16:0] thirteenint = 17'b00001000000000000;
logic [16:0] fourteenint = 17'b00010000000000000;
logic [16:0] fifteenint = 17'b00100000000000000;
logic [16:0] cueint = 17'b01000000000000000;
logic [16:0] stickint = 17'b10000000000000000;			
			
always_comb
begin
	if(select == 5'd1 && code1b != 4'b0000)
	begin
		code <= code1b;
	end
	else if(select == 5'd2 && code2b != 4'b0000)
	begin
		code <= code2b;
	end
	else if(select == 5'd3 && code3b != 4'b0000)
	begin
		code <= code3b;
	end
	else if(select == 5'd4 && code4b != 4'b0000)
	begin
		code <= code4b;
	end
	else if(select == 5'd5 && code5b != 4'b0000)
	begin
		code <= code5b;
	end
	else if(select == 5'd6 && code6b != 4'b0000)
	begin
		code <= code6b;
	end
	else if(select == 5'd7 && code7b != 4'b0000)
	begin
		code <= code7b;
	end
	else if(select == 5'd8 && code8b != 4'b0000)
	begin
		code <= code8b;
	end
	else if(select == 5'd9 && code9b != 4'b0000)
	begin
		code <= code9b;
	end
	else if(select == 5'd10 && code10b != 4'b0000)
	begin
		code <= code10b;
	end
	else if(select == 5'd11 && code11b != 4'b0000)
	begin
		code <= code11b;
	end
	else if(select == 5'd12 && code12b != 4'b0000)
	begin
		code <= code12b;
	end
	else if(select == 5'd13 && code13b != 4'b0000)
	begin
		code <= code13b;
	end
	else if(select == 5'd14 && code14b != 4'b0000)
	begin
		code <= code14b;
	end
	else if(select == 5'd15 && code15b != 4'b0000)
	begin
		code <= code15b;
	end
	else if(select == 5'd16 && codecue != 4'b0000)
	begin
		code <= codecue;
	end
	else if(select == 5'd17 && codep1cue != 4'b0000)
	begin
		code <= codep1cue;
	end
	else if(select == 5'd18 && codep1cue45 != 4'b0000)
	begin
		code <= codep1cue45;
	end
	else if(select == 5'd19 && codep1cue90 != 4'b0000)
	begin
		code <= codep1cue90;
	end
	else if(select == 5'd20 && codep1cue135 != 4'b0000)
	begin
		code <= codep1cue135;
	end
	else if(select == 5'd21 && codep1cue180 != 4'b0000)
	begin
		code <= codep1cue180;
	end
	else if(select == 5'd22 && codep1cue225 != 4'b0000)
	begin
		code <= codep1cue225;
	end
	else if(select == 5'd23 && codep1cue270 != 4'b0000)
	begin
		code <= codep1cue270;
	end
	else if(select == 5'd24 && codep1cue315 != 4'b0000)
	begin
		code <= codep1cue315;
	end
	else if((collision & oneint) && select != 5'd1 && code1b != 4'b0000)
	begin
			code = code1b;
	end
	else if((collision & twoint) && select != 5'd2 && code2b != 4'b0000)
	begin
			code = code2b;
	end
	else if((collision & threeint) && select != 5'd3 && code3b != 4'b0000)
	begin
			code = code3b;
	end
	else if((collision & fourint) && select != 5'd4 && code4b != 4'b0000)
	begin
			code = code4b;
	end
	else if((collision & fiveint) && select != 5'd5 && code5b != 4'b0000)
	begin
			code = code5b;
	end
	else if((collision & sixint) && select != 5'd6 && code6b != 4'b0000)
	begin
			code = code6b;
	end
	else if((collision & sevenint) && select != 5'd7 && code7b != 4'b0000)
	begin
			code = code7b;
	end
	else if((collision & eightint) && select != 5'd8 && code8b != 4'b0000)
	begin
			code = code8b;
	end
	else if((collision & nineint) && select != 5'd9 && code9b != 4'b0000)
	begin
			code = code9b;
	end
	else if((collision & tenint) && select != 5'd10 && code10b != 4'b0000)
	begin
			code = code10b;
	end
	else if((collision & elevenint) && select != 5'd11 && code11b != 4'b0000)
	begin
			code = code11b;
	end
	else if((collision & twelveint) && select != 5'd12 && code12b != 4'b0000)
	begin
			code = code12b;
	end
	else if((collision & thirteenint) && select != 5'd13 && code13b != 4'b0000)
	begin
			code = code13b;
	end
	else if((collision & fourteenint) && select != 5'd14 && code14b != 4'b0000)
	begin
			code = code14b;
	end
	else if((collision & fifteenint) && select != 5'd15 && code15b != 4'b0000)
	begin
			code = code15b;
	end
	else if((collision & cueint) && select != 5'd16 && codecue != 4'b0000)
	begin
			code = codecue;
	end
	else
	begin
		code <= codept;
	end
end


endmodule