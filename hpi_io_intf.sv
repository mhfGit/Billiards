	 module hpi_io_intf( input logic [1:0]  from_sw_address,
								output logic[15:0] from_sw_data_in,
								input logic[15:0] from_sw_data_out,
								input	logic	 	 from_sw_r,
								input logic from_sw_w,
								input logic from_sw_cs,
								inout [15:0] OTG_DATA,    
								output logic [1:0]	 OTG_ADDR,    
								output logic 	 OTG_RD_N, 
								output logic OTG_WR_N, 
								output logic OTG_CS_N, 
								output logic OTG_RST_N, 
								input  logic		 OTG_INT, 
								input logic Clk, 
								input logic Reset);
								
logic [15:0] tmp_data;
logic from_sw_int; 

//Fill in the blanks below. 
assign OTG_RST_N = ~Reset;
assign OTG_DATA = from_sw_w ? 16'bz: tmp_data;

always_ff @ (posedge Clk or posedge Reset)
begin
	if(Reset)
	begin
		tmp_data 		<= OTG_DATA;
		OTG_ADDR 		<=	2'b0;
		OTG_RD_N 		<= 1'b1;
		OTG_WR_N 		<= 1'b1;
		OTG_CS_N 		<= 1'b1;
		from_sw_data_in<= 16'b0;
		from_sw_int 	<= 1'b0;
	end
	else 
	begin
		tmp_data 		<= from_sw_data_out;
		OTG_ADDR 		<= from_sw_address;
		OTG_RD_N			<= from_sw_r;
		OTG_WR_N			<= from_sw_w;
		OTG_CS_N			<= from_sw_cs;
		from_sw_data_in<= OTG_DATA;
		from_sw_int 	<= OTG_INT;
	end
end
endmodule 