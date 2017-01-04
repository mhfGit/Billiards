library verilog;
use verilog.vl_types.all;
entity palette is
    port(
        code            : in     vl_logic_vector(3 downto 0);
        red             : out    vl_logic_vector(7 downto 0);
        green           : out    vl_logic_vector(7 downto 0);
        blue            : out    vl_logic_vector(7 downto 0)
    );
end palette;
