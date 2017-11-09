----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:22:39 06/25/2013 
-- Design Name: 
-- Module Name:    RCI_write - RCI_write_Behav 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;   

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RCI_Module is
    Port ( 
				-------------------------------------------------------------------
				-- System Clock & Reset Signals
				-------------------------------------------------------------------
					RCI_Global_clk	                  : in 		std_logic;--  Clock 200 MHz
					RCI_mod_rst      		            : in 		std_logic;-- Active High 
				-------------------------------------------------------------------
				-- USB Controller Interface Operated in Asynchronous Mode      
				-------------------------------------------------------------------
					RCI_addr                      	: in 		std_logic_vector (7 downto 0);-- USB_RCI_ address
					RCI_data                      	: inout  std_logic_vector (7 downto 0);                                                 
					RCI_csb_n                     	: in		std_logic ;
					RCI_Wr_n                      	: in  	std_logic ;
					RCI_Rd_n                      	: in  	std_logic ;
					RCI_oe_n									: in  	std_logic ;
				-----------------------------------------------------------------
				-- ADC Module Interface                                                   
				-----------------------------------------------------------------
				
					RCI_FLEx_GAIN_PGA						: inout  std_logic_vector (7 downto 0) ;--W
					
				-----------------------------------------------------------------
				-- DAC Module Interface                                                   
				-----------------------------------------------------------------
					RCI_DAC_SAMPLE1_LB 				 	: inout  std_logic_vector (7 downto 0) ;--R/W
					RCI_DAC_SAMPLE1_HB 				 	: inout  std_logic_vector (7 downto 0) ;--R/W
					RCI_DAC_BASE_VALUE1_LB			 	: inout  std_logic_vector (7 downto 0) ;--R/W
					RCI_DAC_BASE_VALUE1_HB 			 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_INCREMENT1				 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_SAMPLE2_LB				 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_SAMPLE2_HB				 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_BASE_VALUE2_LB 			 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_BASE_VALUE2_HB			 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_INCREMENT2 				 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_SAMPLE3_LB 			 	 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_SAMPLE3_HB				 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_BASE_VALUE3_LB			 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_BASE_VALUE3_HB	 		 	: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_INCREMENT3		 			: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_SAMPLE4_LB		 			: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_SAMPLE4_HB		 			: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_BASE_VALUE4_LB	 			: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_BASE_VALUE4_HB	 			: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_DAC_INCREMENT4 		 			: inout  std_logic_vector (7 downto 0) ;--WR
					RCI_START_ACQUISITION				: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_STOP_ACQUISITION		 			: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_BEAM_DELAY_LB	 	 				: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_BEAM_DELAY_HB		 				: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_FRAME_DELAY_LB		 			: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_FRAME_DELAY_HB		 			: inout  std_logic_vector (7 downto 0) ;--RW
					RCI_Decimation_FACTOR				: inout  std_logic_vector (7 downto 0) ;--RW

				-----------------------------------------------------------------
				-- Input/Output Interface Registers                                                   
				-----------------------------------------------------------------				
					RCI_Program_FPGA						: inout  std_logic_vector (7 downto 0);--W
					RCI_FPGA_SOFT_RESET		   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_Power_supply			   		: inout	std_logic_vector (7 downto 0);--RW
					RCI_TEST1                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST2                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST3                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST4                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST5                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST6                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST7                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST8                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST9                   		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST10                  		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST11                  		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST12                  		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST13                  		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST14                  		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST15                  		: inout  std_logic_vector (7 downto 0);--RW
               RCI_TEST16                  		: inout  std_logic_vector (7 downto 0);--RW
					RCI_fpga_status_flag					: out  std_logic_vector (7 downto 0);--R
               RCI_fpga_Ver_build_date				: out  std_logic_vector (7 downto 0);--R
               RCI_fpga_Ver_build_month  			: out  std_logic_vector (7 downto 0);--R
               RCI_fpga_Ver_build_year				: out  std_logic_vector (7 downto 0);--R
               RCI_fpga_Ver_build_number			: out  std_logic_vector (7 downto 0);--R

				
				-----------------------------------------------------------------
				-- Transmitter Side Configuration Register                                                   
				-----------------------------------------------------------------				
				
					RCI_Focal_point 						 : inout  std_logic_vector (7 downto 0) --W
	
					);
 				
