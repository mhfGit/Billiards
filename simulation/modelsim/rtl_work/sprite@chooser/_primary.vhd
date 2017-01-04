library verilog;
use verilog.vl_types.all;
entity spriteChooser is
    port(
        \select\        : in     vl_logic_vector(4 downto 0);
        collision       : in     vl_logic_vector(16 downto 0);
        codept          : in     vl_logic_vector(3 downto 0);
        code1b          : in     vl_logic_vector(3 downto 0);
        code2b          : in     vl_logic_vector(3 downto 0);
        code3b          : in     vl_logic_vector(3 downto 0);
        code4b          : in     vl_logic_vector(3 downto 0);
        code5b          : in     vl_logic_vector(3 downto 0);
        code6b          : in     vl_logic_vector(3 downto 0);
        code7b          : in     vl_logic_vector(3 downto 0);
        code8b          : in     vl_logic_vector(3 downto 0);
        code9b          : in     vl_logic_vector(3 downto 0);
        code10b         : in     vl_logic_vector(3 downto 0);
        code11b         : in     vl_logic_vector(3 downto 0);
        code12b         : in     vl_logic_vector(3 downto 0);
        code13b         : in     vl_logic_vector(3 downto 0);
        code14b         : in     vl_logic_vector(3 downto 0);
        code15b         : in     vl_logic_vector(3 downto 0);
        codecue         : in     vl_logic_vector(3 downto 0);
        codep1cue       : in     vl_logic_vector(3 downto 0);
        codep1cue45     : in     vl_logic_vector(3 downto 0);
        codep1cue90     : in     vl_logic_vector(3 downto 0);
        codep1cue135    : in     vl_logic_vector(3 downto 0);
        codep1cue180    : in     vl_logic_vector(3 downto 0);
        codep1cue225    : in     vl_logic_vector(3 downto 0);
        codep1cue270    : in     vl_logic_vector(3 downto 0);
        codep1cue315    : in     vl_logic_vector(3 downto 0);
        code            : out    vl_logic_vector(3 downto 0)
    );
end spriteChooser;
