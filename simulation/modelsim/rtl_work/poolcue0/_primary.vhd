library verilog;
use verilog.vl_types.all;
entity poolcue0 is
    port(
        address         : in     vl_logic_vector(6 downto 0);
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(3 downto 0)
    );
end poolcue0;
