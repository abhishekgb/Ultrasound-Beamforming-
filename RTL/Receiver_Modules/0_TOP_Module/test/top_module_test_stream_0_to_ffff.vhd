
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayed Faizan Aliakbar 
-- 
-- Create Date:    10:30:57 07/30/2013 
-- Design Name: 
-- Module Name:    Top_module_Rx_side - Behav_Rx_side 
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
use ieee.std_logic_1164.all;                                                    
use ieee.std_logic_arith.all;                                                   
use ieee.std_logic_unsigned.all;
Library UNISIM;
use UNISIM.vcomponents.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponent  s.all;

entity Top_module_Rx_side is
    port (
					-- Clock interface                                            
							CLK_100Mhz				: in  std_logic;
							--SYSTEM_RST 				: in  std_logic;
							
               -- Power supply sequence interface                                         
							ENABLE1_1				: out std_logic;
							ENABLE1_2				: out std_logic;
							ENABLE1_3				: out std_logic;
							ENABLE1_4				: out std_logic;
							ENABLE1_5				: out std_logic;
							ENABLE1_6				: out std_logic;
							SYNC						: out std_logic;
							POWER_OFF_SEQ 			: in  std_logic; 
							
					-- AD9279 IC Programing interface
							SDIO						: inout  std_logic; 		--|This pin is the input/output for reading writing configurations. 
							CSB						: out std_logic; 			-- Chip Select Bar
							CLK_25MHZ 				: out std_logic; 			-- SPI Clock operated at 25Mhz.
							
					--	LVDS interface from IC AD9279
					
							FCO_P               	: in  std_logic;
							FCO_N               	: in  std_logic;
							
							DCO_P               	: in  std_logic;
							DCO_N               	: in  std_logic;
							
							CH1_P           		: in  std_logic;
							CH1_N           		: in  std_logic;
							CH2_P           		: in  std_logic;
							CH2_N           		: in  std_logic;
							CH3_P           		: in  std_logic;
							CH3_N           		: in  std_logic;  
							CH4_P           		: in  std_logic;
							CH4_N           		: in  std_logic;  
							CH5_P           		: in  std_logic;
							CH5_N           		: in  std_logic;  
							CH6_P           		: in  std_logic;
							CH6_N           		: in  std_logic;  
							CH7_P           		: in  std_logic;
							CH7_N           		: in  std_logic;  
							CH8_P           		: in  std_logic;
							CH8_N           		: in  std_logic;  

					-- DAC Interface Module 
							CLOCK_122_88			: in  std_logic;
							DAC_out_data			: out std_logic_vector(11 downto 0); 	
							WRT_A						: out std_logic;

					-- SRAM interface Module					

							SRAM_clk_out    		: out std_logic; -- SRAM 200 MHz clock out --	
							--SRAM_mode            : out std_logic;	
							SRAM_addr           	: out std_logic_vector(18 downto 0); 	
							SRAM_adv_n           : out std_logic;			 	
							SRAM_adsp_n          : out std_logic;                                	
							SRAM_adsc_n          : out std_logic;                                	
							SRAM_ce_n            : out std_logic;                                	
							SRAM_ce2             : out std_logic;                                	
							SRAM_ce2_n           : out std_logic;                                	
							SRAM_bwa_n           : out std_logic;                                	
							SRAM_bwb_n           : out std_logic;  	
							SRAM_bwc_n           : out std_logic;                                	
							SRAM_bwd_n           : out std_logic;			 	
							SRAM_oe_n            : out std_logic;                                
							SRAM_global_wr_n     : out std_logic;                                	
							SRAM_bwe_n           : out std_logic;                                
							SRAM_zz              : out std_logic; 
							SRAM_DQ              : inout std_logic_vector(17 downto 0);

					--USB interface Module
							USB_CLKIN_48_MHZ		: in  std_logic; 
							USB_sloe_i      		: out std_logic;  
							USB_slrd_i      		: out std_logic;
							USB_flagb        		: in  std_logic;
							USB_flagc        		: in  std_logic;
							usb_start				: in std_logic;
							USB_fddr_i         	: out std_logic_vector(1 downto 0);
							USB_usb_data_out     : out std_logic_vector(15 downto 0);
							USB_slwr_i       		: out std_logic;

					--RCI interface Module Operated in Asynchronous Mode      
							USB_RCI_addr         : in std_logic_vector (7 downto 0);-- USB_RCI_ address
							USB_RCI_data         : inout std_logic_vector (7 downto 0);                                                 
							USB_RCI_csb_n        : in std_logic ;
							USB_RCI_Wr_n         : in std_logic ;
							USB_RCI_Rd_n         : in std_logic ;
							USB_RCI_oe_n			: in std_logic ;
																			
							tp							: out std_logic
	
							);
End Top_module_Rx_side;

Architecture Behav_Rx_side of Top_module_Rx_side is

			---------------------------------------------------
							-- Signals Declaration
				---------------------------------------------------
				
-- Clock interface Signals
signal glb_clk		 					:std_logic := '0';
signal sig_clk_400Mhz				:std_logic := '0';
signal CLK_100Mhz_s 					:std_logic;
signal sig_Bufg  						:std_logic := '0';
signal sig_lock						:std_logic;
signal g_reset							:std_logic := '1';
signal reset_counter	 				:std_logic_vector(7 downto 0):= x"00";

-- Power supply sequence signals
signal en_done							:std_logic := '0';
signal OFF_SEQ_result_temp			:std_logic := '0';
signal P_RCI_temp						:std_logic := '0';
signal OFF_SEQ_DYANAMIC_SIG_TEMP	:std_logic := '0';


-- LVDS decoding module signals
signal SIG_ADC_DATAVALID			: std_logic := '0';
signal SIG_PB_data_tick1			: std_logic := '0';
signal SIG_PB_data_tick2			: std_logic := '0';
signal SIG_PB_data_tick3			: std_logic := '0';
signal SIG_PB_data_tick4			: std_logic := '0';
signal SIG_PB_data_tick5			: std_logic := '0';
signal SIG_PB_data_tick6			: std_logic := '0';
signal SIG_PB_data_tick7			: std_logic := '0';
signal SIG_PB_data_tick8			: std_logic := '0';

