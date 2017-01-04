library verilog;
use verilog.vl_types.all;
entity nios_system_sdram_pll_stdsync_sv6 is
    port(
        clk             : in     vl_logic;
        din             : in     vl_logic;
        dout            : out    vl_logic;
        reset_n         : in     vl_logic
    );
end nios_system_sdram_pll_stdsync_sv6;
