library verilog;
use verilog.vl_types.all;
entity pooltableROM is
    port(
        address         : in     vl_logic_vector(18 downto 0);
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(3 downto 0)
    );
end pooltableROM;