end RCI_Module;

Architecture  Behav_RCI_Module of RCI_Module is

			-------------------------------------------------------------------
										-- Signal definations      
			-------------------------------------------------------------------

    signal REG_Focal_point					: std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_FLEX_GAIN_PGA  		   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_DAC_SAMPLE1_LB 		   : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_SAMPLE1_HB 		   : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_BASE_VALUE1_LB	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_BASE_VALUE1_HB      : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_INCREMENT1   	      : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_SAMPLE2_LB   	      : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_SAMPLE2_HB  		   : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_BASE_VALUE2_LB 	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_BASE_VALUE2_HB 	   : std_logic_vector (7 downto 0):= x"00"; -- R/W	 
	 signal REG_DAC_INCREMENT2   	      : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_SAMPLE3_HB          : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_SAMPLE3_LB    	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_DAC_BASE_VALUE3_LB 	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_BASE_VALUE3_HB      : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_INCREMENT3          : std_logic_vector (7 downto 0):= x"00"; -- R/W
    signal REG_DAC_SAMPLE4_LB          : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_DAC_SAMPLE4_HB     	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_DAC_BASE_VALUE4_LB	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_DAC_BASE_VALUE4_HB	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_DAC_INCREMENT4		      : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_START_ACQUISITION	      : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_STOP_ACQUISITION		   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_BEAM_DELAY_LB      	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_BEAM_DELAY_HB      	   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_FRAME_DELAY_LB		      : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_FRAME_DELAY_HB		      : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_FPGA_SOFT_RESET		   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_Power_supply			   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_Decimation_FACTOR	      : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST1                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST2                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST3                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST4                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST5                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST6                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST7                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST8                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST9                   : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST10                  : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST11                  : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST12                  : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST13                  : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST14                  : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST15                  : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 signal REG_TEST16                  : std_logic_vector (7 downto 0):= x"00"; -- R/W
	 constant REG_fpga_status_flag		: std_logic_vector (7 downto 0):= x"AA"; -- R/W 
	 constant REG_fpga_Ver_build_date	: std_logic_vector (7 downto 0):= x"18"; -- R/W
	 constant REG_fpga_Ver_build_month  : std_logic_vector (7 downto 0):= x"04"; -- R/W
	 constant REG_fpga_Ver_build_year	: std_logic_vector (7 downto 0):= x"14"; -- R/W
	 constant REG_fpga_Ver_build_number	: std_logic_vector (7 downto 0):= x"01"; -- R/W	                                   
	 --------------------------------------------------------------------- 
    -- Interface signals               
    --------------------------------------------------------------------- 
    signal sig_USB_RCI_csb_n          			: std_logic := '0';
    signal sig_USB_RCI_wr_n         			: std_logic := '0';
    signal sig_USB_RCI_Rd_n          		   : std_logic := '0';
	 
	 signal cpu_csn_ff1 : std_logic;
	 signal cpu_csn_ff2 : std_logic;
	 signal cpu_csn_ff3 : std_logic;
	 
	 signal cpu_wren_ff1 : std_logic;
	 signal cpu_wren_ff2 : std_logic;
	 signal cpu_wren_ff3  : std_logic;
	 
	 signal cpu_oe_ff1 : std_logic;
	 signal cpu_oe_ff2 : std_logic;

    signal cpu_wren_edge : std_logic;
	 signal csen_edge		 : std_logic;
	 signal RCI_mod_rst_duplicate   : std_logic;
        

