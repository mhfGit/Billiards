module blitter(input logic clk,
					input logic reset,
					input logic run,
					input logic [9:0] oneballx,
					input logic [9:0] onebally,
					input logic [9:0] twoballx,
					input logic [9:0] twobally,
					input logic [9:0] threeballx,
					input logic [9:0] threebally,
					input logic [9:0] fourballx,
					input logic [9:0] fourbally,
					input logic [9:0] fiveballx,
					input logic [9:0] fivebally,
					input logic [9:0] sixballx,
					input logic [9:0] sixbally,
					input logic [9:0] sevenballx,
					input logic [9:0] sevenbally,
					input logic [9:0] eightballx,
					input logic [9:0] eightbally,
					input logic [9:0] nineballx,
					input logic [9:0] ninebally,
					input logic [9:0] tenballx,
					input logic [9:0] tenbally,
					input logic [9:0] elevenballx,
					input logic [9:0] elevenbally,
					input logic [9:0] twelveballx,
					input logic [9:0] twelvebally,
					input logic [9:0] thirteenballx,
					input logic [9:0] thirteenbally,
					input logic [9:0] fourteenballx,
					input logic [9:0] fourteenbally,
					input logic [9:0] fifteenballx,
					input logic [9:0] fifteenbally,
					input logic [9:0] cueballx,
					input logic [9:0] cuebally,
					input logic [9:0] p1cuex,
					input logic [9:0] p1cuey,
					input logic [9:0] curpixX,
					input logic [9:0] curpixY,
					input logic [2:0] direction,
					
					output logic to_sw_sig,
					output logic [4:0] select,
					output logic [15:0] addrp1cue,
					output logic [15:0] addrp1cue45,
					output logic [15:0] addrp1cue90,
					output logic [15:0] addrp1cue135,
					output logic [15:0] addrp1cue180,
					output logic [15:0] addrp1cue225,
					output logic [15:0] addrp1cue270,
					output logic [15:0] addrp1cue315,
					output logic [18:0] addrpt,
					output logic [7:0] addr1, 
					output logic [7:0] addr2,
					output logic [7:0] addr3,
					output logic [7:0] addr4, 
					output logic [7:0] addr5, 
					output logic [7:0] addr6, 
					output logic [7:0] addr7, 
					output logic [7:0] addr8, 
					output logic [7:0] addr9,
					output logic [7:0] addr10, 
					output logic [7:0] addr11, 
					output logic [7:0] addr12, 
					output logic [7:0] addr13, 
					output logic [7:0] addr14,
					output logic [7:0] addr15,
					output logic [7:0] addrcue,
					output logic [16:0] collision
					);

					
logic [3:0] ballDiameter = 4'd15;

