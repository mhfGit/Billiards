library verilog;
use verilog.vl_types.all;
entity nios_system_mm_interconnect_0_cmd_demux is
    port(
        sink_valid      : in     vl_logic_vector(0 downto 0);
        sink_data       : in     vl_logic_vector(108 downto 0);
        sink_channel    : in     vl_logic_vector(31 downto 0);
        sink_startofpacket: in     vl_logic;
        sink_endofpacket: in     vl_logic;
        sink_ready      : out    vl_logic;
        src0_valid      : out    vl_logic;
        src0_data       : out    vl_logic_vector(108 downto 0);
        src0_channel    : out    vl_logic_vector(31 downto 0);
        src0_startofpacket: out    vl_logic;
        src0_endofpacket: out    vl_logic;
        src0_ready      : in     vl_logic;
        src1_valid      : out    vl_logic;
        src1_data       : out    vl_logic_vector(108 downto 0);
        src1_channel    : out    vl_logic_vector(31 downto 0);
        src1_startofpacket: out    vl_logic;
        src1_endofpacket: out    vl_logic;
        src1_ready      : in     vl_logic;
        src2_valid      : out    vl_logic;
        src2_data       : out    vl_logic_vector(108 downto 0);
        src2_channel    : out    vl_logic_vector(31 downto 0);
        src2_startofpacket: out    vl_logic;
        src2_endofpacket: out    vl_logic;
        src2_ready      : in     vl_logic;
        src3_valid      : out    vl_logic;
        src3_data       : out    vl_logic_vector(108 downto 0);
        src3_channel    : out    vl_logic_vector(31 downto 0);
        src3_startofpacket: out    vl_logic;
        src3_endofpacket: out    vl_logic;
        src3_ready      : in     vl_logic;
        src4_valid      : out    vl_logic;
        src4_data       : out    vl_logic_vector(108 downto 0);
        src4_channel    : out    vl_logic_vector(31 downto 0);
        src4_startofpacket: out    vl_logic;
        src4_endofpacket: out    vl_logic;
        src4_ready      : in     vl_logic;
        src5_valid      : out    vl_logic;
        src5_data       : out    vl_logic_vector(108 downto 0);
        src5_channel    : out    vl_logic_vector(31 downto 0);
        src5_startofpacket: out    vl_logic;
        src5_endofpacket: out    vl_logic;
        src5_ready      : in     vl_logic;
        src6_valid      : out    vl_logic;
        src6_data       : out    vl_logic_vector(108 downto 0);
        src6_channel    : out    vl_logic_vector(31 downto 0);
        src6_startofpacket: out    vl_logic;
        src6_endofpacket: out    vl_logic;
        src6_ready      : in     vl_logic;
        src7_valid      : out    vl_logic;
        src7_data       : out    vl_logic_vector(108 downto 0);
        src7_channel    : out    vl_logic_vector(31 downto 0);
        src7_startofpacket: out    vl_logic;
        src7_endofpacket: out    vl_logic;
        src7_ready      : in     vl_logic;
        src8_valid      : out    vl_logic;
        src8_data       : out    vl_logic_vector(108 downto 0);
        src8_channel    : out    vl_logic_vector(31 downto 0);
        src8_startofpacket: out    vl_logic;
        src8_endofpacket: out    vl_logic;
        src8_ready      : in     vl_logic;
        src9_valid      : out    vl_logic;
        src9_data       : out    vl_logic_vector(108 downto 0);
        src9_channel    : out    vl_logic_vector(31 downto 0);
        src9_startofpacket: out    vl_logic;
        src9_endofpacket: out    vl_logic;
        src9_ready      : in     vl_logic;
        src10_valid     : out    vl_logic;
        src10_data      : out    vl_logic_vector(108 downto 0);
        src10_channel   : out    vl_logic_vector(31 downto 0);
        src10_startofpacket: out    vl_logic;
        src10_endofpacket: out    vl_logic;
        src10_ready     : in     vl_logic;
        src11_valid     : out    vl_logic;
        src11_data      : out    vl_logic_vector(108 downto 0);
        src11_channel   : out    vl_logic_vector(31 downto 0);
        src11_startofpacket: out    vl_logic;
        src11_endofpacket: out    vl_logic;
        src11_ready     : in     vl_logic;
        src12_valid     : out    vl_logic;
        src12_data      : out    vl_logic_vector(108 downto 0);
        src12_channel   : out    vl_logic_vector(31 downto 0);
        src12_startofpacket: out    vl_logic;
        src12_endofpacket: out    vl_logic;
        src12_ready     : in     vl_logic;
        src13_valid     : out    vl_logic;
        src13_data      : out    vl_logic_vector(108 downto 0);
        src13_channel   : out    vl_logic_vector(31 downto 0);
        src13_startofpacket: out    vl_logic;
        src13_endofpacket: out    vl_logic;
        src13_ready     : in     vl_logic;
        src14_valid     : out    vl_logic;
        src14_data      : out    vl_logic_vector(108 downto 0);
        src14_channel   : out    vl_logic_vector(31 downto 0);
        src14_startofpacket: out    vl_logic;
        src14_endofpacket: out    vl_logic;
        src14_ready     : in     vl_logic;
        src15_valid     : out    vl_logic;
        src15_data      : out    vl_logic_vector(108 downto 0);
        src15_channel   : out    vl_logic_vector(31 downto 0);
        src15_startofpacket: out    vl_logic;
        src15_endofpacket: out    vl_logic;
        src15_ready     : in     vl_logic;
        src16_valid     : out    vl_logic;
        src16_data      : out    vl_logic_vector(108 downto 0);
        src16_channel   : out    vl_logic_vector(31 downto 0);
        src16_startofpacket: out    vl_logic;
        src16_endofpacket: out    vl_logic;
        src16_ready     : in     vl_logic;
        src17_valid     : out    vl_logic;
        src17_data      : out    vl_logic_vector(108 downto 0);
        src17_channel   : out    vl_logic_vector(31 downto 0);
        src17_startofpacket: out    vl_logic;
        src17_endofpacket: out    vl_logic;
        src17_ready     : in     vl_logic;
        src18_valid     : out    vl_logic;
        src18_data      : out    vl_logic_vector(108 downto 0);
        src18_channel   : out    vl_logic_vector(31 downto 0);
        src18_startofpacket: out    vl_logic;
        src18_endofpacket: out    vl_logic;
        src18_ready     : in     vl_logic;
        src19_valid     : out    vl_logic;
        src19_data      : out    vl_logic_vector(108 downto 0);
        src19_channel   : out    vl_logic_vector(31 downto 0);
        src19_startofpacket: out    vl_logic;
        src19_endofpacket: out    vl_logic;
        src19_ready     : in     vl_logic;
        src20_valid     : out    vl_logic;
        src20_data      : out    vl_logic_vector(108 downto 0);
        src20_channel   : out    vl_logic_vector(31 downto 0);
        src20_startofpacket: out    vl_logic;
        src20_endofpacket: out    vl_logic;
        src20_ready     : in     vl_logic;
        src21_valid     : out    vl_logic;
        src21_data      : out    vl_logic_vector(108 downto 0);
        src21_channel   : out    vl_logic_vector(31 downto 0);
        src21_startofpacket: out    vl_logic;
        src21_endofpacket: out    vl_logic;
        src21_ready     : in     vl_logic;
        src22_valid     : out    vl_logic;
        src22_data      : out    vl_logic_vector(108 downto 0);
        src22_channel   : out    vl_logic_vector(31 downto 0);
        src22_startofpacket: out    vl_logic;
        src22_endofpacket: out    vl_logic;
        src22_ready     : in     vl_logic;
        src23_valid     : out    vl_logic;
        src23_data      : out    vl_logic_vector(108 downto 0);
        src23_channel   : out    vl_logic_vector(31 downto 0);
        src23_startofpacket: out    vl_logic;
        src23_endofpacket: out    vl_logic;
        src23_ready     : in     vl_logic;
        src24_valid     : out    vl_logic;
        src24_data      : out    vl_logic_vector(108 downto 0);
        src24_channel   : out    vl_logic_vector(31 downto 0);
        src24_startofpacket: out    vl_logic;
        src24_endofpacket: out    vl_logic;
        src24_ready     : in     vl_logic;
        src25_valid     : out    vl_logic;
        src25_data      : out    vl_logic_vector(108 downto 0);
        src25_channel   : out    vl_logic_vector(31 downto 0);
        src25_startofpacket: out    vl_logic;
        src25_endofpacket: out    vl_logic;
        src25_ready     : in     vl_logic;
        src26_valid     : out    vl_logic;
        src26_data      : out    vl_logic_vector(108 downto 0);
        src26_channel   : out    vl_logic_vector(31 downto 0);
        src26_startofpacket: out    vl_logic;
        src26_endofpacket: out    vl_logic;
        src26_ready     : in     vl_logic;
        src27_valid     : out    vl_logic;
        src27_data      : out    vl_logic_vector(108 downto 0);
        src27_channel   : out    vl_logic_vector(31 downto 0);
        src27_startofpacket: out    vl_logic;
        src27_endofpacket: out    vl_logic;
        src27_ready     : in     vl_logic;
        src28_valid     : out    vl_logic;
        src28_data      : out    vl_logic_vector(108 downto 0);
        src28_channel   : out    vl_logic_vector(31 downto 0);
        src28_startofpacket: out    vl_logic;
        src28_endofpacket: out    vl_logic;
        src28_ready     : in     vl_logic;
        src29_valid     : out    vl_logic;
        src29_data      : out    vl_logic_vector(108 downto 0);
        src29_channel   : out    vl_logic_vector(31 downto 0);
        src29_startofpacket: out    vl_logic;
        src29_endofpacket: out    vl_logic;
        src29_ready     : in     vl_logic;
        src30_valid     : out    vl_logic;
        src30_data      : out    vl_logic_vector(108 downto 0);
        src30_channel   : out    vl_logic_vector(31 downto 0);
        src30_startofpacket: out    vl_logic;
        src30_endofpacket: out    vl_logic;
        src30_ready     : in     vl_logic;
        src31_valid     : out    vl_logic;
        src31_data      : out    vl_logic_vector(108 downto 0);
        src31_channel   : out    vl_logic_vector(31 downto 0);
        src31_startofpacket: out    vl_logic;
        src31_endofpacket: out    vl_logic;
        src31_ready     : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end nios_system_mm_interconnect_0_cmd_demux;