begin
--RCI_mod_rst_duplicate <= RCI_mod_rst;
-- output register --

	Process(RCI_Global_clk,RCI_mod_rst)
    begin
	 if RCI_mod_rst = '1' then 
		  cpu_csn_ff1 <= '1';	
        cpu_csn_ff2 <= '1';
		  cpu_csn_ff3 <= '1';
		  
        cpu_wren_ff1 <= '1';	
		  cpu_wren_ff2 <= '1';
		  cpu_wren_ff3 <= '1';

		  cpu_oe_ff1 <= '1';	
		  cpu_oe_ff2 <= '1';
        cpu_wren_edge<= '0';	
    elsif rising_Edge(RCI_Global_clk)then
	   	  
		  cpu_csn_ff1 <= RCI_csb_n;
		  cpu_csn_ff2 <= cpu_csn_ff1;
		  cpu_csn_ff3 <= cpu_csn_ff2;
		  
		  cpu_wren_ff1 <= RCI_Wr_n;
		  cpu_wren_ff2 <= cpu_wren_ff1;
		  cpu_wren_ff3 <= cpu_wren_ff2;
		  
		  cpu_oe_ff1 <= RCI_oe_n;
		  cpu_oe_ff2 <= cpu_oe_ff1;
		  
		  
		  if (cpu_csn_ff3 = '1' and cpu_csn_ff2 = '0') then 
          csen_edge <= '1';
		  else
		    csen_edge <= '0';
		  end if;
		  
--		  if (cpu_wren_ff3 = '1' and cpu_wren_ff2 = '0') then 
--          cpu_wren_edge <= '1';
--		  else
--		    cpu_wren_edge <= '0';
--		  end if;		  
	 end if;
	 end process;

--------------------------------------------------------------------- 
    --Writing Process
--------------------------------------------------------------------- 

--process (RCI_mod_rst,cpu_oe_ff2,cpu_wren_ff3,csen_edge,RCI_data)	
Process(RCI_Global_clk,RCI_mod_rst)
begin
		
		if(RCI_mod_rst = '1') then
				REG_Focal_point					<= x"00";
				REG_FLEX_GAIN_PGA  		      <= x"00";
				REG_DAC_SAMPLE1_LB 		      <= x"00";
				REG_DAC_SAMPLE1_HB 		      <= x"00";
				REG_DAC_BASE_VALUE1_LB	      <= x"00";
				REG_DAC_BASE_VALUE1_HB        <= x"00";
				REG_DAC_INCREMENT1   	      <= x"00";
				REG_DAC_SAMPLE2_LB   	      <= x"00";
				REG_DAC_SAMPLE2_HB  		      <= x"00";
				REG_DAC_BASE_VALUE2_LB 	      <= x"00";
				REG_DAC_BASE_VALUE2_HB 	      <= x"00";
				REG_DAC_INCREMENT2   	      <= x"00";
				REG_DAC_SAMPLE3_HB            <= x"00";
				REG_DAC_SAMPLE3_LB    	      <= x"00";
				REG_DAC_BASE_VALUE3_LB 	      <= x"00";
				REG_DAC_BASE_VALUE3_HB        <= x"00";
				REG_DAC_INCREMENT3            <= x"00";
				REG_DAC_SAMPLE4_LB            <= x"00";
				REG_DAC_SAMPLE4_HB     	      <= x"00";
				REG_DAC_BASE_VALUE4_LB	      <= x"00";
				REG_DAC_BASE_VALUE4_HB	      <= x"00";
				REG_DAC_INCREMENT4		      <= x"00";
				REG_START_ACQUISITION	      <= x"00";
				REG_STOP_ACQUISITION		      <= x"00";
				REG_BEAM_DELAY_LB      	      <= x"00";
				REG_BEAM_DELAY_HB      	      <= x"00";
				REG_FRAME_DELAY_LB		      <= x"00";
				REG_FRAME_DELAY_HB		      <= x"00";
				REG_FPGA_SOFT_RESET		      <= x"00";
				REG_Power_supply			      <= x"00";
				REG_Decimation_FACTOR	      <= x"00";
            REG_TEST1                     <= x"00";
            REG_TEST2                     <= x"00";
            REG_TEST3                     <= x"00";
            REG_TEST4                     <= x"00";
            REG_TEST5                     <= x"00";
            REG_TEST6                     <= x"00";
            REG_TEST7                     <= x"00";
            REG_TEST8                     <= x"00";
            REG_TEST9                     <= x"00";
            REG_TEST10                    <= x"00";
            REG_TEST11                    <= x"00";
            REG_TEST12                    <= x"00";
            REG_TEST13                    <= x"00";
            REG_TEST14                    <= x"00";
            REG_TEST15                    <= x"00";
            REG_TEST16                    <= x"00";
                                         
		 elsif rising_edge(RCI_Global_clk) then 
			  
			if( cpu_oe_ff2 = '1' and cpu_wren_ff3 = '0' and csen_edge = '1')then