logic [8:0] stickwidth1 = 9'd35;
logic [1:0] stickheight1 = 2'd3;
logic [7:0] stickwidth2 = 8'd35;
logic [7:0] stickheight2 = 8'd35;
logic [1:0] stickwidth3 = 2'd3;
logic [8:0] stickheight3 = 9'd50;

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
						
					
always_ff @(posedge clk or posedge reset)
begin
		if(reset)
		begin
			to_sw_sig <= 1'b0;
			addrpt <= 19'd0;
			addr1 <= 4'd0;
			addr2 <= 4'd0;
			addr3 <= 4'd0;
			addr4 <= 4'd0;
			addr5 <= 4'd0;
			addr6 <= 4'd0;
			addr7 <= 4'd0;
			addr8 <= 4'd0;
			addr9 <= 4'd0;
			addr10 <= 4'd0;
			addr11 <= 4'd0;
			addr12 <= 4'd0;
			addr13 <= 4'd0;
			addr14 <= 4'd0;
			addr15 <= 4'd0;
			addrcue <= 4'd0;
			addrp1cue <= 16'd0;
			addrp1cue45 <= 16'd0;
			addrp1cue90 <= 16'd0;
			addrp1cue135 <= 16'd0;
			addrp1cue180 <= 16'd0;
			addrp1cue225 <= 16'd0;
			addrp1cue270 <= 16'd0;
			addrp1cue315 <= 16'd0;
		end
		else if((curpixX >= p1cuex) & (curpixX < p1cuex + stickwidth1)  & (curpixY >= p1cuey) & (curpixY < p1cuey + stickheight1) && (direction == 4'd0)) // 0deg
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd17;
			addrp1cue <= addrp1cue + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX < cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally) && (cueballx && cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX < oneballx + ballDiameter) && (curpixX >=  oneballx) && (curpixY <  onebally + ballDiameter) && (curpixY >=  onebally) && (oneballx && onebally))
			begin
				collision <= collision | oneint;
				addr1 <= addr1 + 1'b1;
			end
			else if((curpixX < twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally) && (twoballx && twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX < threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally) && (threeballx && threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX < fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally) && (fourballx && fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX < fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally) && (fiveballx && fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX < sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally) && (sixballx && sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX < sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally) && (sevenballx && sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX < eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally) && (eightballx && eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX < nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally) && (nineballx && ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX < tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally) && (tenballx && tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX < elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally) && (elevenballx && elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX < twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally) && (twelveballx && twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX < thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally) && (thirteenballx && thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX < fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally) && (fourteenballx && fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX < fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally) && (fifteenballx && fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= p1cuex) & (curpixX < p1cuex + stickwidth2)  & (curpixY >= p1cuey) & (curpixY < p1cuey + stickheight2) & (direction == 4'd1)) // 45deg		
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd18;
			addrp1cue45 <= addrp1cue45 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX < cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally) && (cueballx && cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX < oneballx + ballDiameter) && (curpixX >=  oneballx) && (curpixY <  onebally + ballDiameter) && (curpixY >=  onebally) && (oneballx && onebally))
			begin
				collision <= collision | oneint;
				addr1 <= addr1 + 1'b1;
			end
			else if((curpixX < twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally) && (twoballx && twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX < threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally) && (threeballx && threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX < fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally) && (fourballx && fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX < fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally) && (fiveballx && fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX < sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally) && (sixballx && sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX < sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally) && (sevenballx && sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX < eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally) && (eightballx && eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX < nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally) && (nineballx && ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX < tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally) && (tenballx && tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX < elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally) && (elevenballx && elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX < twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally) && (twelveballx && twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX < thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally) && (thirteenballx && thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX < fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally) && (fourteenballx && fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX < fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally) && (fifteenballx && fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= p1cuex) & (curpixX < p1cuex + stickwidth3)  & (curpixY >= p1cuey) & (curpixY < p1cuey + stickheight3) & (direction == 4'd2)) // 90deg		
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd19;
			addrp1cue90 <= addrp1cue90 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX < cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally) && (cueballx && cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX < oneballx + ballDiameter) && (curpixX >=  oneballx) && (curpixY <  onebally + ballDiameter) && (curpixY >=  onebally) && (oneballx && onebally))
			begin
				collision <= collision | oneint;
				addr1 <= addr1 + 1'b1;
			end
			else if((curpixX < twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally) && (twoballx && twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX < threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally) && (threeballx && threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX < fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally) && (fourballx && fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX < fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally) && (fiveballx && fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX < sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally) && (sixballx && sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX < sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally) && (sevenballx && sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX < eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally) && (eightballx && eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX < nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally) && (nineballx && ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX < tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally) && (tenballx && tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX < elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally) && (elevenballx && elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX < twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally) && (twelveballx && twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX < thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally) && (thirteenballx && thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX < fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally) && (fourteenballx && fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX < fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally) && (fifteenballx && fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= p1cuex) & (curpixX < p1cuex + stickwidth2)  & (curpixY >= p1cuey) & (curpixY < p1cuey + stickheight2) & (direction == 4'd3)) // 135deg		
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd20;
			addrp1cue135 <= addrp1cue135 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX < cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally) && (cueballx && cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX < oneballx + ballDiameter) && (curpixX >=  oneballx) && (curpixY <  onebally + ballDiameter) && (curpixY >=  onebally) && (oneballx && onebally))
			begin
				collision <= collision | oneint;
				addr1 <= addr1 + 1'b1;
			end
			else if((curpixX < twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally) && (twoballx && twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX < threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally) && (threeballx && threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX < fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally) && (fourballx && fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX < fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally) && (fiveballx && fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX < sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally) && (sixballx && sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX < sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally) && (sevenballx && sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX < eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally) && (eightballx && eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX < nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally) && (nineballx && ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX < tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally) && (tenballx && tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX < elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally) && (elevenballx && elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX < twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally) && (twelveballx && twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX < thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally) && (thirteenballx && thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX < fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally) && (fourteenballx && fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX < fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally) && (fifteenballx && fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= p1cuex) & (curpixX < p1cuex + stickwidth1)  & (curpixY >= p1cuey) & (curpixY < p1cuey + stickheight1) & (direction == 4'd4)) // 180deg		
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd21;
			addrp1cue180 <= addrp1cue180 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX < cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally) && (cueballx && cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX < oneballx + ballDiameter) && (curpixX >=  oneballx) && (curpixY <  onebally + ballDiameter) && (curpixY >=  onebally) && (oneballx && onebally))
			begin
				collision <= collision | oneint;
				addr1 <= addr1 + 1'b1;
			end
			else if((curpixX < twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally) && (twoballx && twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX < threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally) && (threeballx && threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX < fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally) && (fourballx && fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX < fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally) && (fiveballx && fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX < sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally) && (sixballx && sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX < sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally) && (sevenballx && sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX < eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally) && (eightballx && eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX < nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally) && (nineballx && ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX < tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally) && (tenballx && tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX < elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally) && (elevenballx && elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX < twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally) && (twelveballx && twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX < thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally) && (thirteenballx && thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX < fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally) && (fourteenballx && fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX < fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally) && (fifteenballx && fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= p1cuex) & (curpixX < p1cuex + stickwidth2)  & (curpixY >= p1cuey) & (curpixY < p1cuey + stickheight2) & (direction == 4'd5)) // 225deg		
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd22;
			addrp1cue225 <= addrp1cue225 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX < cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally) && (cueballx && cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX < oneballx + ballDiameter) && (curpixX >=  oneballx) && (curpixY <  onebally + ballDiameter) && (curpixY >=  onebally) && (oneballx && onebally))
			begin
				collision <= collision | oneint;
				addr1 <= addr1 + 1'b1;
			end
			else if((curpixX < twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally) && (twoballx && twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX < threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally) && (threeballx && threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX < fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally) && (fourballx && fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX < fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally) && (fiveballx && fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX < sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally) && (sixballx && sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX < sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally) && (sevenballx && sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX < eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally) && (eightballx && eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX < nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally) && (nineballx && ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX < tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally) && (tenballx && tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX < elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally) && (elevenballx && elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX < twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally) && (twelveballx && twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX < thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally) && (thirteenballx && thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX < fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally) && (fourteenballx && fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX < fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally) && (fifteenballx && fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= p1cuex) & (curpixX < p1cuex + stickwidth3)  & (curpixY >= p1cuey) & (curpixY < p1cuey + stickheight3) & (direction == 4'd6)) // 270deg		
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd23;
			addrp1cue270 <= addrp1cue270 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX < cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally) && (cueballx && cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX < oneballx + ballDiameter) && (curpixX >=  oneballx) && (curpixY <  onebally + ballDiameter) && (curpixY >=  onebally) && (oneballx && onebally))
			begin
				collision <= collision | oneint;
				addr1 <= addr1 + 1'b1;
			end
			else if((curpixX < twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally) && (twoballx && twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX < threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally) && (threeballx && threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX < fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally) && (fourballx && fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX < fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally) && (fiveballx && fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX < sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally) && (sixballx && sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX < sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally) && (sevenballx && sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX < eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally) && (eightballx && eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX < nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally) && (nineballx && ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX < tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally) && (tenballx && tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX < elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally) && (elevenballx && elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX < twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally) && (twelveballx && twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX < thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally) && (thirteenballx && thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX < fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally) && (fourteenballx && fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX < fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally) && (fifteenballx && fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= p1cuex) & (curpixX < p1cuex + stickwidth2)  & (curpixY >= p1cuey) & (curpixY < p1cuey + stickheight2) & (direction == 4'd7)) // 315deg		
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd24;
			addrp1cue315 <= addrp1cue315 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX < cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally) && (cueballx && cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX < oneballx + ballDiameter) && (curpixX >=  oneballx) && (curpixY <  onebally + ballDiameter) && (curpixY >=  onebally) && (oneballx && onebally))
			begin
				collision <= collision | oneint;
				addr1 <= addr1 + 1'b1;
			end
			else if((curpixX < twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally) && (twoballx && twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX < threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally) && (threeballx && threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX < fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally) && (fourballx && fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX < fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally) && (fiveballx && fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX < sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally) && (sixballx && sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX < sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally) && (sevenballx && sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX < eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally) && (eightballx && eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX < nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally) && (nineballx && ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX < tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally) && (tenballx && tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX < elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally) && (elevenballx && elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX < twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally) && (twelveballx && twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX < thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally) && (thirteenballx && thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX < fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally) && (fourteenballx && fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX < fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally) && (fifteenballx && fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= oneballx) & (curpixX < oneballx + ballDiameter)  & (curpixY >= onebally) & (curpixY < onebally + ballDiameter) & (oneballx && onebally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd1;
			addr1 <= addr1 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  twoballx + ballDiameter) && (curpixX >=  twoballx) && (curpixY <  twobally + ballDiameter) && (curpixY >=  twobally))
			begin
				collision <= collision | twoint;
				addr2 <= addr2 + 1'b1;
			end
			else if((curpixX <  threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX <  fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX <  fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX <  sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX <  sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX <  eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX <  nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= twoballx) & (curpixX < twoballx + ballDiameter)  & (curpixY >= twobally) & (curpixY < twobally + ballDiameter) & (twoballx && twobally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd2;
			addr2 <= addr2 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  threeballx + ballDiameter) && (curpixX >=  threeballx) && (curpixY <  threebally + ballDiameter) && (curpixY >=  threebally))
			begin
				collision <= collision | threeint;
				addr3 <= addr3 + 1'b1;
			end
			else if((curpixX <  fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX <  fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX <  sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX <  sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX <  eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX <  nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= threeballx) & (curpixX < threeballx + ballDiameter)  & (curpixY >= threebally) & (curpixY < threebally + ballDiameter) & (threeballx && threebally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd3;
			addr3 <= addr3 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  fourballx + ballDiameter) && (curpixX >=  fourballx) && (curpixY <  fourbally + ballDiameter) && (curpixY >=  fourbally))
			begin
				collision <= collision | fourint;
				addr4 <= addr4 + 1'b1;
			end
			else if((curpixX <  fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX <  sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX <  sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX <  eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX <  nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= fourballx) & (curpixX < fourballx + ballDiameter)  & (curpixY >= fourbally) & (curpixY < fourbally + ballDiameter) & (fourballx && fourbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd4;
			addr4 <= addr4 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  fiveballx + ballDiameter) && (curpixX >=  fiveballx) && (curpixY <  fivebally + ballDiameter) && (curpixY >=  fivebally))
			begin
				collision <= collision | fiveint;
				addr5 <= addr5 + 1'b1;
			end
			else if((curpixX <  sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX <  sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX <  eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX <  nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= fiveballx) & (curpixX < fiveballx + ballDiameter)  & (curpixY >= fivebally) & (curpixY < fivebally + ballDiameter) & (fiveballx && fivebally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd5;
			addr5 <= addr5 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  sixballx + ballDiameter) && (curpixX >=  sixballx) && (curpixY <  sixbally + ballDiameter) && (curpixY >=  sixbally))
			begin
				collision <= collision | sixint;
				addr6 <= addr6 + 1'b1;
			end
			else if((curpixX <  sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX <  eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX <  nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= sixballx) & (curpixX < sixballx + ballDiameter)  & (curpixY >= sixbally) & (curpixY < sixbally + ballDiameter) & (sixballx && sixbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd6;
			addr6 <= addr6 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  sevenballx + ballDiameter) && (curpixX >=  sevenballx) && (curpixY <  sevenbally + ballDiameter) && (curpixY >=  sevenbally))
			begin
				collision <= collision | sevenint;
				addr7 <= addr7 + 1'b1;
			end
			else if((curpixX <  eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX <  nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= sevenballx) & (curpixX < sevenballx + ballDiameter)  & (curpixY >= sevenbally) & (curpixY < sevenbally + ballDiameter) & (sevenballx && sevenbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd7;
			addr7 <= addr7 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  eightballx + ballDiameter) && (curpixX >= eightballx) && (curpixY <  eightbally + ballDiameter) && (curpixY >=  eightbally))
			begin
				collision <= collision | eightint;
				addr8 <= addr8 + 1'b1;
			end
			else if((curpixX <  nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= eightballx) & (curpixX < eightballx + ballDiameter)  & (curpixY >= eightbally) & (curpixY < eightbally + ballDiameter) & (eightballx && eightbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd8;
			addr8 <= addr8 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  nineballx + ballDiameter) && (curpixX >=  nineballx) && (curpixY <  ninebally + ballDiameter) && (curpixY >=  ninebally))
			begin
				collision <= collision | nineint;
				addr9 <= addr9 + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= nineballx) & (curpixX < nineballx + ballDiameter)  & (curpixY >= ninebally) & (curpixY < ninebally + ballDiameter) & (nineballx && ninebally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd9;
			addr9 <= addr9 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  tenballx + ballDiameter) && (curpixX >=  tenballx) && (curpixY <  tenbally + ballDiameter) && (curpixY >=  tenbally))
			begin
				collision <= collision | tenint;
				addr10 <= addr10 + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= tenballx) & (curpixX < tenballx + ballDiameter)  & (curpixY >= tenbally) & (curpixY < tenbally + ballDiameter) & (tenballx && tenbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd10;
			addr10 <= addr10 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  elevenballx + ballDiameter) && (curpixX >=  elevenballx) && (curpixY <  elevenbally + ballDiameter) && (curpixY >=  elevenbally))
			begin
				collision <= collision | elevenint;
				addr11 <= addr11 + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= elevenballx) & (curpixX < elevenballx + ballDiameter)  & (curpixY >= elevenbally) & (curpixY < elevenbally + ballDiameter) & (elevenballx && elevenbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd11;
			addr11 <= addr11 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  twelveballx + ballDiameter) && (curpixX >=  twelveballx) && (curpixY <  twelvebally + ballDiameter) && (curpixY >=  twelvebally))
			begin
				collision <= collision | twelveint;
				addr12 <= addr12 + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= twelveballx) & (curpixX < twelveballx + ballDiameter)  & (curpixY >= twelvebally) & (curpixY < twelvebally + ballDiameter) & (twelveballx && twelvebally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd12;
			addr12 <= addr12 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  thirteenballx + ballDiameter) && (curpixX >=  thirteenballx) && (curpixY <  thirteenbally + ballDiameter) && (curpixY >=  thirteenbally))
			begin
				collision <= collision | thirteenint;
				addr13 <= addr13 + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= thirteenballx) & (curpixX < thirteenballx + ballDiameter)  & (curpixY >= thirteenbally) & (curpixY < thirteenbally + ballDiameter) & (thirteenballx && thirteenbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd13;
			addr13 <= addr13 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  fourteenballx + ballDiameter) && (curpixX >=  fourteenballx) && (curpixY <  fourteenbally + ballDiameter) && (curpixY >=  fourteenbally))
			begin
				collision <= collision | fourteenint;
				addr14 <= addr14 + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= fourteenballx) & (curpixX < fourteenballx + ballDiameter)  & (curpixY >= fourteenbally) & (curpixY < fourteenbally + ballDiameter) & (fourteenballx && fourteenbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd14;
			addr14 <= addr14 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else if((curpixX <  fifteenballx + ballDiameter) && (curpixX >=  fifteenballx) && (curpixY <  fifteenbally + ballDiameter) && (curpixY >=  fifteenbally))
			begin
				collision <= collision | fifteenint;
				addr15 <= addr15 + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= fifteenballx) & (curpixX < fifteenballx + ballDiameter)  & (curpixY >= fifteenbally) & (curpixY < fifteenbally + ballDiameter) & (fifteenballx && fifteenbally))
		begin
			to_sw_sig <= 1'b0;
			collision = 17'd0;
			select <= 5'd15;
			addr15 <= addr15 + 1'b1;
			addrpt <= addrpt + 1'b1;
			if((curpixX <  cueballx + ballDiameter) && (curpixX >=  cueballx) && (curpixY <  cuebally + ballDiameter) && (curpixY >=  cuebally))
			begin
				collision <= collision | cueint;
				addrcue <= addrcue + 1'b1;
			end
			else
			begin
				collision <= 17'd0;
			end
		end
		else if((curpixX >= cueballx) & (curpixX < cueballx + ballDiameter)  & (curpixY >= cuebally) & (curpixY < cuebally + ballDiameter) & (cueballx && cuebally))
		begin
			to_sw_sig <= 1'b0;
			select <= 5'd16;
			addrcue <= addrcue + 1'b1;
			addrpt <= addrpt + 1'b1;
			collision <= 17'd0;
		end
		else if(curpixY >= 10'd480)
		begin
			collision <= 17'd0;
			addrpt <= 19'd0;
			addr1 <= 4'd0;
			addr2 <= 4'd0;
			addr3 <= 4'd0;
			addr4 <= 4'd0;
			addr5 <= 4'd0;
			addr6 <= 4'd0;
			addr7 <= 4'd0;
			addr8 <= 4'd0;
			addr9 <= 4'd0;
			addr10 <= 4'd0;
			addr11 <= 4'd0;
			addr12 <= 4'd0;
			addr13 <= 4'd0;
			addr14 <= 4'd0;
			addr15 <= 4'd0;
			addrcue <= 4'd0;
			addrp1cue <= 16'd0;
			addrp1cue45 <= 16'd0;
			addrp1cue90 <= 16'd0;
			addrp1cue135 <= 16'd0;
			addrp1cue180 <= 16'd0;
			addrp1cue225 <= 16'd0;
			addrp1cue270 <= 16'd0;
			addrp1cue315 <= 16'd0;
			to_sw_sig <= 1'b1;
		end
		else if(curpixX >= 10'd640)
		begin
			to_sw_sig <= 1'b0;
			collision <= 17'd0;
			addrpt <= addrpt;
			addr1 <= addr1;
			addr2 <= addr2;
			addr3 <= addr3;
			addr4 <= addr4;
			addr5 <= addr5;
			addr6 <= addr6;
			addr7 <= addr7;
			addr8 <= addr8;
			addr9 <= addr9;
			addr10 <= addr10;
			addr11 <= addr11;
			addr12 <= addr12;
			addr13 <= addr13;
			addr14 <= addr14;
			addr15 <= addr15;
			addrcue <= addrcue;
			addrp1cue45 <= addrp1cue45;
			addrp1cue90 <= addrp1cue90;
			addrp1cue135 <= addrp1cue135;
			addrp1cue180 <= addrp1cue180;
			addrp1cue225 <= addrp1cue225;
			addrp1cue270 <= addrp1cue270;
			addrp1cue315 <= addrp1cue315;
		end
		else
		begin
			to_sw_sig <= 1'b0;
			collision <= 17'd0;
			select <= 5'b0000;	
			addrpt <= addrpt + 1'b1;	
		end
end



endmodule