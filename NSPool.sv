module NSPool(input logic  CLOCK_50, // 50MHz main clock
				  input logic [3:0]    KEY, // 0 - reset, 1 - run
				  output logic[6:0]  HEX0, 
				  output logic[6:0]  HEX1, 
				  output logic[6:0]  HEX2, 
				  output logic[6:0]  HEX3, 
				  output logic[6:0]  HEX4, // testing
				  // VGA Interface 
              output logic[7:0]  VGA_R,				//VGA Red
				  output logic[7:0]  VGA_G,				//VGA Green
				  output logic[7:0]  VGA_B,				//VGA Blue
				  output logic       VGA_CLK,			//VGA Clock
				  output	logic       VGA_SYNC_N,		//VGA Sync signal
				  output	logic		 VGA_BLANK_N,		//VGA Blank signal
				  output	logic		 VGA_VS,				//VGA vertical sync signal	
				  output	logic		 VGA_HS				//VGA horizontal sync signal		
				  // CY7C67200 Interface
				 // inout [15:0]  OTG_DATA,						//	CY7C67200 Data bus 16 Bits
				 // output logic[1:0]  OTG_ADDR,						//	CY7C67200 Address 2 Bits
				 // output logic       OTG_CS_N,						//	CY7C67200 Chip Select
				 // output	logic		 OTG_RD_N,						//	CY7C67200 Write
				 // output	logic		 OTG_WR_N,						//	CY7C67200 Read
				//  output	logic		 OTG_RST_N,						//	CY7C67200 Reset
				 // input	logic		 OTG_INT,						//	CY7C67200 Interrupt
				  // SDRAM Interface for Nios II Software
				 // output logic[12:0] DRAM_ADDR,				// SDRAM Address 13 Bits
				//  inout [31:0]  DRAM_DQ,				// SDRAM Data 32 Bits
				//  output logic[1:0]  DRAM_BA,				// SDRAM Bank Address 2 Bits
				//  output logic[3:0]  DRAM_DQM,				// SDRAM Data Mast 4 Bits
				//  output	logic		 DRAM_RAS_N,			// SDRAM Row Address Strobe
				//  output	logic		 DRAM_CAS_N,			// SDRAM Column Address Strobe
				//  output		logic	 DRAM_CKE,				// SDRAM Clock Enable
				//  output		logic	 DRAM_WE_N,				// SDRAM Write Enable
				//  output	logic		 DRAM_CS_N,				// SDRAM Chip Select
				//  output	logic		 DRAM_CLK				// SDRAM Clock
					);
					
logic reset_h;
logic run_h;

assign clk = CLOCK_50;
assign {reset_h} = ~ (KEY[0]);  // The push buttons are active low
assign {run_h} = ~ (KEY[1]);

logic [7:0] addr1, addr2, addr3, addr4, addr5, addr6, addr7, addr8, addr9, addr10, addr11, addr12, addr13, addr14, addr15, addrcue;
logic [15:0] addrp1cue, addrp1cue45, addrp1cue90, addrp1cue135, addrp1cue180, addrp1cue225, addrp1cue270, addrp1cue315;
logic [18:0] addrpt;

logic [3:0] code, codept, code1b, code2b, code3b, code4b, code5b, code6b, code7b, code8b, code9b, code10b, code11b, 
code12b, code13b, code14b, code15b, codecue, codep1cue, codep1cue45, codep1cue90, codep1cue135, codep1cue180, codep1cue225, codep1cue270, codep1cue315;
logic [4:0] select;

logic [9:0] drawysig;
logic [9:0] drawxsig;

logic [16:0] collision;

//Keyboard variables
//wire [1:0] hpi_addr;		
//wire [15:0] hpi_data_in, hpi_data_out;
//wire hpi_r, hpi_w,hpi_cs;
logic [15:0] keycode;