--					if(cpu_wren_ff3 = '0')then
--							if (csen_edge = '1' ) then
--   if (RCI_csb_n = '0' and (RCI_Wr_n  = '0')) then  
			  
--				if( cpu_wren_edge = '1' ) then
--						if(cpu_csn_ff2 = '0')then

						case RCI_addr is											  									
									when X"00" => REG_Focal_point 			<= RCI_data;
									when X"01" => REG_FLEX_GAIN_PGA 			<= RCI_data;
									when X"02" => REG_DAC_SAMPLE1_LB 		<= RCI_data;
									when X"03" => REG_DAC_SAMPLE1_HB 		<= RCI_data;
									when X"04" => REG_DAC_BASE_VALUE1_LB 	<= RCI_data;
									when X"05" => REG_DAC_BASE_VALUE1_HB  	<= RCI_data;
									when X"06" => REG_DAC_INCREMENT1   		<= RCI_data;
									when X"07" => REG_DAC_SAMPLE2_LB 		<= RCI_data;
									when x"08" => REG_DAC_SAMPLE2_HB    	<= RCI_data;
									when X"09" => REG_DAC_BASE_VALUE2_LB  	<= RCI_data;
									when X"0A" => REG_DAC_BASE_VALUE2_HB 	<= RCI_data;
									when X"0B" => REG_DAC_INCREMENT2 		<= RCI_data;
									when X"0C" => REG_DAC_SAMPLE3_HB 		<= RCI_data;
									when X"0D" => REG_DAC_SAMPLE3_LB 		<= RCI_data;
									when X"0E" => REG_DAC_BASE_VALUE3_LB  	<= RCI_data;
									when X"0F" => REG_DAC_BASE_VALUE3_HB 	<= RCI_data;
                           when X"10" => REG_DAC_INCREMENT3			<= RCI_data;
									when X"11" => REG_DAC_SAMPLE4_LB  		<= RCI_data;
									when X"12" => REG_DAC_SAMPLE4_HB 		<= RCI_data;
									when X"13" => REG_DAC_BASE_VALUE4_LB 	<= RCI_data;
									when X"14" => REG_DAC_BASE_VALUE4_HB 	<= RCI_data;
									when X"15" => REG_DAC_INCREMENT4   		<= RCI_data;
									when X"16" => REG_BEAM_DELAY_LB  		<= RCI_data;
									when X"17" => REG_BEAM_DELAY_HB 			<= RCI_data;
									when x"18" => REG_FRAME_DELAY_LB 		<= RCI_data;
									when X"19" => REG_FRAME_DELAY_HB 		<= RCI_data;
									when X"1A" => REG_FPGA_SOFT_RESET 		<= RCI_data; 
									when X"1B" => REG_Power_supply 			<= RCI_data;
									when X"1C" => REG_Decimation_FACTOR 	<= RCI_data; 					
--									when X"1D" => REG_fpga_status_flag 		<= RCI_data;            	
--									when X"1E" => REG_fpga_Ver_build_date 	<= RCI_data;            	
--									when X"1F" => REG_fpga_Ver_build_month <= RCI_data;            	
--									when X"20" => REG_fpga_Ver_build_year 	<= RCI_data;            	
--									when X"21" => REG_fpga_Ver_build_number<= RCI_data;            
									when X"22" => REG_TEST1 					<= RCI_data;            
									when X"23" => REG_TEST2 					<= RCI_data;            
									when X"24" => REG_TEST3 					<= RCI_data;
									when X"25" => REG_TEST4 					<= RCI_data;
									when X"26" => REG_TEST5 					<= RCI_data;
									when X"27" => REG_TEST6 					<= RCI_data;
									when X"28" => REG_TEST7 					<= RCI_data;
									when x"29" => REG_TEST8 					<= RCI_data;
									when X"2A" => REG_TEST9 					<= RCI_data;
									when X"2B" => REG_TEST10 					<= RCI_data;
									when X"2C" => REG_TEST11 					<= RCI_data;
									when X"2D" => REG_TEST12 					<= RCI_data;
									when X"2E" => REG_TEST13 					<= RCI_data;
									when X"2F" => REG_TEST14 					<= RCI_data;
									when X"30" => REG_TEST15 					<= RCI_data;
									when X"31" => REG_TEST16 					<= RCI_data;
									when others => null;
						 end case;
					
					end if;
