library verilog;
use verilog.vl_types.all;
entity NSPool is
    port(
        CLOCK_50        : in     vl_logic;
        KEY             : in     vl_logic_vector(3 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        VGA_R           : out    vl_logic_vector(7 downto 0);
        VGA_G           : out    vl_logic_vector(7 downto 0);
        VGA_B           : out    vl_logic_vector(7 downto 0);
        VGA_CLK         : out    vl_logic;
        VGA_SYNC_N      : out    vl_logic;
        VGA_BLANK_N     : out    vl_logic;
        VGA_VS          : out    vl_logic;
        VGA_HS          : out    vl_logic
    );
end NSPool;
