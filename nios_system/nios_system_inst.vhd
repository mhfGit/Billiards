	component nios_system is
		port (
			clk_clk                : in    std_logic                     := 'X';             -- clk
			cueball_export         : out   std_logic_vector(19 downto 0);                    -- export
			eightball_export       : out   std_logic_vector(19 downto 0);                    -- export
			elevenball_export      : out   std_logic_vector(19 downto 0);                    -- export
			fifteenball_export     : out   std_logic_vector(19 downto 0);                    -- export
			fiveball_export        : out   std_logic_vector(19 downto 0);                    -- export
			fourball_export        : out   std_logic_vector(19 downto 0);                    -- export
			fourteenball_export    : out   std_logic_vector(19 downto 0);                    -- export
			keycode_export         : out   std_logic_vector(15 downto 0);                    -- export
			nineball_export        : out   std_logic_vector(19 downto 0);                    -- export
			oneball_export         : out   std_logic_vector(19 downto 0);                    -- export
			otg_hpi_address_export : out   std_logic_vector(1 downto 0);                     -- export
			otg_hpi_cs_export      : out   std_logic;                                        -- export
			otg_hpi_data_in_port   : in    std_logic_vector(15 downto 0) := (others => 'X'); -- in_port
			otg_hpi_data_out_port  : out   std_logic_vector(15 downto 0);                    -- out_port
			otg_hpi_r_export       : out   std_logic;                                        -- export
			otg_hpi_w_export       : out   std_logic;                                        -- export
			poolcue_export         : out   std_logic_vector(19 downto 0);                    -- export
			reset_reset_n          : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk          : out   std_logic;                                        -- clk
			sdram_wire_addr        : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba          : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n       : out   std_logic;                                        -- cas_n
			sdram_wire_cke         : out   std_logic;                                        -- cke
			sdram_wire_cs_n        : out   std_logic;                                        -- cs_n
			sdram_wire_dq          : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm         : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n       : out   std_logic;                                        -- ras_n
			sdram_wire_we_n        : out   std_logic;                                        -- we_n
			sevenball_export       : out   std_logic_vector(19 downto 0);                    -- export
			sixball_export         : out   std_logic_vector(19 downto 0);                    -- export
			tenball_export         : out   std_logic_vector(19 downto 0);                    -- export
			thirteenball_export    : out   std_logic_vector(19 downto 0);                    -- export
			threeball_export       : out   std_logic_vector(19 downto 0);                    -- export
			twelveball_export      : out   std_logic_vector(19 downto 0);                    -- export
			twoball_export         : out   std_logic_vector(19 downto 0);                    -- export
			sys_reset_export       : in    std_logic                     := 'X';             -- export
			hw_sig_export          : in    std_logic                     := 'X';             -- export
			stick_direction_export : out   std_logic_vector(2 downto 0)                      -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			cueball_export         => CONNECTED_TO_cueball_export,         --         cueball.export
			eightball_export       => CONNECTED_TO_eightball_export,       --       eightball.export
			elevenball_export      => CONNECTED_TO_elevenball_export,      --      elevenball.export
			fifteenball_export     => CONNECTED_TO_fifteenball_export,     --     fifteenball.export
			fiveball_export        => CONNECTED_TO_fiveball_export,        --        fiveball.export
			fourball_export        => CONNECTED_TO_fourball_export,        --        fourball.export
			fourteenball_export    => CONNECTED_TO_fourteenball_export,    --    fourteenball.export
			keycode_export         => CONNECTED_TO_keycode_export,         --         keycode.export
			nineball_export        => CONNECTED_TO_nineball_export,        --        nineball.export
			oneball_export         => CONNECTED_TO_oneball_export,         --         oneball.export
			otg_hpi_address_export => CONNECTED_TO_otg_hpi_address_export, -- otg_hpi_address.export
			otg_hpi_cs_export      => CONNECTED_TO_otg_hpi_cs_export,      --      otg_hpi_cs.export
			otg_hpi_data_in_port   => CONNECTED_TO_otg_hpi_data_in_port,   --    otg_hpi_data.in_port
			otg_hpi_data_out_port  => CONNECTED_TO_otg_hpi_data_out_port,  --                .out_port
			otg_hpi_r_export       => CONNECTED_TO_otg_hpi_r_export,       --       otg_hpi_r.export
			otg_hpi_w_export       => CONNECTED_TO_otg_hpi_w_export,       --       otg_hpi_w.export
			poolcue_export         => CONNECTED_TO_poolcue_export,         --         poolcue.export
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --           reset.reset_n
			sdram_clk_clk          => CONNECTED_TO_sdram_clk_clk,          --       sdram_clk.clk
			sdram_wire_addr        => CONNECTED_TO_sdram_wire_addr,        --      sdram_wire.addr
			sdram_wire_ba          => CONNECTED_TO_sdram_wire_ba,          --                .ba
			sdram_wire_cas_n       => CONNECTED_TO_sdram_wire_cas_n,       --                .cas_n
			sdram_wire_cke         => CONNECTED_TO_sdram_wire_cke,         --                .cke
			sdram_wire_cs_n        => CONNECTED_TO_sdram_wire_cs_n,        --                .cs_n
			sdram_wire_dq          => CONNECTED_TO_sdram_wire_dq,          --                .dq
			sdram_wire_dqm         => CONNECTED_TO_sdram_wire_dqm,         --                .dqm
			sdram_wire_ras_n       => CONNECTED_TO_sdram_wire_ras_n,       --                .ras_n
			sdram_wire_we_n        => CONNECTED_TO_sdram_wire_we_n,        --                .we_n
			sevenball_export       => CONNECTED_TO_sevenball_export,       --       sevenball.export
			sixball_export         => CONNECTED_TO_sixball_export,         --         sixball.export
			tenball_export         => CONNECTED_TO_tenball_export,         --         tenball.export
			thirteenball_export    => CONNECTED_TO_thirteenball_export,    --    thirteenball.export
			threeball_export       => CONNECTED_TO_threeball_export,       --       threeball.export
			twelveball_export      => CONNECTED_TO_twelveball_export,      --      twelveball.export
			twoball_export         => CONNECTED_TO_twoball_export,         --         twoball.export
			sys_reset_export       => CONNECTED_TO_sys_reset_export,       --       sys_reset.export
			hw_sig_export          => CONNECTED_TO_hw_sig_export,          --          hw_sig.export
			stick_direction_export => CONNECTED_TO_stick_direction_export  -- stick_direction.export
		);