--				else
--					 REG_FLEX_GAIN_PGA  		      <= x"00";
--				end if;
--         else 
--            REG_FLEX_GAIN_PGA  		      <= x"00";			
--			end if;
		end if;
end process;	
	

--------------------------------------------------------------------- 
    --Reading Process
--------------------------------------------------------------------- 
--cpu_read : process(	cpu_oe_ff2,RCI_csb_n,RCI_Rd_n,RCI_addr,RCI_data,REG_Focal_point,REG_FLEX_GAIN_PGA,REG_DAC_SAMPLE1_LB,
--							REG_DAC_SAMPLE1_HB , REG_DAC_BASE_VALUE1_LB, REG_DAC_BASE_VALUE1_HB, REG_DAC_INCREMENT1 , REG_DAC_SAMPLE2_LB,
--							REG_DAC_SAMPLE2_HB , REG_DAC_BASE_VALUE2_LB, REG_DAC_BASE_VALUE2_HB, REG_DAC_INCREMENT2 , REG_DAC_SAMPLE3_HB,
--							REG_DAC_SAMPLE3_LB , REG_DAC_BASE_VALUE3_LB, REG_DAC_BASE_VALUE3_HB , REG_DAC_INCREMENT3, REG_DAC_SAMPLE4_LB,
--							REG_DAC_SAMPLE4_HB , REG_DAC_BASE_VALUE4_LB, REG_DAC_BASE_VALUE4_HB, REG_DAC_INCREMENT4, REG_TEST6 ,
--							REG_START_ACQUISITION,REG_TEST7 , REG_STOP_ACQUISITION, REG_TEST8 , REG_BEAM_DELAY_LB, REG_TEST9  , REG_BEAM_DELAY_HB,
--							REG_TEST10 , REG_FRAME_DELAY_LB, REG_TEST11, REG_FRAME_DELAY_HB ,REG_TEST12 , REG_FPGA_SOFT_RESET , REG_TEST13,
--							REG_Power_supply, REG_TEST14, REG_Decimation_FACTOR, REG_TEST15 ,REG_TEST16, REG_TEST1  , REG_TEST2 , REG_TEST3,
--							REG_TEST4, REG_TEST5	) 

Process(RCI_Global_clk,RCI_mod_rst)							
		begin 
if RCI_mod_rst = '1' then 
   	RCI_data		<=   (others => '0') ;
elsif rising_edge ( RCI_Global_clk ) then 		
			if(cpu_oe_ff2 = '0'and RCI_csb_n = '0' and RCI_Rd_n = '0') then                                        