signal SIG_LVDS_DATA_IN_CH1		: std_logic_vector(11 downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH2     	: std_logic_vector(11 downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH3     	: std_logic_vector(11 downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH4     	: std_logic_vector(11 downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH5     	: std_logic_vector(11 downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH6     	: std_logic_vector(11 downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH7     	: std_logic_vector(11 downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH8     	: std_logic_vector(11 downto 0) := (others => '0');
signal ADC_FCO_BUFGDS     			: std_logic:= '0';
signal ADC_FCO_BUFIO     			: std_logic:= '0';
signal ADC_FCO			     			: std_logic:= '0';
signal ADC_DCO_BUFGDS     			: std_logic:= '0';
signal ADC_DCO_BUFIO     			: std_logic:= '0';
signal ADC_DCO			     			: std_logic:= '0';
signal ADC_OUT_CH1_BUFDS 			: std_logic:= '0';
signal ADC_OUT_CH2_BUFDS 			: std_logic:= '0';
signal ADC_OUT_CH3_BUFDS 			: std_logic:= '0';
signal ADC_OUT_CH4_BUFDS 			: std_logic:= '0';
signal ADC_OUT_CH5_BUFDS 			: std_logic:= '0';
signal ADC_OUT_CH6_BUFDS 			: std_logic:= '0';
signal ADC_OUT_CH7_BUFDS 			: std_logic:= '0';
signal ADC_OUT_CH8_BUFDS 			: std_logic:= '0';
signal fco_count     				: std_logic_vector(11 downto 0) := (others => '0');
signal source_counter     			: std_logic_vector(15 downto 0) := (others => '0');
signal dco_count     				: std_logic_vector(11 downto 0) := (others => '0');

-- Schedular (Mini Schedular)

signal sig_beam_no     				: std_logic_vector(7 downto 0) := (others => '0');
signal Sig_DYNAMIC_control 			: std_logic:= '0'; 


-- DAC Module signals

signal SIG_CLOCK_122_88				:std_logic := '0';
signal sig_DAC_data    				: std_logic_vector(11 downto 0) := (others => '0');
signal sig_WRT_A						:std_logic := '0';
--signal 				:std_logic := '0';
--signal 						:std_logic := '0';



-- AD9279 Module Signals 

signal SDIO_temp						:std_logic := '0';
signal CSB_temp						:std_logic := '0';
signal CLK_25Mhz_temp				:std_logic := '0';
signal prog_done						:std_logic := '0'; 
-- signals for the lvds input buffered SRAM--

signal LVDS_fifo_rd_en 			: std_logic:= '0';
signal LVDS_dout_ch1 			: std_logic_vector(11 downto 0) := (others => '0');
signal LVDS_dout_ch2				: std_logic_vector(11 downto 0) := (others => '0');
signal LVDS_dout_ch3				: std_logic_vector(11 downto 0) := (others => '0');
signal LVDS_dout_ch4				: std_logic_vector(11 downto 0) := (others => '0');
signal LVDS_dout_ch5				: std_logic_vector(11 downto 0) := (others => '0');
signal LVDS_dout_ch6				: std_logic_vector(11 downto 0) := (others => '0');
signal LVDS_dout_ch7				: std_logic_vector(11 downto 0) := (others => '0');
signal LVDS_dout_ch8				: std_logic_vector(11 downto 0) := (others => '0');
signal LVDS_fifo_full 			: std_logic:= '0';
signal LVDS_fifo_empty 			: std_logic:= '0';
signal LVDS_fifo_data_valid 	: std_logic:= '0';
signal sig_wr_ack : std_logic := '0' ;
signal data_count : std_logic_vector ( 3 downto 0);
signal lvds_fifo_wr_en : std_logic:= '0';
signal lvds_fifo_wr_en1 : std_logic := '0';
signal SIG_ADC_DATAVALID_s : std_logic:= '0';
signal SIG_ADC_DATAVALID_s1 : std_logic:= '0';

-- Process Block Module signals
signal SIG_PB_DATA_OUT_CH1			: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH2     	: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH3     	: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH4     	: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH5     	: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH6     	: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH7     	: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH8     	: std_logic_vector(15 downto 0) := (others => '0');
signal sig_read_en_LVDS_fifo1 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo2 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo3 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo4 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo5 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo6 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo7 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo8 		: std_logic:= '0';

-- ADC data decimator module signals --
signal deci_data_out_CH1 : std_logic_vector ( 15 downto 0);
signal deci_data_out_CH2 : std_logic_vector ( 15 downto 0);
signal deci_data_out_CH3 : std_logic_vector ( 15 downto 0);
signal deci_data_out_CH4 : std_logic_vector ( 15 downto 0);
signal deci_data_out_CH5 : std_logic_vector ( 15 downto 0);
signal deci_data_out_CH6 : std_logic_vector ( 15 downto 0);
signal deci_data_out_CH7 : std_logic_vector ( 15 downto 0);
signal deci_data_out_CH8 : std_logic_vector ( 15 downto 0);

signal deci_data_valid_CH1 : std_logic:= '0';
signal deci_data_valid_CH2 : std_logic:= '0';
signal deci_data_valid_CH3 : std_logic:= '0';
signal deci_data_valid_CH4 : std_logic:= '0';
signal deci_data_valid_CH5 : std_logic:= '0';
signal deci_data_valid_CH6 : std_logic:= '0';
signal deci_data_valid_CH7 : std_logic:= '0';
signal deci_data_valid_CH8 : std_logic:= '0';

-- Channel Adder Module signals
signal SIG_out_adder_data_tick	: std_logic := '0';
signal SIG_ADD_DATA_OUT		     	: std_logic_vector(15 downto 0) := (others => '0');

-- Input Write Register (16 x 16) Module signals
signal SIG_WR_REG_DATA_TICK		: std_logic := '0';
signal SIG_WR_REG_DATA			   : std_logic_vector(15 downto 0) := (others => '0');

-- SRAM Schedular Module signals  

signal SIG_Sch_Wr_done 				:std_logic := '0';
signal SIG_Sch_Rd_done_s 			:std_logic;
signal SIG_Sch_Wr_en 				:std_logic := '0';
signal SIG_Sch_Rd_en 				:std_logic := '0';			
signal SIG_Sch_USB_data_tick		:std_logic := '0';
signal SIG_Sch_SRAM_full 			:std_logic := '0';
signal SIG_Sch_SRAM_empty			:std_logic := '0';
signal SIG_SRAM_RD_data_valid			:std_logic := '0'; 
signal sram_wr_data_rd_en1	: std_logic;
signal sram_wr_data_rd_en	: std_logic;
signal SRAM_adv_n_s : std_logic;
signal SRAM_adsc_n_s : std_logic;
signal SIG_Sch_Addr_R_W			   : std_logic_vector(18 downto 0) := (others => '0');

-- Decimation Selector and Adder Module Signals 

signal SIG_DEC_OUT_DATA_VALID		: std_logic := '0';
signal SIG_DEC_OUT_DATA			   : std_logic_vector(15 downto 0) := (others => '0');
signal SIG_RD_dec_DATA			   : std_logic_vector(17 downto 0) := (others => '0'); 

-- Output Read Register (16 x 16) Module signals
signal SIG_RD_REG_OUT_DATA_TICK	: std_logic := '0'; 
signal SIG_RD_REG_OUT_DATA			: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_REG_ADDR_SEL				: std_logic_vector(3 downto 0)  := (others => '0');


-- Differnt RCI Module signals

-- ADC Module RCI Interface                                                   
signal SIG_RCI_FLEx_GAIN_PGA			: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_testing              : std_logic_vector (7 downto 0) := (others => '0');--W
-- DAC Module RCI Interface       	                                        
signal SIG_RCI_DAC_SAMPLE1_LB 		: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_SAMPLE1_HB 		: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_BASE_VALUE1_LB	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_BASE_VALUE1_HB 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_INCREMENT1			: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_SAMPLE2_LB			: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_SAMPLE2_HB			: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_BASE_VALUE2_LB 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_BASE_VALUE2_HB	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_INCREMENT2 		: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_SAMPLE3_LB 		: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_SAMPLE3_HB			: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_BASE_VALUE3_LB	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_BASE_VALUE3_HB	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_INCREMENT3		 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_SAMPLE4_LB		 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_SAMPLE4_HB		 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_BASE_VALUE4_LB	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_BASE_VALUE4_HB	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_DAC_INCREMENT4 		: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_START_ACQUISITION		: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_STOP_ACQUISITION		: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_BEAM_DELAY_LB	 	 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_BEAM_DELAY_HB		 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_FRAME_DELAY_LB		 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_FRAME_DELAY_HB		 	: std_logic_vector (7 downto 0) := (others => '0');--W
signal SIG_RCI_Decimation_FACTOR		: std_logic_vector (7 downto 0) := X"01";--W
-- Input/Output Interface RCI Registers                                                 
signal SIG_RCI_fpga_status_flag		: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_fpga_Ver_build_date	: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_fpga_Ver_build_month	: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_fpga_Ver_build_year	: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_fpga_Ver_build_number: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_IG_RCI_Power_supply		: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_FPGA_SOFT_RESET		: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_Program_FPGA			: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST1 					: std_logic_vector (7 downto 0) := (others => '0');--	
signal SIG_RCI_TEST2                : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST3                : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST4                : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST5                : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST6                : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST7                : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST8                : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST9 					: std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST10               : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST11               : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST12               : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST13               : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST14               : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST15               : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_TEST16               : std_logic_vector (7 downto 0) := (others => '0');--
signal SIG_RCI_Power_supply         : std_logic_vector (7 downto 0) := (others => '0');--



-- Transmitter Side Configuration RCI Register                                                 
signal SIG_RCI_Focal_point 			: std_logic_vector (7 downto 0) := (others => '0');--W

-- USB Interface Controller Signals
signal SIG_footer_tick	: std_logic := '0';     

-- To be removed signals --

signal trig_en : std_logic;
signal t1,t2,t3,t4,t5 : std_logic;
signal USB_usb_data_out_s : std_logic_vector (15 downto 0);
signal control1_temp : std_logic_vector (35 downto 0);
signal USB_slwr_s : std_logic;
signal USB_slrd_s : std_logic;          
signal USB_CLKIN_sig : std_logic;       
signal glb_clk_s : std_logic;
signal sig_clk_400Mhz_s : std_logic;
signal sig_usb_fifo_full : std_logic;
signal usb_fifo_empty : std_logic;
signal usb_fifo_rd_en : std_logic;
signal usb_fifo_data_valid : std_logic;
signal glb_clk_180 : std_logic;
signal glb_clk_180_s : std_logic;
signal sram_wr_data_fifo_empty : std_logic;
----signal count : std_logic_vector (2 downto 0);
signal sel : std_logic_vector (2 downto 0);
signal mux_out : std_logic_vector (15 downto 0);

signal LVDS_fifo_empty1 		: std_logic;  
signal LVDS_fifo_data_valid1	: std_logic;  
signal LVDS_fifo_empty2 		: std_logic;  
signal LVDS_fifo_data_valid2 	: std_logic;  
signal LVDS_fifo_empty3 		: std_logic;  
signal LVDS_fifo_data_valid3	: std_logic;  
signal LVDS_fifo_empty4 		: std_logic;  
signal LVDS_fifo_data_valid4	: std_logic;  
signal LVDS_fifo_empty5 		: std_logic;  
signal LVDS_fifo_data_valid5	: std_logic;  
signal LVDS_fifo_empty6 		: std_logic;  
signal LVDS_fifo_data_valid6 	: std_logic;  
signal LVDS_fifo_empty7 		: std_logic;  
signal LVDS_fifo_data_valid7	: std_logic;  
signal LVDS_fifo_empty8 		: std_logic;  
signal LVDS_fifo_data_valid8	: std_logic; 
signal lvds_fifo_full1        : std_logic;
signal lvds_fifo_full2        : std_logic;
signal lvds_fifo_full3        : std_logic;
signal lvds_fifo_full4        : std_logic;
signal lvds_fifo_full5        : std_logic;
signal lvds_fifo_full6        : std_logic;
signal lvds_fifo_full7        : std_logic;
signal lvds_fifo_full8        : std_logic;

signal sig_usb_fifo_empty 		: std_logic;
signal sig_usb_fifo_data_valid	: std_logic;
signal tp_sig						: std_logic;  
--signal sig_read_en_LVDS_fifo1  : std_logic; 
--signal sig_read_en_LVDS_fifo2  : std_logic; 
--signal sig_read_en_LVDS_fifo3  : std_logic; 
--signal sig_read_en_LVDS_fifo4  : std_logic;
--signal sig_read_en_LVDS_fifo5  : std_logic; 
--signal sig_read_en_LVDS_fifo6  : std_logic; 
--signal sig_read_en_LVDS_fifo7  : std_logic; 
--signal sig_read_en_LVDS_fifo8  : std_logic;

-----------------------------------------------------    
---- Component   Declarations
-----------------------------------------------------

--Clock interface Component   --

	Component   freq_mul
					port(
						CLKIN_IN : IN std_logic;          
						CLKIN_IBUFG_OUT : OUT std_logic;
						CLKOUT0_OUT : OUT std_logic;
						CLKOUT1_OUT : OUT std_logic;
						CLKOUT2_OUT : OUT std_logic;
						LOCKED_OUT : OUT std_logic
					);
	End Component  ;
	

-- Power supply sequence Component  
	
	Component POWER_SEQUENCE is
					port(
								P_OTP1						: in  std_logic;
								P_RESET						: in  std_logic;
								--P_RCI							: in  std_logic;
								P_GLOBAL_CLK				: in  std_logic;
								P_ENABLE1_1					: out std_logic;
								P_ENABLE1_2					: out std_logic;
								P_ENABLE1_3					: out std_logic;
								P_ENABLE1_4					: out std_logic;
								P_ENABLE1_5					: out std_logic;
								P_ENABLE1_6					: out std_logic;
								P_SYNC						: out std_logic
						);
	End Component  ; 
	
	
-- debouncing logic Component for Power OFF Sequence Increament		
				component PS_DEBOUNCE IS
							PORT(
									 clk     				: IN  STD_LOGIC;  --button clock
									 button  				: IN  STD_LOGIC;  --button signal to be debounced
									 tig_mod_rst	 		: IN  STD_LOGIC;	 
									 result  				: OUT STD_LOGIC --debounced signal
								 );
					end component;


-- Schedular module (Mini Schedular)

				component Mini_Schedular IS
					 Port ( 
							  SC_GLOBAL_CLK 		: IN STD_LOGIC;
							  RESET_IN 				: IN  STD_LOGIC;
							  TEST_BEAM_NO 		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
							  Tx_CONTROL_STATIC 	: OUT STD_LOGIC;
							  Tx_CONTROL_DYNAMIC : OUT STD_LOGIC;
							  enable_done2			: IN STD_LOGIC
							 );
				End Component  ; 




-- DAC module

Component DAC_Module is
			Port ( 
						 DAC_GLOBAL_CLK 		: in  std_logic;
						 DAC_MOD_RST 			: in  std_logic;
						 DAC_CLOCK_122_88		: IN  STD_LOGIC;
						 DAC_data_present		: out  STD_LOGIC;
						 DAC_Data				: OUT STD_LOGIC_VECTOR(11 downto 0);	--Output for writing configurations. 
						 DAC_WRT_A				: OUT STD_LOGIC; 		
						 DAC_enable_done5		: IN  STD_LOGIC
					);
	End Component  ;					
	
	
--IC AD9279 component

	Component AD_module is
					port ( 
								AD_GLOBAL_CLK 				: in  std_logic;
								AD_MOD_RST 					: in  std_logic;
								AD_SDIO		 				: inout  std_logic;
								AD_CSB						: out std_logic;
								AD_CLK_25Mhz				: out std_logic;
								AD_prog_done				: out STD_LOGIC;
--								AD_DYNAMIC_CONFIG 		: in  std_logic;
								enable_done4				: in  std_logic;
								data_readback		: out STD_LOGIC_VECTOR (7 downto 0)
						);
	End Component  ; 

-- LVDS interface module for AD9279 IC

	Component   lvds_adc_interface is
					Port (                                        
							  global_clk             : in  std_logic;
							  reset                : in  std_logic;
																				  
							  ADC_FCO                : in  std_logic;
							  ADC_DCO                : in  std_logic;
							  ADC_OUT_CH1            : in  std_logic;
							  ADC_OUT_CH2            : in  std_logic;
							  ADC_OUT_CH3            : in  std_logic;
							  ADC_OUT_CH4            : in  std_logic;
							  ADC_OUT_CH5            : in  std_logic;
							  ADC_OUT_CH6            : in  std_logic;
							  ADC_OUT_CH7            : in  std_logic;
							  ADC_OUT_CH8            : in  std_logic;
							  
							  adc_datavalid          : out std_logic;
							  ADC_DATA_CH1           : out std_logic_vector(11 downto 0);
							  ADC_DATA_CH2           : out std_logic_vector(11 downto 0);
							  ADC_DATA_CH3           : out std_logic_vector(11 downto 0);
							  ADC_DATA_CH4           : out std_logic_vector(11 downto 0);
							  ADC_DATA_CH5           : out std_logic_vector(11 downto 0);
							  ADC_DATA_CH6           : out std_logic_vector(11 downto 0);
							  ADC_DATA_CH7           : out std_logic_vector(11 downto 0);
							  ADC_DATA_CH8           : out std_logic_vector(11 downto 0)                                       
																				  
						);
	End Component  ;  
	  

---- FIFO buffer for the LVDS data IN ----
COMPONENT lvds_in_buff
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC
  );
END COMPONENT;

-- Process Block instantiation for Channel 1 --
	Component   Module_Process_Block_CH1 is
					 Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FIFO_RD_enable1: out STD_LOGIC;
							FIFO_empty_ch1	: in  std_logic;
							FP_IN				: IN  STD_LOGIC_VECTOR(7 downto 0);
							PB_DATA_IN		: IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
	End Component  ;

-- Process Block instantiation for Channel 2 --
	Component 	Module_Process_Block_CH2 is
					Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FIFO_RD_enable2: out STD_LOGIC;
							FIFO_empty_ch2	: in  std_logic;
							FP_IN				: IN  STD_LOGIC_VECTOR(7 downto 0);
							PB_DATA_IN		: IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
	End Component  ;  

-- Process Block instantiation for Channel 3 --
	Component   Module_Process_Block_CH3 is
					 Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FIFO_RD_enable3: out STD_LOGIC;
							FIFO_empty_ch3	: in  std_logic;
							FP_IN				: IN  STD_LOGIC_VECTOR(7 downto 0);
							PB_DATA_IN		: IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
	End Component  ; 

-- Process Block instantiation for Channel 4 --
	Component   Module_Process_Block_CH4 is
					Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FIFO_RD_enable4: out STD_LOGIC;
							FIFO_empty_ch4	: in  std_logic;
							FP_IN				: IN  STD_LOGIC_VECTOR(7 downto 0);
							PB_DATA_IN		: IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
	End Component  ; 

-- Process Block instantiation for Channel 5 --
	Component   Module_Process_Block_CH5 is
					 Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FIFO_RD_enable5: out STD_LOGIC;
							FIFO_empty_ch5	: in  std_logic;
							FP_IN				: IN  STD_LOGIC_VECTOR(7 downto 0);
							PB_DATA_IN		: IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
	End Component  ; 

-- Process Block instantiation for Channel 6 --
	Component   Module_Process_Block_CH6 is
					 Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FIFO_RD_enable6: out STD_LOGIC;
							FIFO_empty_ch6	: in  std_logic;
							FP_IN				: IN  STD_LOGIC_VECTOR(7 downto 0);
							PB_DATA_IN		: IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
	End Component  ; 

-- Process Block instantiation for Channel 7 --
	Component   Module_Process_Block_CH7 is
					 Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FIFO_RD_enable7: out STD_LOGIC;
							FIFO_empty_ch7	: in  std_logic;
							FP_IN				: IN  STD_LOGIC_VECTOR(7 downto 0);
							PB_DATA_IN		: IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
	End Component  ; 

-- Process Block instantiation for Channel 8 --
	Component   Module_Process_Block_CH8 is
					 Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FIFO_RD_enable8: out STD_LOGIC;
							FIFO_empty_ch8	: in  std_logic;
							FP_IN				: IN  STD_LOGIC_VECTOR(7 downto 0);
							PB_DATA_IN		: IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
	End Component  ; 


-- Addition Process Module of all 8 Channels  

component adc_data_decimator is
    Port ( clk_in : in  STD_LOGIC;
           rst_in : in  STD_LOGIC;
			  pb_data_tick : in STD_LOGIC;
			  decimation_factor : in  STD_LOGIC_VECTOR (1 downto 0);
           pb_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           decimated_data_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  decimated_data_valid : out std_logic
			  );
end component;

component adder is
	port
		(clk,rst,ce : in std_logic;
		 din1,din2,din3,din4,din5,din6,din7,din8 : in std_logic_vector (15 downto 0);
		 dout : out std_logic_vector (15 downto 0);
		 data_valid : out std_logic
		 );
end component;


component sram_wr_fifo is                                                            
  port ( glb_clk1               	   : in std_logic; -- 400 Mhz
			glb_clk2               	   : in std_logic; -- 200 Mhz 180 PS (FE)
         g_reset                 	: in std_logic;
			data_available					: in std_logic;
			rd_en								: in std_logic;
			adc_data_tick					: out std_logic;
         data_in              		: in  std_logic_vector(15 downto 0);
			data_out							: out std_logic_vector(15 downto 0);
         data_valid						: out std_logic;
			sram_fifo_full					: out std_logic;
			sram_fifo_empty				: out std_logic
       );  
end component; 

-- SRAM Scheduler Module
	Component   SRAM_Schedular is
					port ( 
								glb_clk        			: in  std_logic;
								g_reset        			: in  std_logic;
								ADC_ready					: in  std_logic;
								Wr_done						: in  std_logic;
								Rd_done						: in  std_logic;
								start_adc_acqn				: in  std_logic;
								usb_fifo_full				: in  std_logic;
								sram_fifo_empty			: in  std_logic;
								decimation_factor			: in std_logic_vector (1 downto 0);
								sram_wr_data_rd_en		: out std_logic;
								Wr_en							: out std_logic;
								
								Rd_en							: out std_logic;
								footer_tick					: out std_logic;
								SRAM_full					: out std_logic;
								SRAM_empty					: out std_logic;
								SRAM_Addr_R_W				: out std_logic_vector(18 downto 0)
							);
	End Component  ; 
	
-- SRAM Controller Interface Module
	Component   sram_interface is
					port (  
								clk_in          			: in  std_logic; -- Global 200 MHz clock input --
								rst_in			  			: in  std_logic; -- Global Active High POR reset input --	
								-- SRAM interface --
								--sram_clk_out    			: out std_logic; -- SRAM 200 MHz clock out --
								mode            			: out std_logic;
								addr           			: out std_logic_vector(18 downto 0); 
								adv_n           			: out std_logic;			 
								adsp_n          			: out std_logic;                                
								adsc_n          			: out std_logic;                                
								ce_n            			: out std_logic;                                
								ce2             			: out std_logic;                                
								ce2_n           			: out std_logic;                                
								bwa_n           			: out std_logic;                                
								bwb_n           			: out std_logic;  
								bwc_n           			: out std_logic;                                
								bwd_n           			: out std_logic;			 
								oe_n            			: out std_logic;                                
								global_wr_n     			: out std_logic;                                
								bwe_n           			: out std_logic;                                
								zz              			: out std_logic; 
								DQ              			: inout std_logic_vector(17 downto 0);
								-- Schedular interface --
								wr_en				 			: in  std_logic;			 
								rd_en							: in  std_logic;
								wr_done				 		: out std_logic;
								rd_done				 		: out std_logic;
								sram_addrs_in     		: in  std_logic_vector(18 downto 0);
								sram_wr_data_in   		: in  std_logic_vector(15 downto 0);
								sram_rd_data_out  		: out std_logic_vector(17 downto 0);
								sram_rd_data_valid		: out std_logic
					);
	End Component  ; 

	Component sram_usb_fifo is                                                            
	port ( wr_clk               	   : in std_logic; -- 200 Mhz
			rd_clk               	   : in std_logic; -- 48 Mhz
         g_reset                 	: in std_logic;
			fifo_wr_en						: in std_logic;
         fifo_data_in           		: in  std_logic_vector(15 downto 0);
			fifo_rd_en						: in std_logic;
			usb_fifo_full					: out std_logic;
			usb_fifo_empty					: out std_logic;
			fifo_data_out					: out std_logic_vector(15 downto 0);
			fifo_data_valid				: out std_logic	
       );  
	end Component; 

-- USB Interface Controller Module

	Component   usb_controller is
			port(
					gclk 	     					: in std_logic;
					usb_48_MHZ 					: in std_logic; 
					g_reset  					: in std_logic; 
					-- Scheduler interface --
					header_footer_tick  		: in std_logic;
					usb_fifo_empty		  		: in std_logic;
					usb_fifo_data_valid		: in std_logic;
					usb_data_in   				: in std_logic_vector(15 downto 0);
					usb_fifo_rd_en				: out std_logic;
					usb_Beam_no_in				: in std_logic_vector(7 downto 0);
					-- USB Controller Interface --
					flagb        				: in std_logic;
					flagc        				: in std_logic;
					usb_start					: in std_logic;
					sloe_i      				: out std_logic;  
					slrd_i       				: out std_logic;
					slwr_i       				: out std_logic;
					fddr_i         			: out std_logic_vector(1 downto 0);
					usb_data_out      		: out std_logic_vector(15 downto 0)
					);
	End Component;

	Component RCI_Module is
					 Port ( 
				-------------------------------------------------------------------
				-- System Clock & Reset Signals
				-------------------------------------------------------------------
					RCI_Global_clk	                  : in 		std_logic;--Global Clock 100 MHz
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
							
			end Component;	

-----------------------------------------------
-- To be removed
-----------------------------------------------
component icontrol2
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

end component;

component logicanalyser1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    DATA : IN STD_LOGIC_VECTOR(28 DOWNTO 0);
    TRIG0 : IN STD_LOGIC_VECTOR(1 DOWNTO 0));

end component;
---------------------------------------------------------
	
Begin

SDIO								<= SDIO_temp;
CSB								<= CSB_temp;
CLK_25Mhz						<= CLK_25Mhz_temp;
ENABLE1_6      				<= en_done;



				---------------------------------------------------
							-- internal Reset Declaration
				---------------------------------------------------
				
RESET_LOGIC : 	process (glb_clk)
						begin
							if RISING_EDGE(glb_clk) then
								--if (SYSTEM_RST = '1') THEN
									--g_reset <= '1';						
								--else
									if(reset_counter = x"F0" ) then
										g_reset <= '0';
									elsif (sig_lock = '1') then 
										g_reset <= '1';
										reset_counter <= reset_counter + '1';
									end if;
									
									if(SIG_RCI_Power_supply = x"00") then
										P_RCI_temp <= '1';
									else
										P_RCI_temp <= '0';
									end if;
								--End if;
							End if;
					End process;
--					
--					
--				---------------------------------------------------
--							-- Component   instantiations
--				---------------------------------------------------
--
--	-------------------------------------
--	-- USB Clock (48 MHz) IBUFG --
--	-------------------------------------
	IBUFG_inst1 : IBUFG
   generic map (
      IOSTANDARD => "DEFAULT")
   port map (
      O => USB_CLKIN_sig, -- 48 MHz Clock buffer output
      I => USB_CLKIN_48_MHZ  -- Clock buffer input
   );

--	-------------------------------------
--	DAC input Clock (122.88 MHz) IBUFG --
--	-------------------------------------
	IBUFG_inst2 : IBUFG
   generic map (
      IOSTANDARD => "DEFAULT")
   port map (
      O => SIG_CLOCK_122_88, -- 122.88 MHz Clock buffer output
      I => CLOCK_122_88  -- Clock buffer input
   );
	
		Mod_DCM_to_PLL1 : freq_mul
	
				port map(
								CLKin_in 					=> CLK_100Mhz,
								CLKin_IBUFG_out 			=> sig_Bufg,
								CLKout0_out 				=> sig_clk_400Mhz_s,--400 MHz
								CLKout1_out 				=> glb_clk_s, --200 MHz
								CLKout2_out					=> glb_clk_180_s,
								LOCKED_out 					=> sig_lock
						);
						
	-------------------------------------
	-- SRAM Clock out (200 MHz) BUFG --
	-------------------------------------
	BUFG_inst3 : BUFG
   port map (
      O => SRAM_clk_out, 
      I => glb_clk_s  
   );
   
	-------------------------------------
	-- System Clock (200 MHz) BUFG --
	-------------------------------------
	BUFG_inst4 : BUFG
   port map (
      O => glb_clk, 
      I => glb_clk_s  
   );
	
	BUFG_inst5 : BUFG
   port map (
      O => glb_clk_180, 
      I => glb_clk_180_s  
   );
	
	-------------------------------------
	-- System Clock (400 MHz) BUFG --
	-------------------------------------
	BUFG_inst6 : BUFG
   port map (
      O => sig_clk_400Mhz, 
      I => sig_clk_400Mhz_s  
   );
	
-- Power supply Component instantiation

			POWER : POWER_SEQUENCE
				
				port map(	
								P_OTP1 						=> OFF_SEQ_result_temp,		
								P_RESET						=>	g_reset,
								--P_RCI						=> P_RCI_temp,
								P_GLOBAL_CLK				=> glb_clk,
								P_ENABLE1_1					=>	ENABLE1_1,
								P_ENABLE1_2					=>	ENABLE1_2,
								P_ENABLE1_3					=>	ENABLE1_3,
								P_ENABLE1_4					=>	ENABLE1_4,
								P_ENABLE1_5					=> ENABLE1_5,	
								P_ENABLE1_6					=>	en_done,
								P_SYNC						=> SYNC
						);

-- Debouncing Component Instantiation for Power OFF Sequence Increament	

				Deb_OFF_Seq : 	PS_DEBOUNCE
				port map( 	
								 clk  					=> glb_clk ,   				
								 button  				=> POWER_OFF_SEQ,
								 tig_mod_rst	 		=> g_reset ,
								 result  				=> OFF_SEQ_result_temp
							);	

-- Schedular Module(Mini Schedular) 

			Mini_SCH : Mini_Schedular
				Port Map( 
							  SC_GLOBAL_CLK 			=>	glb_clk,
							  RESET_IN 				   => g_reset,
							  TEST_BEAM_NO 		   =>	sig_beam_no,
							  Tx_CONTROL_STATIC 	   => open,
							  Tx_CONTROL_DYNAMIC    => Sig_DYNAMIC_control,
							  enable_done2			   => en_done
							 );                     
			


 							
--DAC Module

 DAC : DAC_Module 
		port map( 
						 DAC_GLOBAL_CLK 		=> sig_clk_400Mhz,--glb_clk,
						 DAC_MOD_RST 			=> g_reset,
						 DAC_CLOCK_122_88		=> SIG_CLOCK_122_88,
						 DAC_data_present		=> tp_sig,
						 DAC_Data				=> sig_DAC_data,
						 DAC_WRT_A				=> sig_WRT_A,	
						 DAC_enable_done5		=> en_done		
					);


-- IC AD9279 Component instantiation	
			IC_AD9279_mod : AD_module

				port map(	 
								AD_GLOBAL_CLK 				=> glb_clk,
								AD_MOD_RST 					=>	g_reset,
								AD_SDIO		 				=>	SDIO_temp,
								AD_CSB						=> CSB_temp,
								AD_CLK_25Mhz				=> CLK_25Mhz_temp,
								AD_prog_done				=> prog_done,
--								AD_DYNAMIC_CONFIG 		=> ,
								enable_done4				=> en_done,
								data_readback				=> SIG_RCI_testing
						);


-- LVDS signal Component   instantiation of IC AD9279
 
LVDS_interface : lvds_adc_interface                 
				
				Port map (                                        
								global_clk  				=> glb_clk,
								reset                   => g_reset,
								ADC_FCO                 => ADC_FCO,
								ADC_DCO                 => ADC_DCO,
								ADC_OUT_CH1             => ADC_OUT_CH1_BUFDS,
								ADC_OUT_CH2             => ADC_OUT_CH2_BUFDS,
								ADC_OUT_CH3             => ADC_OUT_CH3_BUFDS,
								ADC_OUT_CH4             => ADC_OUT_CH4_BUFDS,
								ADC_OUT_CH5             => ADC_OUT_CH5_BUFDS,
								ADC_OUT_CH6             => ADC_OUT_CH6_BUFDS,
								ADC_OUT_CH7             => ADC_OUT_CH7_BUFDS,
								ADC_OUT_CH8             => ADC_OUT_CH8_BUFDS,
							   adc_datavalid           => SIG_ADC_DATAVALID,
								ADC_DATA_CH1            => SIG_LVDS_DATA_IN_CH1,
								ADC_DATA_CH2            => SIG_LVDS_DATA_IN_CH2,
								ADC_DATA_CH3            => SIG_LVDS_DATA_IN_CH3,
								ADC_DATA_CH4            => SIG_LVDS_DATA_IN_CH4,
								ADC_DATA_CH5            => SIG_LVDS_DATA_IN_CH5,
								ADC_DATA_CH6            => SIG_LVDS_DATA_IN_CH6,
								ADC_DATA_CH7            => SIG_LVDS_DATA_IN_CH7,
								ADC_DATA_CH8            => SIG_LVDS_DATA_IN_CH8
								      
							 ); 
						 
							 
-- RAW signal to source signal generation using buffering

---------------------------------------------------------------------------------
-- conversion for FCO  
---------------------------------------------------------------------------------

   IBUFDS_inst01 : IBUFDS
   generic map (
      IOSTANDARD => "DEFAULT")
   port map (
      O => ADC_FCO_BUFGDS,  -- Clock buffer output
      I => FCO_P,  -- Diff_p clock buffer input
      IB => FCO_N -- Diff_n clock buffer input
   );

   BUFIO_inst0 : BUFIO
   port map (
      O => ADC_FCO_BUFIO,--ADC_FCO, --ADC_FCO_BUFIO,     -- Clock buffer output
      I => ADC_FCO_BUFGDS      -- Clock buffer input
   );

	BUFR_inst0 : BUFR
   generic map (
      BUFR_DIVIDE => "BYPASS",   -- "BYPASS", "1", "2", "3", "4", "5", "6", "7", "8" 
      SIM_DEVICE => "VIRTEX5")   -- Specify target device, "VIRTEX4", "VIRTEX5", "VIRTEX6" 
   port map (
      O => ADC_FCO,     -- Clock buffer output
      CE => '1',   -- Clock enable input
      CLR => '0', -- Clock buffer reset input
      I => ADC_FCO_BUFIO      -- Clock buffer input
   );

--------------------------------------------------------------------------------
-- conversion for DCO
---------------------------------------------------------------------------------  

   IBUFDS_inst11 : IBUFDS
   generic map (
      IOSTANDARD => "DEFAULT")
   port map (
      O => ADC_DCO_BUFGDS,  -- Clock buffer output
      I => DCO_P,  -- Diff_p clock buffer input
      IB => DCO_N -- Diff_n clock buffer input
   );

   BUFIO_inst1 : BUFIO
   port map (
      O => ADC_DCO_BUFIO,     --ADC_DCO,--  Clock buffer output
      I => ADC_DCO_BUFGDS      -- Clock buffer input
   );

	BUFR_inst1 : BUFR
   generic map (
      BUFR_DIVIDE => "BYPASS",   -- "BYPASS", "1", "2", "3", "4", "5", "6", "7", "8" 
      SIM_DEVICE => "VIRTEX5")   -- Specify target device, "VIRTEX4", "VIRTEX5", "VIRTEX6" 
   port map (
      O => ADC_DCO,     -- Clock buffer output
      CE => '1',   -- Clock enable input
      CLR => '0', -- Clock buffer reset input
      I => ADC_DCO_BUFIO      -- Clock buffer input
   );

    --Differential Data line1 
     IBUFDS_inst1 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_OUT_CH1_BUFDS,  -- Clock buffer output
        I =>  CH1_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => CH1_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line2 
     IBUFDS_inst2 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_OUT_CH2_BUFDS,  -- Clock buffer output
        I =>  CH2_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => CH2_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line3 
     IBUFDS_inst3 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_OUT_CH3_BUFDS,  -- Clock buffer output
        I => CH3_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => CH3_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line4 
     IBUFDS_inst4 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_OUT_CH4_BUFDS,  -- Clock buffer output
        I => CH4_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => CH4_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line5 
     IBUFDS_inst5 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_OUT_CH5_BUFDS,  -- Clock buffer output
        I => CH5_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => CH5_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line6 
     IBUFDS_inst6 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_OUT_CH6_BUFDS,  -- Clock buffer output
        I => CH6_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => CH6_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line7 
     IBUFDS_inst7 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_OUT_CH7_BUFDS,  -- Clock buffer output
        I => CH7_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => CH7_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line8 
     IBUFDS_inst8 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_OUT_CH8_BUFDS,  -- Clock buffer output
        I => CH8_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => CH8_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 



sel <= "000" when g_reset = '1' else
		 SIG_RCI_FLEx_GAIN_PGA(2 downto 0); 


------------------------------------------------------		
-- input buffered RAM for LVDS signals---
LVDS_in_buff_ch1 : lvds_in_buff
  PORT MAP (
    rst 		=> g_reset,
    wr_clk 	=> ADC_DCO,
    rd_clk 	=> sig_clk_400Mhz,
    din 		=> source_counter(11 downto 0),--SIG_LVDS_DATA_IN_CH1,
    wr_en 	=> lvds_fifo_wr_en,
    rd_en 	=> sig_read_en_LVDS_fifo1,
    dout 	=> LVDS_dout_ch1,
    full 	=> lvds_fifo_full1,
    empty 	=> LVDS_fifo_empty1,
    valid 	=> LVDS_fifo_data_valid1
  );

LVDS_in_buff_ch2 : lvds_in_buff
  PORT MAP (
    rst 		=> g_reset,
    wr_clk 	=> ADC_DCO,
    rd_clk 	=> sig_clk_400Mhz,
    din 		=> SIG_LVDS_DATA_IN_CH2,
    wr_en 	=> lvds_fifo_wr_en,
    rd_en 	=> sig_read_en_LVDS_fifo2,
    dout 	=> LVDS_dout_ch2,
    full 	=> lvds_fifo_full2,
    empty 	=> LVDS_fifo_empty2,
    valid 	=> LVDS_fifo_data_valid2
  );
  
LVDS_in_buff_ch3 : lvds_in_buff
  PORT MAP (
    rst 		=> g_reset,
    wr_clk 	=> ADC_DCO,
    rd_clk 	=> sig_clk_400Mhz,
    din 		=> SIG_LVDS_DATA_IN_CH3,
    wr_en 	=> lvds_fifo_wr_en,
    rd_en 	=> sig_read_en_LVDS_fifo3,
    dout 	=> LVDS_dout_ch3,
    full 	=> lvds_fifo_full3,
    empty 	=> LVDS_fifo_empty3,
    valid 	=> LVDS_fifo_data_valid3
  );  

LVDS_in_buff_ch4 : lvds_in_buff
  PORT MAP (
    rst 		=> g_reset,
    wr_clk 	=> ADC_DCO,
    rd_clk 	=> sig_clk_400Mhz,
    din 		=> SIG_LVDS_DATA_IN_CH4,
    wr_en 	=> lvds_fifo_wr_en,
    rd_en 	=> sig_read_en_LVDS_fifo4,
    dout 	=> LVDS_dout_ch4,
    full 	=> lvds_fifo_full4,
    empty 	=> LVDS_fifo_empty4,
    valid 	=> LVDS_fifo_data_valid4
  );
  
LVDS_in_buff_ch5 : lvds_in_buff
  PORT MAP (
    rst 		=> g_reset,
    wr_clk 	=> ADC_DCO,
    rd_clk 	=> sig_clk_400Mhz,
    din 		=> SIG_LVDS_DATA_IN_CH5,
    wr_en 	=> lvds_fifo_wr_en,
    rd_en 	=> sig_read_en_LVDS_fifo5,
    dout 	=> LVDS_dout_ch5,
    full 	=> lvds_fifo_full5,
    empty 	=> LVDS_fifo_empty5,
    valid 	=> LVDS_fifo_data_valid5
  );

LVDS_in_buff_ch6 : lvds_in_buff
  PORT MAP (
    rst 		=> g_reset,
    wr_clk 	=> ADC_DCO,
    rd_clk 	=> sig_clk_400Mhz,
    din 		=> SIG_LVDS_DATA_IN_CH6,
    wr_en 	=> lvds_fifo_wr_en,
    rd_en 	=> sig_read_en_LVDS_fifo6,
    dout 	=> LVDS_dout_ch6,
    full 	=> lvds_fifo_full6,
    empty 	=> LVDS_fifo_empty6,
    valid 	=> LVDS_fifo_data_valid6
  );
  
LVDS_in_buff_ch7 : lvds_in_buff
  PORT MAP (
    rst 		=> g_reset,
    wr_clk 	=> ADC_DCO,
    rd_clk 	=> sig_clk_400Mhz,
    din 		=> SIG_LVDS_DATA_IN_CH7,
    wr_en 	=> lvds_fifo_wr_en,
    rd_en 	=> sig_read_en_LVDS_fifo7,
    dout 	=> LVDS_dout_ch7,
    full 	=> lvds_fifo_full7,
    empty 	=> LVDS_fifo_empty7,
    valid 	=> LVDS_fifo_data_valid7
  );  

LVDS_in_buff_ch8 : lvds_in_buff
  PORT MAP (
    rst 		=> g_reset,
    wr_clk 	=> ADC_DCO,
    rd_clk 	=> sig_clk_400Mhz,
    din 		=> SIG_LVDS_DATA_IN_CH8,
    wr_en 	=> lvds_fifo_wr_en,
    rd_en 	=> sig_read_en_LVDS_fifo8,
    dout 	=> LVDS_dout_ch8,
    full 	=> lvds_fifo_full8,
    empty 	=> LVDS_fifo_empty8,
    valid 	=> LVDS_fifo_data_valid8
  );  



--lvds_fifo_wr_en1 <= (SIG_ADC_DATAVALID or SIG_ADC_DATAVALID_s or SIG_ADC_DATAVALID_s1);

--process (ADC_DCO,g_reset,USB_flagb) 
--begin
--	if rising_edge(ADC_DCO) then
--			if(g_reset = '1') then 
--				LVDS_fifo_rd_en <= '0';
--				SIG_ADC_DATAVALID_s <= '0';
----				SIG_ADC_DATAVALID_s1 <= '0';
--			else
--			   SIG_ADC_DATAVALID_s <= SIG_ADC_DATAVALID;
----				SIG_ADC_DATAVALID_s1 <= SIG_ADC_DATAVALID_s;
----				
----				if(USB_flagb = '0' and LVDS_fifo_empty = '0') then
----					LVDS_fifo_rd_en <= '1';
----				else
----					LVDS_fifo_rd_en <= '0';
----				end if;	
--			end if;
--	end if;
--end process;	
  
--Process Block instantiation for Channel 1 --

 Process_Block_1 : Module_Process_Block_CH1
				port map(	
								CLK_400MHZ 					=> sig_clk_400Mhz,
								Module_RST					=>	g_reset,
								Data_present 				=> LVDS_fifo_data_valid1, --SIG_ADC_DATAVALID,
								FIFO_RD_enable1			=> sig_read_en_LVDS_fifo1,
								FIFO_empty_ch1				=> LVDS_fifo_empty1,
								FP_in							=> X"01", --SIG_RCI_Focal_point,
								PB_DATA_in					=> LVDS_dout_ch1,
								PB_DATA_out					=> SIG_PB_DATA_OUT_CH1,
								PB_data_tick_out			=> SIG_PB_data_tick1
						);

--Process Block instantiation for Channel 2 --

	 Process_Block_2 : Module_Process_Block_CH2
				port map(	
								CLK_400MHZ 					=> sig_clk_400Mhz,
								Module_RST					=>	g_reset,
								Data_present 				=> '0',--SIG_ADC_DATAVALID,
								FIFO_RD_enable2				=> sig_read_en_LVDS_fifo2,
								FIFO_empty_ch2				=> LVDS_fifo_empty2,
								FP_in							=> X"01", --SIG_RCI_Focal_point,
								PB_DATA_in					=> LVDS_dout_ch2,
								PB_DATA_out					=> SIG_PB_DATA_OUT_CH2,
								PB_data_tick_out			=> SIG_PB_data_tick2
						);                            

--Process Block instantiation for Channel 3 --

	 Process_Block_3 : Module_Process_Block_CH3
				port map(	
								CLK_400MHZ 					=> sig_clk_400Mhz,	
								Module_RST					=>	g_reset,	
							Data_present 	         => '0',--SIG_ADC_DATAVALID,
                        FIFO_RD_enable3				=> sig_read_en_LVDS_fifo3,
								FIFO_empty_ch3				=> LVDS_fifo_empty3,								
								FP_in							=> X"01", --SIG_RCI_Focal_point,	
								PB_DATA_in					=> LVDS_dout_ch3,	
								PB_DATA_out					=> SIG_PB_DATA_OUT_CH3,
								PB_data_tick_out			=> SIG_PB_data_tick3	
						);

--Process Block instantiation for Channel 4 --
	
	 Process_Block_4 : Module_Process_Block_CH4
				port map(	
								CLK_400MHZ 					=> sig_clk_400Mhz,
								Module_RST		         =>	g_reset,
								Data_present 	         => '0', --SIG_ADC_DATAVALID,
								FIFO_RD_enable4				=> sig_read_en_LVDS_fifo4,
								FIFO_empty_ch4				=> LVDS_fifo_empty4,
								FP_in				         => SIG_RCI_Focal_point,
								PB_DATA_in		         => SIG_LVDS_DATA_IN_CH4,
								PB_DATA_out		         => SIG_PB_DATA_OUT_CH4,
								PB_data_tick_out			=> SIG_PB_data_tick4
						);

--Process Block instantiation for Channel 5 --

	 Process_Block_5 : Module_Process_Block_CH5
				port map(	
								CLK_400MHZ 					=> sig_clk_400Mhz,
								Module_RST		         =>	g_reset,
								Data_present 	         => '0', --SIG_ADC_DATAVALID,
								FIFO_RD_enable5				=> sig_read_en_LVDS_fifo5,
								FIFO_empty_ch5				=> LVDS_fifo_empty5,
								FP_in				         => SIG_RCI_Focal_point,
								PB_DATA_in		         => SIG_LVDS_DATA_IN_CH5,
								PB_DATA_out		         => SIG_PB_DATA_OUT_CH5,
								PB_data_tick_out			=> SIG_PB_data_tick5
						);

--Process Block instantiation for Channel 6 --

	 Process_Block_6 : Module_Process_Block_CH6
				port map(	
								CLK_400MHZ 					=> sig_clk_400Mhz,
								Module_RST		         =>	g_reset,
								Data_present 	         => '0', --SIG_ADC_DATAVALID,
								FIFO_RD_enable6				=> sig_read_en_LVDS_fifo6,
								FIFO_empty_ch6				=> LVDS_fifo_empty6,
								FP_in				         => SIG_RCI_Focal_point,
								PB_DATA_in		         => SIG_LVDS_DATA_IN_CH6,
								PB_DATA_out		         => SIG_PB_DATA_OUT_CH6,
								PB_data_tick_out			=> SIG_PB_data_tick6
						);

--Process Block instantiation for Channel 7 --

	 Process_Block_7 : Module_Process_Block_CH7
				port map(	
								CLK_400MHZ 					=> sig_clk_400Mhz,
								Module_RST		         =>	g_reset,
								Data_present 	         => '0', --SIG_ADC_DATAVALID,
								FIFO_RD_enable7				=> sig_read_en_LVDS_fifo7,
								FIFO_empty_ch7				=> LVDS_fifo_empty7,
								FP_in				         => SIG_RCI_Focal_point,
								PB_DATA_in		         => SIG_LVDS_DATA_IN_CH7,
								PB_DATA_out		         => SIG_PB_DATA_OUT_CH7,
								PB_data_tick_out			=> SIG_PB_data_tick7
						);

--Process Block instantiation for Channel 8 --

	 Process_Block_8 : Module_Process_Block_CH8
				port map(	
								CLK_400MHZ 					=> sig_clk_400Mhz,
								Module_RST		         =>	g_reset,
								Data_present 	         => '0', --SIG_ADC_DATAVALID,
								FIFO_RD_enable8				=> sig_read_en_LVDS_fifo8,
								FIFO_empty_ch8				=> LVDS_fifo_empty8,
								FP_in				         => SIG_RCI_Focal_point,
								PB_DATA_in		         => SIG_LVDS_DATA_IN_CH8,
								PB_DATA_out		         => SIG_PB_DATA_OUT_CH8,
								PB_data_tick_out			=> SIG_PB_data_tick8
						);

--Channel Adder Module instantiation--

--	Channel_Adder : process_adder 
--				port map( 
--								ADD_GLOBAL_CLK 			=> sig_clk_400Mhz,
--								ADD_mod_RST	 				=>	g_reset,
--								ADD_present3				=>	SIG_PB_data_tick1,
--								ADD_in_CH1   				=>	SIG_PB_DATA_OUT_CH1,
--								ADD_in_CH2   				=>	SIG_PB_DATA_OUT_CH2,
--								ADD_in_CH3   				=>	SIG_PB_DATA_OUT_CH3,
--								ADD_in_CH4   				=>	SIG_PB_DATA_OUT_CH4,
--								ADD_in_CH5   				=>	SIG_PB_DATA_OUT_CH5,
--								ADD_in_CH6   				=>	SIG_PB_DATA_OUT_CH6,
--								ADD_in_CH7   				=>	SIG_PB_DATA_OUT_CH7,
--								ADD_in_CH8   				=>	SIG_PB_DATA_OUT_CH8,
--								Adder_data_tick 			=> SIG_out_adder_data_tick,
--								ADD_FinAL_out				=>	SIG_ADD_DATA_OUT
--					);

	adc_deci_i1 : adc_data_decimator
				port map (
							clk_in => sig_clk_400Mhz,
							rst_in => g_reset,
							pb_data_tick => SIG_PB_data_tick1,
							decimation_factor => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in => SIG_PB_DATA_OUT_CH1,
							decimated_data_out => deci_data_out_CH1,
							decimated_data_valid => deci_data_valid_CH1
							);
							
	adc_deci_i2 : adc_data_decimator
				port map (
							clk_in => sig_clk_400Mhz,
							rst_in => g_reset,
							pb_data_tick => SIG_PB_data_tick2,
							decimation_factor => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in => SIG_PB_DATA_OUT_CH2,
							decimated_data_out => deci_data_out_CH2,
							decimated_data_valid => deci_data_valid_CH2
							);
	adc_deci_i3 : adc_data_decimator
				port map (
							clk_in => sig_clk_400Mhz,
							rst_in => g_reset,
							pb_data_tick => SIG_PB_data_tick3,
							decimation_factor => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in => SIG_PB_DATA_OUT_CH3,
							decimated_data_out => deci_data_out_CH3,
							decimated_data_valid => deci_data_valid_CH3
							);
	adc_deci_i4 : adc_data_decimator
				port map (
							clk_in => sig_clk_400Mhz,
							rst_in => g_reset,
							pb_data_tick => SIG_PB_data_tick4,
							decimation_factor => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in => SIG_PB_DATA_OUT_CH4,
							decimated_data_out => deci_data_out_CH4,
							decimated_data_valid => deci_data_valid_CH4
							);
	adc_deci_i5 : adc_data_decimator
				port map (
							clk_in => sig_clk_400Mhz,
							rst_in => g_reset,
							pb_data_tick => SIG_PB_data_tick5,
							decimation_factor => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in => SIG_PB_DATA_OUT_CH5,
							decimated_data_out => deci_data_out_CH5,
							decimated_data_valid => deci_data_valid_CH5
							);
	adc_deci_i6 : adc_data_decimator
				port map (
							clk_in => sig_clk_400Mhz,
							rst_in => g_reset,
							pb_data_tick => SIG_PB_data_tick6,
							decimation_factor => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in => SIG_PB_DATA_OUT_CH6,
							decimated_data_out => deci_data_out_CH6,
							decimated_data_valid => deci_data_valid_CH6
							);
	adc_deci_i7 : adc_data_decimator
				port map (
							clk_in => sig_clk_400Mhz,
							rst_in => g_reset,
							pb_data_tick => SIG_PB_data_tick7,
							decimation_factor => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in => SIG_PB_DATA_OUT_CH7,
							decimated_data_out => deci_data_out_CH7,
							decimated_data_valid => deci_data_valid_CH7
							);
	adc_deci_i8 : adc_data_decimator
				port map (
							clk_in => sig_clk_400Mhz,
							rst_in => g_reset,
							pb_data_tick => SIG_PB_data_tick8,
							decimation_factor => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in => SIG_PB_DATA_OUT_CH8,
							decimated_data_out => deci_data_out_CH8,
							decimated_data_valid => deci_data_valid_CH8
							);							

	Adder_i : adder 
				port map( 
								clk 			=> sig_clk_400Mhz,
								rst	 		=>	g_reset,
								ce				=>	deci_data_valid_CH1,
								din1   		=>	deci_data_out_CH1,
								din2   		=>	deci_data_out_CH2,
								din3   		=>	deci_data_out_CH3,
								din4   		=>	deci_data_out_CH4,
								din5   		=>	deci_data_out_CH5,
								din6   		=>	deci_data_out_CH6,
								din7   		=>	deci_data_out_CH7,
								din8   		=>	deci_data_out_CH8,
								data_valid	=> SIG_out_adder_data_tick,
								dout			=>	SIG_ADD_DATA_OUT
					);

-- Input Write (16 x 16) Register Module instantiation--
--	SRAM_WR_REG : register_sram_wr                                                         
--				port map( 
--								glb_clk1                => sig_clk_400Mhz,
--								glb_clk2                => glb_clk,
--								g_reset                 => g_reset,
--								data_available				=> SIG_out_adder_data_tick,
--								rd_en							=> sram_wr_data_rd_en,
--								data_in              	=> SIG_ADD_DATA_OUT,
--								data_out						=> SIG_WR_REG_DATA,
--								data_tick					=> SIG_WR_REG_DATA_TICK
--					);  

	SRAM_wr_data_i : sram_wr_fifo
				port map (
							 glb_clk1       		=> sig_clk_400Mhz,
				          glb_clk2            => glb_clk_180,
				          g_reset             => g_reset,
				          data_available	   => SIG_out_adder_data_tick,
				          rd_en				   => sram_wr_data_rd_en,
							 adc_data_tick			=> SIG_WR_REG_DATA_TICK,
				          data_in             =>SIG_ADD_DATA_OUT,
				          data_out			   => SIG_WR_REG_DATA,
				          data_valid		      => open, --sram_wr_data_valid,
				          sram_fifo_full		=> open, --sram_wr_data_fifo_full,
				          sram_fifo_empty		=> sram_wr_data_fifo_empty
							);
		

-- SRAM Scheduler Module instantiation--
	SRAM_Schedular_i : SRAM_Schedular
				port map(
								glb_clk						=>	glb_clk,      
								g_reset      				=> g_reset,      
								ADC_ready					=> SIG_WR_REG_DATA_TICK,
								start_adc_acqn				=> '1', -- From RCI/ADC module --
								Wr_done						=> SIG_Sch_Wr_done,		
								Rd_done						=> SIG_Sch_Rd_done_s,
								sram_wr_data_rd_en	   => sram_wr_data_rd_en1,	
								Wr_en							=> SIG_Sch_Wr_en,			
								Rd_en							=> SIG_Sch_Rd_en,			
								usb_fifo_full				=> sig_usb_fifo_full,
								decimation_factor	      => SIG_RCI_Decimation_FACTOR(1 downto 0),
								sram_fifo_empty			=> sram_wr_data_fifo_empty,
								footer_tick					=> SIG_footer_tick,
								SRAM_full					=> SIG_Sch_SRAM_full,	
								SRAM_empty					=> SIG_Sch_SRAM_empty,	
								SRAM_Addr_R_W				=> SIG_Sch_Addr_R_W
					);

	--SRAM_clk_out <= glb_clk;
	sram_wr_data_rd_en <= sram_wr_data_rd_en1 and (not(SRAM_adv_n_s) or (not(SRAM_adsc_n_s)));
	--sram_wr_data_rd_en <= sram_wr_data_rd_en1;
	SRAM_adv_n <= SRAM_adv_n_s;
	SRAM_adsc_n <= SRAM_adsc_n_s;
	
-- SRAM Controller Interface Module instantiation--
	SRAM_Controller : sram_interface			
				port map(  
								clk_in          			=>	glb_clk,
								rst_in			  			=> g_reset,	
								-- SRAM interface --
								--sram_clk_out    			=>	open,       
								mode            			=> open, --SRAM_mode,      
								addr           			=> SRAM_addr,	
								adv_n           			=> SRAM_adv_n_s,			 
								adsp_n          			=> SRAM_adsp_n,		                               
								adsc_n          			=> SRAM_adsc_n_s,			                              
								ce_n            			=> SRAM_ce_n,			                               
								ce2             		   => SRAM_ce2,                            
								ce2_n           			=> SRAM_ce2_n,	                                
								bwa_n           			=> SRAM_bwa_n,	                               
								bwb_n           			=> SRAM_bwb_n,
								bwc_n           			=> SRAM_bwc_n,	         
								bwd_n           			=> SRAM_bwd_n,	
								oe_n            			=> SRAM_oe_n,         
								global_wr_n     			=> SRAM_global_wr_n,	         
								bwe_n           			=> SRAM_bwe_n,	         
								zz              			=> SRAM_zz,
								DQ              			=> SRAM_DQ,
								-- Schedular interface --
								wr_en				 			=>	SIG_Sch_Wr_en,      
								rd_en							=> SIG_Sch_Rd_en,      
								wr_done				 		=> SIG_Sch_Wr_done,	
								rd_done				 		=> SIG_Sch_Rd_done_s,		
								sram_addrs_in     		=> SIG_Sch_Addr_R_W,		
								sram_wr_data_in   		=> SIG_WR_REG_DATA,			
								sram_rd_data_out  		=> SIG_RD_dec_DATA,			
								sram_rd_data_valid		=> SIG_SRAM_RD_data_valid
					);    

	--SIG_Sch_Rd_done <= SIG_Sch_Rd_done_s;
  
-- Decimation Selector and Adder Module         
--	decimator : sram_data_decimator
--				port map( 	
--								clk_in 						=> glb_clk,
--								rst_in 						=> g_reset,
--								sram_data_valid 			=> SIG_SRAM_RD_data_valid,
--								decimation_factor 		=> SIG_RCI_Decimation_FACTOR(1 downto 0),
--								sram_data_in 				=> SIG_RD_dec_DATA(15 downto 0),
--								decimated_data_out 		=> SIG_DEC_OUT_DATA,
--								decimated_data_valid 	=>	SIG_DEC_OUT_DATA_VALID
--					);

-- Output Read (16 x 16) Register Module instantiation--		
--	SRAM_RD_REG : register_sram_rd                                                         
--				port map( 
--								glb_clk1  					=> glb_clk,
--								glb_clk2                => USB_CLKIN_sig,
--								g_reset      				=> g_reset,
--								data_available				=> SIG_DEC_OUT_DATA_VALID,
--								rd_addr_in        		=> SIG_REG_ADDR_SEL,
--								data_in     				=> SIG_DEC_OUT_DATA,
--								data_out						=> SIG_RD_REG_OUT_DATA,
--								data_tick					=> SIG_RD_REG_OUT_DATA_TICK
--					); 	
	
-- SRAM/USB FIFO Module --
	sram_usb_fifo_i : sram_usb_fifo
		port map
				(
					wr_clk         	=>	glb_clk,
					rd_clk         	=> USB_CLKIN_sig,
					g_reset        	=> g_reset,
					fifo_wr_en			=> SIG_SRAM_RD_data_valid, --SIG_DEC_OUT_DATA_VALID,
					fifo_data_in   	=> SIG_RD_dec_DATA(15 downto 0), --SIG_DEC_OUT_DATA,
					fifo_rd_en			=> usb_fifo_rd_en,
					usb_fifo_full		=> sig_usb_fifo_full,
					usb_fifo_empty		=> sig_usb_fifo_empty,
					fifo_data_out		=> SIG_RD_REG_OUT_DATA,
					fifo_data_valid	=>	sig_usb_fifo_data_valid
				);

	
-- USB Inteface Module Instantiation--
	

	USB_Interface_controller : usb_controller
				port map(
							   gclk 	     				=> glb_clk,
								usb_48_MHZ 				=> USB_CLKIN_sig,	
								g_reset  				=> g_reset,
								header_footer_tick  	=> SIG_footer_tick,-- "0"
								usb_fifo_empty		  	=> '0',--sig_usb_fifo_empty,--LVDS_fifo_empty
								usb_fifo_data_valid	=> '1',--sig_usb_fifo_data_valid,--LVDS_fifo_data_valid, --
								usb_data_in   			=> source_counter,--SIG_RD_REG_OUT_DATA,--mux_out, --
								usb_fifo_rd_en			=> usb_fifo_rd_en,
								usb_Beam_no_in			=> sig_beam_no,
								usb_start				=>	usb_start,
								flagb        			=> USB_flagb,
								flagc        			=> USB_flagc,
								sloe_i      			=> USB_sloe_i,
								slrd_i       			=> USB_slrd_s,
								slwr_i       			=> USB_slwr_s,
								fddr_i         		=> USB_fddr_i,
								usb_data_out      	=> USB_usb_data_out_s
								
							);	

--RCI Module Interface

RCI_MOD : RCI_Module 
				port map( 

						--  Clock & Reset Signals
								RCI_Global_clk	        	=> glb_clk,
								RCI_mod_rst      		  	=> g_reset,
							-- USB Controller Interface Operated in Asynchronous Mode      
								RCI_addr               	=> USB_RCI_addr,
								RCI_data               	=> USB_RCI_data,                              
								RCI_csb_n              	=> USB_RCI_csb_n,
								RCI_Wr_n               	=> USB_RCI_Wr_n,
								RCI_Rd_n               	=> USB_RCI_Rd_n,
								RCI_oe_n						=> USB_RCI_oe_n,
							-- ADC Module RCI Interface                                                   
								RCI_FLEx_GAIN_PGA			=>	SIG_RCI_FLEx_GAIN_PGA,			
							-- DAC Module RCI Interface                                  	                 
								RCI_DAC_SAMPLE1_LB 		=>	SIG_RCI_DAC_SAMPLE1_LB, 		
								RCI_DAC_SAMPLE1_HB 		=>	SIG_RCI_DAC_SAMPLE1_HB,		
								RCI_DAC_BASE_VALUE1_LB	=>	SIG_RCI_DAC_BASE_VALUE1_LB,	
								RCI_DAC_BASE_VALUE1_HB 	=>	SIG_RCI_DAC_BASE_VALUE1_HB, 	
								RCI_DAC_INCREMENT1		=>	SIG_RCI_DAC_INCREMENT1,			
								RCI_DAC_SAMPLE2_LB		=>	SIG_RCI_DAC_SAMPLE2_LB,			
								RCI_DAC_SAMPLE2_HB		=>	SIG_RCI_DAC_SAMPLE2_HB,			
								RCI_DAC_BASE_VALUE2_LB 	=>	SIG_RCI_DAC_BASE_VALUE2_LB, 	
								RCI_DAC_BASE_VALUE2_HB	=>	SIG_RCI_DAC_BASE_VALUE2_HB,	
								RCI_DAC_INCREMENT2 		=>	SIG_RCI_DAC_INCREMENT2, 		
								RCI_DAC_SAMPLE3_LB 		=>	SIG_RCI_DAC_SAMPLE3_LB, 		
								RCI_DAC_SAMPLE3_HB		=>	SIG_RCI_DAC_SAMPLE3_HB,			
								RCI_DAC_BASE_VALUE3_LB	=>	SIG_RCI_DAC_BASE_VALUE3_LB,	
								RCI_DAC_BASE_VALUE3_HB	=> SIG_RCI_DAC_BASE_VALUE3_HB,	
								RCI_DAC_INCREMENT3		=> SIG_RCI_DAC_INCREMENT3,		 	
								RCI_DAC_SAMPLE4_LB		=> SIG_RCI_DAC_SAMPLE4_LB,		 	
								RCI_DAC_SAMPLE4_HB		=> SIG_RCI_DAC_SAMPLE4_HB,		 	
								RCI_DAC_BASE_VALUE4_LB	=> SIG_RCI_DAC_BASE_VALUE4_LB,	
								RCI_DAC_BASE_VALUE4_HB	=> SIG_RCI_DAC_BASE_VALUE4_HB,	
								RCI_DAC_INCREMENT4 		=> SIG_RCI_DAC_INCREMENT4,		
								RCI_START_ACQUISITION	=>	SIG_RCI_START_ACQUISITION,		
								RCI_STOP_ACQUISITION		=> SIG_RCI_STOP_ACQUISITION,		
								RCI_BEAM_DELAY_LB	 	 	=>	SIG_RCI_BEAM_DELAY_LB,	 	 	
								RCI_BEAM_DELAY_HB		 	=>	SIG_RCI_BEAM_DELAY_HB,		 	
								RCI_FRAME_DELAY_LB		=> SIG_RCI_FRAME_DELAY_LB,		 	
								RCI_FRAME_DELAY_HB		=> SIG_RCI_FRAME_DELAY_HB,		 	
								RCI_Decimation_FACTOR	=>	SIG_RCI_Decimation_FACTOR,	
								
							-- Input/Output Interface RCI Registers 
					
					          
								RCI_fpga_status_flag		=>  SIG_RCI_fpga_status_flag,		
								RCI_fpga_Ver_build_date	=>  SIG_RCI_fpga_Ver_build_date,	
								RCI_fpga_Ver_build_month=>  SIG_RCI_fpga_Ver_build_month,
								RCI_fpga_Ver_build_year	=>  SIG_RCI_fpga_Ver_build_year,	
								RCI_fpga_Ver_build_number=> SIG_RCI_fpga_Ver_build_number,
								RCI_Power_supply			=>	 SIG_IG_RCI_Power_supply,			
								RCI_FPGA_SOFT_RESET		=>	 SIG_RCI_FPGA_SOFT_RESET,				
								RCI_Program_FPGA			=>	 SIG_RCI_Program_FPGA,
								RCI_TEST1               =>	 SIG_RCI_TEST1, 
								RCI_TEST2               =>	 SIG_RCI_TEST2 ,
								RCI_TEST3               =>	 SIG_RCI_TEST3 ,
								RCI_TEST4               =>	 SIG_RCI_TEST4, 
								RCI_TEST5               =>	 SIG_RCI_TEST5, 
								RCI_TEST6               =>	 SIG_RCI_TEST6, 
								RCI_TEST7               =>  SIG_RCI_TEST7, 
								RCI_TEST8               =>  SIG_RCI_TEST8, 
								RCI_TEST9               =>  SIG_RCI_TEST9, 
								RCI_TEST10              =>  SIG_RCI_TEST10,
								RCI_TEST11              =>  SIG_RCI_TEST11,
								RCI_TEST12              =>  SIG_RCI_TEST12,
								RCI_TEST13              =>  SIG_RCI_TEST13,
								RCI_TEST14              =>	 SIG_RCI_TEST14,
								RCI_TEST15              =>  SIG_RCI_TEST15,
								RCI_TEST16              =>	 SIG_RCI_TEST16,
								                        
							-- Transmitter Side Configurations RCI Register                                                 
								RCI_Focal_point 			=>	SIG_RCI_Focal_point 	
               );                              

i_control : icontrol2
  port map (
    CONTROL0 => control1_temp
	 );

logic_analyser : logicanalyser1
port map (

CLK => ADC_DCO,

DATA(11 downto 0) =>SIG_WR_REG_DATA(11 downto 0), 
DATA(27 downto 12) => source_counter,
DATA(28) => SIG_LVDS_DATA_IN_CH1(0),


TRIG0(0) => ADC_FCO,
TRIG0(1) => tp_sig,
CONTROL => control1_temp
);

--process(glb_clk,SIG_ADC_DATAVALID)
--begin
--		IF( rising_edge(glb_clk)) THEN
--			SIG_ADC_DATAVALID_s <= SIG_ADC_DATAVALID;
--			SIG_ADC_DATAVALID_s1 <= SIG_ADC_DATAVALID_s;
----			dco_count <= dco_count + '1';
--		END IF;
--END PROCESS;


--process(ADC_DCO,SIG_ADC_DATAVALID,Sig_DYNAMIC_control)
--begin
--		IF( rising_edge(ADC_DCO)) THEN
--			if (g_reset = '1' )then
--				fco_count <= (others => '0');
--				source_counter <= (others => '0');
--			else
--				if(SIG_ADC_DATAVALID = '1') then
--					LVDS_fifo_wr_en <= '1';
--					if(source_counter = x"1DD8" ) then --1E50
--						LVDS_fifo_wr_en <= '0';
--					else
--						source_counter <= source_counter + '1';
--						fco_count <= fco_count + '1';
--					end if;
--				else
--					LVDS_fifo_wr_en <= '0';
--					if(Sig_DYNAMIC_control = '1' ) then
--						source_counter <= (others => '0');
--						fco_count <= (others => '0');
--					end if;	
--				end if;	
--			end if;
--		END IF;	
--END PROCESS;
process(USB_CLKIN_sig,USB_slwr_s)
begin
		IF( falling_edge(USB_CLKIN_sig)) THEN
			if (g_reset = '1' )then
				
				source_counter <= (others => '0');
			else
				if( USB_flagb = '0' and usb_start = '1') then
					if (USB_slwr_s = '0') then
						if(source_counter < x"ffff") then --1E50
							source_counter <= source_counter + '1';
						else
							source_counter <= (others => '0');
						end if;	
					end if;
				end if;	
			end if;
				
		END IF;	
END PROCESS;


--process(ADC_FCO,SIG_ADC_DATAVALID,SIG_ADC_DATAVALID_s)
--begin
--		IF( falling_edge(ADC_FCO)) THEN
--			if (g_reset = '1' )then
--			   fco_count <= (others => '0');
--				source_counter <= (others => '0');
--				Sig_DYNAMIC_control_clr <= '0';
--				
--			elsif(Sig_DYNAMIC_control_latch = '1') then
--				source_counter <= (others => '0');
--				Sig_DYNAMIC_control_clr <= '1';
--			elsif(source_counter = x"1DD8" ) then--1E50
--				LVDS_fifo_wr_en <= '0';
--			   Sig_DYNAMIC_control_clr <= '0';
--			else
--				lvds_fifo_wr_en <='1';-- SIG_ADC_DATAVALID;-- or SIG_ADC_DATAVALID_s;-- or SIG_ADC_DATAVALID_s1 ;
--				fco_count <= fco_count + '1';
--				source_counter <= source_counter + '1';
--		
--			END IF;	
--		END IF;
--END PROCESS;



--process(glb_clk)
--begin
--		IF( rising_edge(glb_clk)) THEN
--			Sig_DYNAMIC_control_d <= Sig_DYNAMIC_control;
--		END IF;
--END PROCESS;	
--
-- MUX: process (prog_done,usb_start,g_reset)
-- begin
--	if (g_reset = '1') then
--		mux_out <= (others => '0');
--	else
--		if rising_edge (USB_CLKIN_sig) then
--			if (prog_done = '0') then 
--				mux_out <= X"F00F";
--			elsif (usb_start = '0') then 	
--				mux_out <= (others => '1');
--			else
--				mux_out <= SIG_RD_REG_OUT_DATA;
--			end if;
--		end if;
--end if;		
-- end process;	
 
tp <= tp_sig;
WRT_A <= sig_WRT_A;
USB_usb_data_out <= USB_usb_data_out_s;
USB_slwr_i <= USB_slwr_s;
USB_slrd_i <= USB_slrd_s;
DAC_out_data <= sig_DAC_data;

End Behav_Rx_side;