logic [19:0] Oneball, Twoball, Threeball, Fourball, Fiveball, Sixball, Sevenball;
logic [19:0] Eightball, Nineball, Tenball, Elevenball, Twelveball, Thirteenball;
logic [19:0] Fourteenball, Fifteenball, Cueball, Poolcue;
logic hw_sig;
logic [2:0] direction;
/*
nios_system nios_system(
						 .clk_clk(clk),         
						 .reset_reset_n(KEY[0]),   
						 .sdram_wire_addr(DRAM_ADDR), 
						 .sdram_wire_ba(DRAM_BA),   
						 .sdram_wire_cas_n(DRAM_CAS_N),
						 .sdram_wire_cke(DRAM_CKE),  
						 .sdram_wire_cs_n(DRAM_CS_N), 
						 .sdram_wire_dq(DRAM_DQ),   
						 .sdram_wire_dqm(DRAM_DQM),  
						 .sdram_wire_ras_n(DRAM_RAS_N),
						 .sdram_wire_we_n(DRAM_WE_N), 
						 .sdram_clk_clk(DRAM_CLK),
						 .keycode_export(keycode),  
						 .otg_hpi_address_export(hpi_addr),
						 .otg_hpi_data_in_port(hpi_data_in),
						 .otg_hpi_data_out_port(hpi_data_out),
						 .otg_hpi_cs_export(hpi_cs),
						 .otg_hpi_r_export(hpi_r),
						 .otg_hpi_w_export(hpi_w),
						 .oneball_export(Oneball),
						 .twoball_export(Twoball),
						 .threeball_export(Threeball),
						 .fourball_export(Fourball),
						 .fiveball_export(Fiveball),
						 .sixball_export(Sixball),
						 .sevenball_export(Sevenball),
						 .eightball_export(Eightball),
						 .nineball_export(Nineball),
						 .tenball_export(Tenball),
						 .elevenball_export(Elevenball),
						 .twelveball_export(Twelveball),
						 .thirteenball_export(Thirteenball),
						 .fourteenball_export(Fourteenball),
						 .fifteenball_export(Fifteenball),
						 .cueball_export(Cueball),
						 .poolcue_export(Poolcue),
						 .sys_reset_export(reset_h),
						 .hw_sig_export(hw_sig),
						 .stick_direction_export(direction)
					);
			*/
			/*
hpi_io_intf hpi_io_inst(    
						.from_sw_address(hpi_addr),
						.from_sw_data_in(hpi_data_in),
						.from_sw_data_out(hpi_data_out),
						.from_sw_r(hpi_r),
						.from_sw_w(hpi_w),
						.from_sw_cs(hpi_cs),
						.OTG_DATA(OTG_DATA),    
						.OTG_ADDR(OTG_ADDR),    
						.OTG_RD_N(OTG_RD_N),    
						.OTG_WR_N(OTG_WR_N),    
						.OTG_CS_N(OTG_CS_N),    
						.OTG_RST_N(OTG_RST_N),   
						.OTG_INT(OTG_INT),
						.Clk(clk),
						.Reset(reset_h)
			);*/