--				if (RCI_csb_n = '0')then                                      
--					if(RCI_Rd_n = '0') then                                    
							case RCI_addr is                                     
									when X"00" =>  RCI_data		<=REG_Focal_point 			;
									when X"01" =>  RCI_data		<=REG_FLEX_GAIN_PGA 			;
									when X"02" =>  RCI_data		<=REG_DAC_SAMPLE1_LB 		;
									when X"03" =>  RCI_data		<=REG_DAC_SAMPLE1_HB 		;
									when X"04" =>  RCI_data		<=REG_DAC_BASE_VALUE1_LB 	;
									when X"05" =>  RCI_data		<=REG_DAC_BASE_VALUE1_HB  	;
									when X"06" =>  RCI_data		<=REG_DAC_INCREMENT1   		;
									when X"07" =>  RCI_data		<=REG_DAC_SAMPLE2_LB 		;
									when x"08" =>  RCI_data		<=REG_DAC_SAMPLE2_HB    	;
									when X"09" =>  RCI_data		<=REG_DAC_BASE_VALUE2_LB  	;
									when X"0A" =>  RCI_data		<=REG_DAC_BASE_VALUE2_HB 	;
									when X"0B" =>  RCI_data		<=REG_DAC_INCREMENT2 		;
									when X"0C" =>  RCI_data		<=REG_DAC_SAMPLE3_HB 		;
									when X"0D" =>  RCI_data		<=REG_DAC_SAMPLE3_LB 		;
									when X"0E" =>  RCI_data		<=REG_DAC_BASE_VALUE3_LB  	;
									when X"0F" =>  RCI_data		<=REG_DAC_BASE_VALUE3_HB 	;
                           when X"10" =>  RCI_data		<=REG_DAC_INCREMENT3			;
									when X"11" =>  RCI_data		<=REG_DAC_SAMPLE4_LB  		;
									when X"12" =>  RCI_data		<=REG_DAC_SAMPLE4_HB 		;
									when X"13" =>  RCI_data		<=REG_DAC_BASE_VALUE4_LB 	;
									when X"14" =>  RCI_data		<=REG_DAC_BASE_VALUE4_HB 	;
									when X"15" =>  RCI_data		<=REG_DAC_INCREMENT4   		;
									when X"16" =>  RCI_data		<=REG_BEAM_DELAY_LB  		;
									when X"17" =>  RCI_data		<=REG_BEAM_DELAY_HB 			;
									when x"18" =>  RCI_data		<=REG_FRAME_DELAY_LB 		;
									when X"19" =>  RCI_data		<=REG_FRAME_DELAY_HB 		;
									when X"1A" =>  RCI_data		<=REG_FPGA_SOFT_RESET 		; 
									when X"1B" =>  RCI_data		<=REG_Power_supply 			;
									when X"1C" =>  RCI_data		<=REG_Decimation_FACTOR 	; 					
									when X"1D" =>  RCI_data		<=REG_fpga_status_flag 		;            	
									when X"1E" =>  RCI_data		<=REG_fpga_Ver_build_date 	;            	
									when X"1F" =>  RCI_data		<=REG_fpga_Ver_build_month ;            	
                           when X"20" =>  RCI_data		<=REG_fpga_Ver_build_year 	;            	
									when X"21" =>  RCI_data		<=REG_fpga_Ver_build_number;            
									when X"22" =>  RCI_data		<=REG_TEST1 					;            
									when X"23" =>  RCI_data		<=REG_TEST2 					;            
									when X"24" =>  RCI_data		<=REG_TEST3 					;
									when X"25" =>  RCI_data		<=REG_TEST4 					;
									when X"26" =>  RCI_data		<=REG_TEST5 					;
									when X"27" =>  RCI_data		<=REG_TEST6 					;
									when X"28" =>  RCI_data		<=REG_TEST7 					;
									when x"29" =>  RCI_data		<=REG_TEST8 					;
									when X"2A" =>  RCI_data		<=REG_TEST9 					;
									when X"2B" =>  RCI_data		<=REG_TEST10 					;
									when X"2C" =>  RCI_data		<=REG_TEST11 					;
									when X"2D" =>  RCI_data		<=REG_TEST12 					;
									when X"2E" =>  RCI_data		<=REG_TEST13 					;
									when X"2F" =>  RCI_data		<=REG_TEST14 					;
									when X"30" =>  RCI_data		<=REG_TEST15 					;
									when X"31" =>  RCI_data		<=REG_TEST16 					;
									when others => RCI_data		<= (others => '0');
							end case;
					end if;
 end if;
end process;

