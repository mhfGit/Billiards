
module nios_system (
	clk_clk,
	cueball_export,
	eightball_export,
	elevenball_export,
	fifteenball_export,
	fiveball_export,
	fourball_export,
	fourteenball_export,
	keycode_export,
	nineball_export,
	oneball_export,
	otg_hpi_address_export,
	otg_hpi_cs_export,
	otg_hpi_data_in_port,
	otg_hpi_data_out_port,
	otg_hpi_r_export,
	otg_hpi_w_export,
	poolcue_export,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	sevenball_export,
	sixball_export,
	tenball_export,
	thirteenball_export,
	threeball_export,
	twelveball_export,
	twoball_export,
	sys_reset_export,
	hw_sig_export,
	stick_direction_export);	

	input		clk_clk;
	output	[19:0]	cueball_export;
	output	[19:0]	eightball_export;
	output	[19:0]	elevenball_export;
	output	[19:0]	fifteenball_export;
	output	[19:0]	fiveball_export;
	output	[19:0]	fourball_export;
	output	[19:0]	fourteenball_export;
	output	[15:0]	keycode_export;
	output	[19:0]	nineball_export;
	output	[19:0]	oneball_export;
	output	[1:0]	otg_hpi_address_export;
	output		otg_hpi_cs_export;
	input	[15:0]	otg_hpi_data_in_port;
	output	[15:0]	otg_hpi_data_out_port;
	output		otg_hpi_r_export;
	output		otg_hpi_w_export;
	output	[19:0]	poolcue_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output	[19:0]	sevenball_export;
	output	[19:0]	sixball_export;
	output	[19:0]	tenball_export;
	output	[19:0]	thirteenball_export;
	output	[19:0]	threeball_export;
	output	[19:0]	twelveball_export;
	output	[19:0]	twoball_export;
	input		sys_reset_export;
	input		hw_sig_export;
	output	[2:0]	stick_direction_export;
endmodule