blitter blit(
					.clk(VGA_CLK),
					.reset(reset_h),
					.run(run_h),
					.oneballx(10'h001),
					.onebally(10'h000),
					.twoballx(10'hFFF),
					.twobally(10'hFFF),
					.threeballx(10'hFFF),
					.threebally(10'hFFF),
					.fourballx(10'hFFF),
					.fourbally(10'hFFF),
					.fiveballx(10'hFFF),
					.fivebally(10'hFFF),
					.sixballx(10'hFFF),
					.sixbally(10'hFFF),
					.sevenballx(10'hFFF),
					.sevenbally(10'hFFF),
					.eightballx(10'hFFF),
					.eightbally(10'hFFF),
					.nineballx(10'hFFF),
					.ninebally(10'hFFF),
					.tenballx(10'hFFF),
					.tenbally(10'hFFF),
					.elevenballx(10'hFFF),
					.elevenbally(10'hFFF),
					.twelveballx(10'hFFF),
					.twelvebally(10'hFFF),
					.thirteenballx(10'hFFF),
					.thirteenbally(10'hFFF),
					.fourteenballx(10'hFFF),
					.fourteenbally(10'hFFF),
					.fifteenballx(10'hFFF),
					.fifteenbally(10'hFFF),
					.cueballx(10'hFFF),
					.cuebally(10'hFFF),
					.p1cuex(10'hFFF),
					.p1cuey(10'hFFF),
					.curpixX(drawxsig),
					.curpixY(drawysig),
					.direction(direction),
					.to_sw_sig(hw_sig),
					.select(select),
					.addr1(addr1), 
					.addr2(addr2), 
					.addr3(addr3), 
					.addr4(addr4), 
					.addr5(addr5), 
					.addr6(addr6), 
					.addr7(addr7), 
					.addr8(addr8), 
					.addr9(addr9), 
					.addr10(addr10), 
					.addr11(addr11), 
					.addr12(addr12), 
					.addr13(addr13), 
					.addr14(addr14),
					.addr15(addr15), 
					.addrcue(addrcue),
					.addrp1cue(addrp1cue),
					.collision(collision),
					.addrpt(addrpt),
					.addrp1cue45(addrp1cue45),
					.addrp1cue90(addrp1cue90),
					.addrp1cue135(addrp1cue135),
					.addrp1cue180(addrp1cue180),
					.addrp1cue225(addrp1cue225),
					.addrp1cue270(addrp1cue270),
					.addrp1cue315(addrp1cue315)
				);


vga_controller2 vga(
							.Clk(clk),       
                     .Reset(reset_h),     
							.hs(VGA_HS), 
							.vs(VGA_VS), 
							.pixel_clk(VGA_CLK),
							.blank(VGA_BLANK_N),  
							.sync(VGA_SYNC_N),       
							.DrawX(drawxsig),     
							.DrawY(drawysig)
						);
					
					
pooltableROM pt(
							.address(addrpt),
							.clock(clk),
							.q(codept)							
						);		
							

oneballROM oneball(
							.address(addr1),
							.clock(clk),
							.q(code1b)
						);		

twoballROM twoball(
							.address(addr2),
							.clock(clk),
							.q(code2b)
						);

threeballROM threeball(
							.address(addr3),
							.clock(clk),
							.q(code3b)
						);
						
fourballROM fourball(
							.address(addr4),
							.clock(clk),
							.q(code4b)
						);

fiveballROM fiveball(
							.address(addr5),
							.clock(clk),
							.q(code5b)
						);

sixballROM sixball(
							.address(addr6),
							.clock(clk),
							.q(code6b)
						);

sevenballROM sevenball(
							.address(addr7),
							.clock(clk),
							.q(code7b)
						);

eightballROM eightball(
							.address(addr8),
							.clock(clk),
							.q(code8b)
						);

nineballROM nineball(
							.address(addr9),
							.clock(clk),
							.q(code9b)
						);

tenballROM tenball(
							.address(addr10),
							.clock(clk),
							.q(code10b)
						);

elevenballROM elevenball(
							.address(addr11),
							.clock(clk),
							.q(code11b)
						);

twelveballROM twelveball(
							.address(addr12),
							.clock(clk),
							.q(code12b)
						);

thirteenballROM thirteenball(
							.address(addr13),
							.clock(clk),
							.q(code13b)
						);

fourteenballROM fourteenball(
							.address(addr14),
							.clock(clk),
							.q(code14b)
						);

fifteenballROM fifteenball(
							.address(addr15),
							.clock(clk),
							.q(code15b)
						);

cueballROM cueball(
							.address(addrcue),
							.clock(clk),
							.q(codecue)
						);		
		
poolcue0 mpoolcue0(
							.address(addrp1cue[11:0]),
							.clock(clk),
							.q(codep1cue)
						);	
						
poolcue45 mpoolcue45(
							.address(addrp1cue45),
							.clock(clk),
							.q(codep1cue45)
						);	
						
poolcue90 mpoolcue90(
							.address(addrp1cue90[11:0]),
							.clock(clk),
							.q(codep1cue90)
						);	
						
poolcue135 mpoolcue135(
							.address(addrp1cue135),
							.clock(clk),
							.q(codep1cue135)
						);	
						
poolcue180 mpoolcue180(
							.address(addrp1cue180[11:0]),
							.clock(clk),
							.q(codep1cue180)
						);	
						
poolcue225 mpoolcue225(
							.address(addrp1cue225),
							.clock(clk),
							.q(codep1cue225)
						);	
						
poolcue270 mpoolcue270(
							.address(addrp1cue270[11:0]),
							.clock(clk),
							.q(codep1cue270)
						);	
						
poolcue315 mpoolcue315(
							.address(addrp1cue315),
							.clock(clk),
							.q(codep1cue315)
						);															
					
palette pal(
					.code(code),
					.red(VGA_R),
					.green(VGA_G),
					.blue(VGA_B)
				);	
				
spriteChooser choose(
								.*
							);

HexDriver hex_inst_0 (keycode[3:0], HEX0);
HexDriver hex_inst_1 (keycode[7:4], HEX1);
//HexDriver hex_inst_2 (test3[3:0], HEX2);
//HexDriver hex_inst_3 (test4[3:0], HEX3);
//HexDriver hex_inst_4 (test5[3:0], HEX4);

				
endmodule