-----------------------------------------------------------------------------------------
-- Mapping of registers
----------------------------------------------------------------------------------------

	RCI_Focal_point					<= REG_Focal_point				;
   RCI_FLEX_GAIN_PGA  		      <= REG_FLEX_GAIN_PGA 		   ; 
   RCI_DAC_SAMPLE1_LB 		      <= REG_DAC_SAMPLE1_LB 		   ; 
   RCI_DAC_SAMPLE1_HB 		      <= REG_DAC_SAMPLE1_HB	      ;
   RCI_DAC_BASE_VALUE1_LB	      <= REG_DAC_BASE_VALUE1_LB	   ; 
   RCI_DAC_BASE_VALUE1_HB        <= REG_DAC_BASE_VALUE1_HB     ; 
   RCI_DAC_INCREMENT1   	      <= REG_DAC_INCREMENT1   	   ; 
   RCI_DAC_SAMPLE2_LB   	      <= REG_DAC_SAMPLE2_LB   	   ; 
   RCI_DAC_SAMPLE2_HB  		      <= REG_DAC_SAMPLE2_HB  		   ; 
   RCI_DAC_BASE_VALUE2_LB 	      <= REG_DAC_BASE_VALUE2_LB 	   ; 
   RCI_DAC_BASE_VALUE2_HB 	      <= REG_DAC_BASE_VALUE2_HB 	   ; 
   RCI_DAC_INCREMENT2   	      <= REG_DAC_INCREMENT2   	   ; 
   RCI_DAC_SAMPLE3_HB            <= REG_DAC_SAMPLE3_HB         ; 
   RCI_DAC_SAMPLE3_LB    	      <= REG_DAC_SAMPLE3_LB    	   ; 
   RCI_DAC_BASE_VALUE3_LB 	      <= REG_DAC_BASE_VALUE3_LB 	   ; 
   RCI_DAC_BASE_VALUE3_HB        <= REG_DAC_BASE_VALUE3_HB     ; 
   RCI_DAC_INCREMENT3            <= REG_DAC_INCREMENT3         ; 
   RCI_DAC_SAMPLE4_LB            <= REG_DAC_SAMPLE4_LB         ; 
   RCI_DAC_SAMPLE4_HB     	      <= REG_DAC_SAMPLE4_HB     	   ; 
   RCI_DAC_BASE_VALUE4_LB	      <= REG_DAC_BASE_VALUE4_LB	   ; 
   RCI_DAC_BASE_VALUE4_HB	      <= REG_DAC_BASE_VALUE4_HB	   ; 
   RCI_DAC_INCREMENT4		      <= REG_DAC_INCREMENT4		   ; 
   RCI_START_ACQUISITION	      <= REG_START_ACQUISITION	   ; 
   RCI_STOP_ACQUISITION		      <= REG_STOP_ACQUISITION		   ; 
   RCI_BEAM_DELAY_LB      	      <= REG_BEAM_DELAY_LB      	   ; 
   RCI_BEAM_DELAY_HB      	      <= REG_BEAM_DELAY_HB      	   ; 
   RCI_FRAME_DELAY_LB		      <= REG_FRAME_DELAY_LB		   ; 
   RCI_FRAME_DELAY_HB		      <= REG_FRAME_DELAY_HB		   ; 
   RCI_FPGA_SOFT_RESET		      <= REG_FPGA_SOFT_RESET		   ; 
   RCI_Power_supply			      <= REG_Power_supply			   ; 
   RCI_Decimation_FACTOR	      <= REG_Decimation_FACTOR	   ; 
   RCI_TEST1                     <= REG_TEST1                  ; 
  	RCI_TEST2                     <= REG_TEST2                  ; 
   RCI_TEST3                     <= REG_TEST3                  ; 
   RCI_TEST4                     <= REG_TEST4                  ; 
   RCI_TEST5                     <= REG_TEST5                  ; 
   RCI_TEST6                     <= REG_TEST6                  ; 
   RCI_TEST7                     <= REG_TEST7                  ; 
   RCI_TEST8                     <= REG_TEST8                  ; 
   RCI_TEST9                     <= REG_TEST9                  ; 
   RCI_TEST10                    <= REG_TEST10                 ; 
   RCI_TEST11                    <= REG_TEST11                 ; 
   RCI_TEST12                    <= REG_TEST12                 ; 
   RCI_TEST13                    <= REG_TEST13                 ; 
   RCI_TEST14                    <= REG_TEST14                 ; 
   RCI_TEST15                    <= REG_TEST15                 ; 
   RCI_TEST16                    <= REG_TEST16                 ;
	RCI_fpga_status_flag		      <= REG_fpga_status_flag		   ;
   RCI_fpga_Ver_build_date	      <= REG_fpga_Ver_build_date	   ;
   RCI_fpga_Ver_build_month      <= REG_fpga_Ver_build_month   ;
   RCI_fpga_Ver_build_year	      <= REG_fpga_Ver_build_year		;
	RCI_fpga_Ver_build_number	   <= REG_fpga_Ver_build_number	;                             

end Behav_RCI_Module;            