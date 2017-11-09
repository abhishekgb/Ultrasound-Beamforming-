
----------------------------------------------------------------------------------
-- Engineer: 	Abhishek Gubbi Basavaraj/Sayed Faizan Aliakbar 
-- 
-- Create Date:    10:30:57 07/30/2013 
-- Design Name: 	
-- Module Name:    Rxside_Top_module - Behav_Rx_side 
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
use ieee.std_logic_signed.all; 
--USE std.textio.all;
--USE ieee.std_logic_textio.all;
--Library UNISIM;
--use UNISIM.vcomponents.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with std_logic_vector or Unstd_logic_vector values


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponent  s.all;

entity Rxside_Top_module is
	generic(
	BIT_WIDTH_ADC_TOP           : integer     := 12;
	INPUT_BIT_WIDTH_TOP         : integer     := 16;
	OUTPUT_BIT_WIDTH_TOP        : integer     := 32
		);

     port (
				-- Clock interface                                               
						RM_glb_clk 							: in  std_logic;
						RM_glb_clk_180 					: in  std_logic;
						RM_glb_clk_400 					: in  std_logic; 		
            		RM_glb_Reset						: in  std_logic;
						RM_PS_EN								: in  std_logic;	
						
				-- AD9279 IC Programing interface	
						RM_ADC_SDIO							: inout  std_logic; 		--|This pin is the input/output for reading writing configurations. 
						RM_ADC_CSB							: out std_logic; 			-- Chip Select Bar	
						RM_ADC_CLK_25MHZ 					: out std_logic; 			-- SPI Clock operated at 25Mhz.	
						                         	
				--	LVDS interface from IC AD927	
						RM_ADC_FCO							: in  std_logic;			
						RM_ADC_DCO							: in  std_logic;		
						RM_ADC_CH1         				: in  std_logic;
						RM_ADC_CH2         				: in  std_logic;				
						RM_ADC_CH3     					: in  std_logic;				
						RM_ADC_CH4     					: in  std_logic;				
						RM_ADC_CH5     					: in  std_logic;	
						RM_ADC_CH6     	   			: in  std_logic;
						RM_ADC_CH7     					: in  std_logic;
						RM_ADC_CH8     					: in  std_logic;             	
				                           	      	
				-- DAC Interface Module        			
						RM_DAC_CLOCK_122_88				: in  std_logic;				
						RM_DAC_out_data					: out std_logic_vector(BIT_WIDTH_ADC_TOP-1   downto 0);				
						RM_DAC_WRT_A						: out std_logic;				
																	
				-- SRAM interface Module					
				                               			
						--RM_SRAM_clk_out    				: out std_logic; -- SRAM 200 MHz clock out --			 			
						--RM_SRAM_mode     				 : out std_logic;	      			
						RM_SRAM_addr       				: out std_logic_vector(18 downto 0); 	    	 			  
						RM_SRAM_adv_n      				: out std_logic;			 	      			
						RM_SRAM_adsp_n     				: out std_logic;                                	     			  
						RM_SRAM_adsc_n     				: out std_logic;                                	  				
						RM_SRAM_ce_n       				: out std_logic;                                	  				  
						RM_SRAM_ce2        				: out std_logic;                                	  				
						RM_SRAM_ce2_n      				: out std_logic;                                	  				  
						RM_SRAM_bwa_n      				: out std_logic;                                	 	   			
						RM_SRAM_bwb_n      				: out std_logic;  	 	   			  
						RM_SRAM_bwc_n      				: out std_logic;                                	 	   			
						RM_SRAM_bwd_n      				: out std_logic;			 	 	   			  
            		RM_SRAM_oe_n       				: out std_logic;                                 	  	
						RM_SRAM_global_wr_n				: out std_logic;                                	 	   
						RM_SRAM_bwe_n      				: out std_logic;                                 	   	
						RM_SRAM_zz         				: out std_logic;  	   	 	
						RM_SRAM_DQ         				: inout std_logic_vector(17 downto 0); 	   	
								
				--USB interface Module					
            		RM_USB_CLKIN_48_MHZ				: in  std_logic; 
						RM_USB_sloe_n      				: out std_logic;  			
						RM_USB_slrd_n      				: out std_logic;		    
						RM_USB_flagb        				: in  std_logic; 		   	
						RM_USB_flagc        				: in  std_logic; 		    
						RM_USB_start						: in std_logic;		    
						RM_USB_fddr_n         			: out std_logic_vector(1 downto 0);		    
						RM_USB_usb_data_out     		: out std_logic_vector(15 downto 0);		    
						RM_USB_slwr_n       				: out std_logic;		    
																    
				--RCI interface Module Operated in Asynchronous Mode	    
						RM_USB_RCI_addr       	 		: in std_logic_vector (7 downto 0);-- USB_RCI_ address 			    
						RM_USB_RCI_data        			: inout std_logic_vector (7 downto 0);                          		    
						RM_USB_RCI_csb_n       			: in std_logic ; 			    
						RM_USB_RCI_Wr_n        			: in std_logic ;			    
						RM_USB_RCI_Rd_n        			: in std_logic ;			    
						RM_USB_RCI_oe_n		 			: in std_logic ;			    
				          	
				-- OTHERS teSTING              	
						RM_tp									: out std_logic;
						RM_ADC_prog_done					: out std_logic;
						RM_Focal_point						: out std_logic_vector (7 downto 0);
						RM_Beam_No							: in  std_logic_vector (7 downto 0);
						RM_adc_ch1_op						: out std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0);
						RM_adc_ch2_op						: out std_logic_vector(15  downto 0);
						RM_adc_ch3_op						: out std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0);
						RM_adc_ch4_op						: out std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0);
						RM_adc_ch5_op						: out std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0);
						RM_adc_ch6_op						: out std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0);
						RM_adc_ch7_op						: out std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0);
						RM_adc_ch8_op						: out std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0);
						RM_adc_Adder_op					: out std_logic_vector(15 downto 0);
						RM_DAC_data_out					: out std_logic_vector (11 downto 0);
						RM_RCI_TEST							: inout std_logic_vector (7 downto 0);
						RM_trigger1							: out std_logic;
						RM_trigger2							: out std_logic;
						RM_Tx_Beam_EN						: in std_logic;
---------------------------- ONLY FOR CHIPSCOPE PURPOSE -------------------------------------
                  data_sine_counter_CHIPSCOPE  : out std_logic_vector(3 downto 0) := (others => '0');
			         lvds_fifo_full1_CHIPSCOPE    : out std_logic;
                  source_counter_CHIPSCOPE     : out std_logic_vector(15 downto 0)					
						
					);

End Rxside_Top_module;

Architecture Behav_Rx_side of Rxside_Top_module is

			---------------------------------------------------
							-- Signals Declaration
				---------------------------------------------------
-- AD9279 Module Signals 

signal SDIO_temp						:std_logic := '0';
signal CSB_temp						:std_logic := '0';
signal CLK_25Mhz_temp				:std_logic := '0';
signal prog_done						:std_logic := '0'; 

-- DAC Module signals


signal sig_DAC_out_data				: std_logic_vector(11 downto 0) := X"dac";
signal sig_WRT_A						:std_logic := '0';

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

signal SIG_LVDS_DATA_IN_CH1		: std_logic_vector(11  downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH2     	: std_logic_vector(11  downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH3     	: std_logic_vector(11  downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH4     	: std_logic_vector(11  downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH5     	: std_logic_vector(11  downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH6     	: std_logic_vector(11  downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH7     	: std_logic_vector(11  downto 0) := (others => '0');
signal SIG_LVDS_DATA_IN_CH8     	: std_logic_vector(11  downto 0) := (others => '0');

signal fco_count     				: std_logic_vector(11 downto 0) := (others => '0');
signal source_counter     			: std_logic_vector(15 downto 0) := (others => '0');
signal cosine_source_counter     : std_logic_vector(15 downto 0) := (others => '0');-- x"07FF";

signal data_counter     			: std_logic_vector(3 downto 0) := (others => '0');
signal data_sine_counter     		: std_logic_vector(7 downto 0) := (others => '0');
signal data_cosine_counter     	: std_logic_vector(15 downto 0) := (others => '0');
signal dco_count     				: std_logic_vector(11 downto 0) := (others => '0');

-- signals for the lvds input buffered SRAM--

signal LVDS_fifo_rd_en 			: std_logic:= '0';
signal LVDS_dout_ch1 			    : std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0) := (others => '0');
signal LVDS_dout_ch2				: std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0) := (others => '0');
signal LVDS_dout_ch3				: std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0) := (others => '0');
signal LVDS_dout_ch4				: std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0) := (others => '0');
signal LVDS_dout_ch5				: std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0) := (others => '0');
signal LVDS_dout_ch6				: std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0) := (others => '0');
signal LVDS_dout_ch7				: std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0) := (others => '0');
signal LVDS_dout_ch8				: std_logic_vector(BIT_WIDTH_ADC_TOP-1  downto 0) := (others => '0');
signal LVDS_fifo_full 			: std_logic:= '0';
signal LVDS_fifo_empty 			: std_logic:= '0';
signal LVDS_fifo_empty_d		: std_logic:= '0';

signal sig_wr_ack 				: std_logic := '0' ;
signal data_count 				: std_logic_vector ( 3 downto 0);
signal lvds_fifo_wr_en 			: std_logic:= '0';

signal SIG_ADC_DATAVALID_s 	: std_logic:= '0';
signal SIG_ADC_DATAVALID_s1 	: std_logic:= '0';

-- Channel Swithching logic Module

signal SW_data_valid 			: std_logic:= '0';
signal dat_int 			: std_logic_vector(2 downto 0):= "000";

signal SW_ADC_OUT_CH1 			    : std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0) := (others => '0');
signal SW_ADC_OUT_CH2				: std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0) := (others => '0');
signal SW_ADC_OUT_CH3				: std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0) := (others => '0');
signal SW_ADC_OUT_CH4				: std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0) := (others => '0');
signal SW_ADC_OUT_CH5				: std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0) := (others => '0');
signal SW_ADC_OUT_CH6				: std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0) := (others => '0');
signal SW_ADC_OUT_CH7				: std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0) := (others => '0');
signal SW_ADC_OUT_CH8				: std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0) := (others => '0');

signal source_counter1     			: std_logic_vector(15 downto 0) := (others => '0');
signal source_counter2     			: std_logic_vector(15 downto 0) := (others => '0');
signal source_counter3    			: std_logic_vector(15 downto 0) := (others => '0');
signal source_counter4     			: std_logic_vector(15 downto 0) := (others => '0');
signal source_counter5     			: std_logic_vector(15 downto 0) := (others => '0');
signal source_counter6     			: std_logic_vector(15 downto 0) := (others => '0');
signal source_counter7     			: std_logic_vector(15 downto 0) := (others => '0');
signal source_counter8     			: std_logic_vector(15 downto 0) := (others => '0');
-- ADC data decimator module signals --

-- Decimation Selector and Adder Module Signals 

signal SIG_DEC_OUT_DATA_VALID		: std_logic := '0';
signal SIG_DEC_OUT_DATA			   : std_logic_vector(15 downto 0) := (others => '0');
signal SIG_RD_dec_DATA			   : std_logic_vector(17 downto 0) := (others => '0'); 

signal deci_data_out_CH1 : std_logic_vector ( BIT_WIDTH_ADC_TOP -1 downto 0);		
signal deci_data_out_CH2 : std_logic_vector ( BIT_WIDTH_ADC_TOP -1 downto 0);    
signal deci_data_out_CH3 : std_logic_vector ( BIT_WIDTH_ADC_TOP -1 downto 0);    
signal deci_data_out_CH4 : std_logic_vector ( BIT_WIDTH_ADC_TOP -1 downto 0);    
signal deci_data_out_CH5 : std_logic_vector ( BIT_WIDTH_ADC_TOP -1 downto 0);    
signal deci_data_out_CH6 : std_logic_vector ( BIT_WIDTH_ADC_TOP -1 downto 0);    
signal deci_data_out_CH7 : std_logic_vector ( BIT_WIDTH_ADC_TOP -1 downto 0);    
signal deci_data_out_CH8 : std_logic_vector ( BIT_WIDTH_ADC_TOP -1 downto 0);    

signal sgn_ch1 :std_logic_vector ( OUTPUT_BIT_WIDTH_TOP -1 downto 0);		--signed  
signal sgn_ch2 :std_logic_vector ( OUTPUT_BIT_WIDTH_TOP -1 downto 0);      --signed 
signal sgn_ch3 :std_logic_vector ( OUTPUT_BIT_WIDTH_TOP -1 downto 0);      --signed 
signal sgn_ch4 :std_logic_vector ( OUTPUT_BIT_WIDTH_TOP -1 downto 0);      --signed 
signal sgn_ch5 :std_logic_vector ( OUTPUT_BIT_WIDTH_TOP -1 downto 0);      --signed 
signal sgn_ch6 :std_logic_vector ( OUTPUT_BIT_WIDTH_TOP -1 downto 0);      --signed 
signal sgn_ch7 :std_logic_vector ( OUTPUT_BIT_WIDTH_TOP -1 downto 0);      --signed 
signal sgn_ch8 :std_logic_vector ( OUTPUT_BIT_WIDTH_TOP -1 downto 0);      --signed 


signal deci_data_valid_CH1 : std_logic:= '0';
signal deci_data_valid_CH2 : std_logic:= '0';
signal deci_data_valid_CH3 : std_logic:= '0';
signal deci_data_valid_CH4 : std_logic:= '0';
signal deci_data_valid_CH5 : std_logic:= '0';
signal deci_data_valid_CH6 : std_logic:= '0';
signal deci_data_valid_CH7 : std_logic:= '0';
signal deci_data_valid_CH8 : std_logic:= '0';
signal deci_data_valid_CHall : std_logic:= '0';


-- Process Block Module signals
signal SIG_PB_DATA_OUT_CH1		: std_logic_vector(OUTPUT_BIT_WIDTH_TOP -1 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH2     	: std_logic_vector(OUTPUT_BIT_WIDTH_TOP -1 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH3     	: std_logic_vector(OUTPUT_BIT_WIDTH_TOP -1 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH4     	: std_logic_vector(OUTPUT_BIT_WIDTH_TOP -1 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH5     	: std_logic_vector(OUTPUT_BIT_WIDTH_TOP -1 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH6     	: std_logic_vector(OUTPUT_BIT_WIDTH_TOP -1 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH7     	: std_logic_vector(OUTPUT_BIT_WIDTH_TOP -1 downto 0) := (others => '0');
signal SIG_PB_DATA_OUT_CH8     	: std_logic_vector(OUTPUT_BIT_WIDTH_TOP -1 downto 0) := (others => '0');
signal sig_read_en_LVDS_fifo 		: std_logic:='1';
signal sig_read_en_LVDS_fifo1 		: std_logic:='1';
signal sig_read_en_LVDS_fifo2 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo3 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo4 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo5 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo6 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo7 		: std_logic:= '0';
signal sig_read_en_LVDS_fifo8 		: std_logic:= '0';


-- Channel Adder Module signals
signal SIG_out_adder_data_tick	: std_logic := '0';
signal SIG_ADD_DATA_OUT		     	: std_logic_vector(15 downto 0) := (others => '0');
signal sgn_adder_op		     		: std_logic_vector(15 downto 0) := (others => '0');

-- Header footer module signals
signal SIG_WR_REG_DATA_TICK		: std_logic := '0';
signal SIG_WR_REG_DATA_TICK_1		: std_logic := '0';
signal SIG_WR_REG_DATA			   : std_logic_vector(15 downto 0) := (others => '0');
signal write_int_sig :std_logic :='0';
--------header footer scheduler-----------
signal sig_tx_enable                : std_logic;
signal del_sig_tx_enable : std_logic:= '0';
signal TX_enable_sig1 : std_logic:= '0';

signal aqcuire_sig : std_logic:= '0';
signal stop_acq : std_logic:= '0';
signal aqcuire_cnt : std_logic_vector(15 downto 0):= (others => '0');
signal dead_cnt : std_logic_vector( 15 downto 0):= (others => '0');	
signal sig_hf_wr_en : std_logic:= '0';	
constant aqcuire_time :	std_logic_vector(15 downto 0):= x"7530";
constant dead_time :	std_logic_vector(15 downto 0):= x"0064";

-- SRAM Schedular Module signals  

signal SIG_Sch_Wr_done 				:std_logic := '0';
signal SIG_Sch_Rd_done_s 			:std_logic;
signal SIG_Sch_Wr_en 				:std_logic := '0';
signal SIG_Sch_Rd_en 				:std_logic := '0';			
signal SIG_Sch_USB_data_tick		:std_logic := '0';
signal SIG_Sch_SRAM_full 			:std_logic := '0';
signal SIG_Sch_SRAM_empty			:std_logic := '0';
signal SIG_SRAM_RD_data_valid		:std_logic := '0'; 
signal sram_wr_data_rd_en1			: std_logic;
signal sram_wr_data_rd_en			: std_logic;
signal SRAM_adv_n_s 					: std_logic;
signal SRAM_adsc_n_s 				: std_logic;
signal SIG_Sch_Addr_R_W			   : std_logic_vector(18 downto 0) := (others => '0');


-- Output Read Register (16 x 16) Module signals
signal SIG_RD_REG_OUT_DATA_TICK	: std_logic := '0'; 
signal SIG_RD_REG_OUT_DATA			: std_logic_vector(15 downto 0) := (others => '0');
signal SIG_REG_ADDR_SEL				: std_logic_vector(3 downto 0)  := (others => '0');


-- USB Interface Controller Signals
signal SIG_footer_tick	: std_logic := '0'; 
--usb signals 
signal sig_USB_slrd_s  : std_logic;
signal sig_USB_slwr_s  : std_logic; 
signal sig_USB_flagb  : std_logic; 
signal sram_wr_data_fifo_full  : std_logic; 
signal sram_wr_data_valid  : std_logic;
signal header_tick :std_logic:= '0';
signal data_valid_fifo :std_logic:= '0';
signal footer_tick :std_logic:= '0';

signal valid_counter  : std_logic_vector (2 downto 0) := (others => '0');
signal source_counter_1  : std_logic_vector (15 downto 0) := (others => '0');



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
signal SIG_RCI_Decimation_FACTOR		: std_logic_vector (7 downto 0) := X"00";--W
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

    

-- To be removed signals --

signal trig_en : std_logic;
signal t1,t2,t3,t4,t5 : std_logic;
signal USB_usb_data_out_s : std_logic_vector (15 downto 0);

signal USB_slwr_s : std_logic;
signal USB_slrd_s : std_logic;          
       

signal sig_usb_fifo_full : std_logic;
signal usb_fifo_empty : std_logic;
signal usb_fifo_rd_en : std_logic;
signal usb_fifo_data_valid : std_logic;
signal sram_wr_data_fifo_empty : std_logic;
----signal count : std_logic_vector (2 downto 0);
signal sel : std_logic_vector (2 downto 0);
signal mux_out : std_logic_vector (15 downto 0);

signal sig_usb_fifo_empty 		: std_logic;
signal sig_usb_fifo_data_valid	: std_logic;
signal tp_sig						: std_logic := '0';  
signal fifo_wr_en1				  : std_logic:= '0'; 
signal fifo_wr_en2				  : std_logic:= '0'; 
signal SIG_TEST_COUNT  : std_logic_vector (15 downto 0) := (others => '0'); 
signal usb_start1  : std_logic := '0';
signal flag_capture  : std_logic := '0';

-------------  signals for port mapping process blocks ------------------
signal i : integer := 0;
signal SIG_PB_data_tick           :   std_logic_vector(7 downto 0) := (others => '0');

type LVDS_DOUT_ARRAY is array (0 to 7) of std_logic_vector(BIT_WIDTH_ADC_TOP-1 downto 0); 
signal deci_data_ch               :   LVDS_DOUT_ARRAY ;

type PB_DATA_OUT_ARRAY is array (0 to 7) of std_logic_vector(OUTPUT_BIT_WIDTH_TOP-1 downto 0); 
signal SIG_PB_DATA_OUT_CH         :   PB_DATA_OUT_ARRAY ;

type PR_CHANNEL_ARRAY is array (0 to 7) of std_logic_vector(2 downto 0); 
signal PR_CH_NO_gen                   :   PR_CHANNEL_ARRAY := (others => (others => '0'));
signal LVDS_fifo_empty_gen            :   std_logic_vector(7 downto 0) := (others => '0');
signal sig_beam_no      :   std_logic_vector(7 downto 0) := x"01";--(others => '0');
signal PB_data_valid_out       :   std_logic_vector(7 downto 0) := (others => '0');
signal beam_num_sig				:   std_logic_vector(7 downto 0) := X"01";	
signal beam_num_sig_1				:   std_logic_vector(7 downto 0) := X"01";	
signal beam_num_sig_2				:   std_logic_vector(7 downto 0) := X"01";	
--

-----------------------------------------------------    
---- Component   Declarations
-----------------------------------------------------

--IC AD9279 component

	Component AD_module is
					port ( 
								AD_GLOBAL_CLK 				: in  std_logic;
								AD_MOD_RST 					: in  std_logic;
								AD_SDIO		 				: inout  std_logic;
								AD_CSB						: out std_logic;
								AD_CLK_25Mhz				: out std_logic;
								AD_prog_done				: out STD_LOGIC;
								enable_done4				: in  std_logic;
								data_readback		: out STD_LOGIC_VECTOR (7 downto 0)
						);
	End Component  ; 

-- DAC module

Component DAC_Module is
			Port ( 
						 DAC_GLOBAL_CLK 		: in  std_logic;
						 DAC_MOD_RST 			: in  std_logic;
						 DAC_CLOCK_122_88		: IN  STD_LOGIC;
						 --DAC_data_present		: out  STD_LOGIC;
						 DAC_Data				: OUT STD_LOGIC_VECTOR(11 downto 0);	--Output for writing configurations. 
						 DAC_WRT_A				: OUT STD_LOGIC; 		
						 DAC_enable_done5		: IN  STD_LOGIC
					);
	End Component  ;	



--LVDS interface module for AD9279 IC

	Component   lvds_adc_interface is
	                generic (
					         BIT_WIDTH_ADC : integer := 12 
					);
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
							  ADC_DATA_CH1           : out std_logic_vector(BIT_WIDTH_ADC -1 downto 0);
							  ADC_DATA_CH2           : out std_logic_vector(BIT_WIDTH_ADC -1 downto 0);
							  ADC_DATA_CH3           : out std_logic_vector(BIT_WIDTH_ADC -1 downto 0);
							  ADC_DATA_CH4           : out std_logic_vector(BIT_WIDTH_ADC -1 downto 0);
							  ADC_DATA_CH5           : out std_logic_vector(BIT_WIDTH_ADC -1 downto 0);
							  ADC_DATA_CH6           : out std_logic_vector(BIT_WIDTH_ADC -1 downto 0);
							  ADC_DATA_CH7           : out std_logic_vector(BIT_WIDTH_ADC -1 downto 0);
							  ADC_DATA_CH8           : out std_logic_vector(BIT_WIDTH_ADC -1 downto 0)                                       
																				  
						);
	End Component  ;  

--channels selection logic before processing 
	
COMPONENT ADC_CHANNEL_SWITCH 
			generic(
			BIT_WIDTH         						: integer     := 12
				);						
			Port (  
--						INPUTS
						----------------------------------------
						CLK           			: in  std_logic; 
						RESET_SYNC   			: in  std_logic;
						VALID_IN      			: in  std_logic;
						ADC_IN_CH1    			: in  std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_IN_CH2    			: in  std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_IN_CH3    			: in  std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_IN_CH4    			: in  std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_IN_CH5    			: in  std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_IN_CH6    			: in  std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_IN_CH7    			: in  std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_IN_CH8    			: in  std_logic_vector(BIT_WIDTH-1 downto 0);
						BEAM_NUMBER   			: in  std_logic_vector(7 downto 0) ;
--						FIFO_empty_ch1			: in  std_logic;
--			OUTPUTS
			----------------------------------------
						VALID_OUT  				: out std_logic;
						FIFO_RD_enable1		: out STD_LOGIC;
						FIFO_RD_enable2		: out STD_LOGIC;
						FIFO_RD_enable3		: out STD_LOGIC;
						FIFO_RD_enable4      : out STD_LOGIC;
						FIFO_RD_enable5		: out STD_LOGIC;
						FIFO_RD_enable6      : out STD_LOGIC;
						FIFO_RD_enable7      : out STD_LOGIC;
						FIFO_RD_enable8      : out STD_LOGIC;
						ADC_OUT_CH1   			: out std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_OUT_CH2   			: out std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_OUT_CH3   			: out std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_OUT_CH4   			: out std_logic_vector(BIT_WIDTH-1 downto 0); 
						ADC_OUT_CH5   			: out std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_OUT_CH6   			: out std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_OUT_CH7   			: out std_logic_vector(BIT_WIDTH-1 downto 0);
						ADC_OUT_CH8   			: out std_logic_vector(BIT_WIDTH-1 downto 0)
							);     			
end COMPONENT; 

-- Decimator blocks 8 Channels 

component adc_data_decimator is
			 Port ( 
						clk_in 					: in  STD_LOGIC;
						rst_in 					: in  STD_LOGIC;
						pb_data_tick 			: in STD_LOGIC;
						decimation_factor 	: in  STD_LOGIC_VECTOR (1 downto 0);
						pb_data_in 				: in  std_logic_vector (BIT_WIDTH_ADC_TOP-1 downto 0);
						decimated_data_out 	: out  std_logic_vector (BIT_WIDTH_ADC_TOP-1 downto 0);
						decimated_data_valid : out std_logic
					  );
end component;
				

--Process block modules all 8 channel


Component   Module_Process_Block_CH is
	generic(
              INPUT_BIT_WIDTH         : integer     := 16;
              OUTPUT_BIT_WIDTH        : integer     := 32
	        );
			Port (	
							CLK_400MHZ 		: IN  STD_LOGIC;
							Module_RST		: IN  STD_LOGIC;
							Data_present 	: IN  STD_LOGIC;
							FP_IN			: IN  STD_LOGIC_VECTOR(7 downto 0);
							PR_CH_NO        :   in std_logic_vector(2 downto 0);
							PB_DATA_IN		: IN  std_logic_vector(11 DOWNTO 0);
							PB_DATA_OUT		: OUT  std_logic_vector(OUTPUT_BIT_WIDTH-1 DOWNTO 0);
							PB_data_tick_out : out  STD_LOGIC

						);
End Component  ;

-- Addition Process Module of all 8 Channels  

component Adder_module
			 Port ( 
							clk_in				: in std_logic; 
							reset_in				: in std_logic;
							ch1 					: in  STD_LOGIC_VECTOR (31 downto 0);
							ch2 					: in  STD_LOGIC_VECTOR (31 downto 0);
							ch3					: in  STD_LOGIC_VECTOR (31 downto 0);
							ch4 					: in  STD_LOGIC_VECTOR (31 downto 0);
							ch5 					: in  STD_LOGIC_VECTOR (31 downto 0);
							ch6 					: in  STD_LOGIC_VECTOR (31 downto 0);
							ch7 					: in  STD_LOGIC_VECTOR (31 downto 0);
							ch8 					: in  STD_LOGIC_VECTOR (31 downto 0);
							add_output 			: out STD_LOGIC_VECTOR (15 downto 0);
							add_valid_in		: in std_logic;
							add_valid_out		: out std_logic;
							add_carry_in 		: in std_logic;
							add_carry_out 		: out std_logic
	 );

end component;

-- SRAM FIFO Module

component sram_wr_fifo is                                                            
				Port ( 
							glb_clk1             : in std_logic; -- 400 Mhz
							glb_clk2             : in std_logic; -- 200 Mhz 180 PS (FE)
							g_reset              : in std_logic;
							data_available			: in std_logic;
							rd_en						: in std_logic;
							adc_data_tick			: out std_logic;
							data_in              : in  std_logic_vector(15 downto 0);
							data_out					: out std_logic_vector(15 downto 0);
							data_valid				: out std_logic;
							sram_fifo_full			: out std_logic;
							sram_fifo_empty		: out std_logic
						 );  
end component; 

-- Header Footer module

component header_footer_module 
				Port(
							data_in 						: in std_logic_vector(15 downto 0);
							data_out 					: out std_logic_vector(15 downto 0);
							wr_en1   					: out std_logic;
							clk_200MHZ 					: in std_logic;
							HF_usb_start 				: in std_logic;
							fifo_full_hf 				: in std_logic;
							HF_sig_acq  				: in std_logic;
							sram_wr_en_hfm 			: in std_logic;
							sram_wr_en_out  			: out std_logic;
							adc_data_tick_in 			: in std_logic;
							adc_data_tick_out 		: out std_logic;
							valid_data 					: in std_logic;
							reset_hf   					: in std_logic
					  );
end component;	


--SRAM Scheduler Module
	Component   SRAM_Schedular is
					port ( 
								glb_clk        			: in  std_logic;
								g_reset        			: in  std_logic;
								ADC_ready					: in  std_logic;
								Wr_done						: in  std_logic;
								Rd_done						: in  std_logic;
								sram_fifo_full				: in  std_logic;
								usb_fifo_full				: in  std_logic;
								write_int					: in  std_logic;
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
	
----SRAM Controller Interface Module
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

End Component; 
	
-- USB FIFO module
	
COMPONENT sram_usb_fifo

				port ( 
								wr_clk               	: in std_logic; -- 200 Mhz
								rd_clk               	: in std_logic; -- 48 Mhz
								g_reset                 : in std_logic;
								fifo_wr_en					: in std_logic;
								fifo_data_in           	: in  std_logic_vector(15 downto 0);
								fifo_rd_en					: in std_logic;
								usb_fifo_full				: out std_logic;
								usb_fifo_empty				: out std_logic;
								fifo_data_out				: out std_logic_vector(15 downto 0);
								fifo_data_valid			: out std_logic	
						 );
END COMPONENT;


--USB Interface Controller Module

Component USB_FX2LP_Controller is
				  Port (  
								--FX2LP Interface
								 clk_48mhz      			: in  STD_LOGIC;                        --Interface Clock
								 reset     					: in STD_LOGIC;                         --Global reset
								 fdata     					: inout  STD_LOGIC_VECTOR(15 downto 0); --  FIFO data lines.
								 faddr     					: out STD_LOGIC_VECTOR(1 downto 0);     --  FIFO select lines
								 slrd      					: out STD_LOGIC;                        -- Read control line
								 slwr      					: out STD_LOGIC;                        -- Write control line
								 flagb     					: in  STD_LOGIC;                        --EP6 full flag
								 usb_start 					: in std_logic;								 -- START/STOP of streaming
								-- flagc     					: in  STD_LOGIC;                        --EP2 empty flag
								 sloe      					: out STD_LOGIC;                        --Slave Output Enable control
								 test_count					: out STD_LOGIC_VECTOR(15 downto 0);
								 -- FIFO interface		
								 data_in   					: in  STD_LOGIC_VECTOR(15 downto 0);	-- Data input from the fifo
								 fifo_empty					: in STD_LOGIC;
								 data_valid					: in  STD_LOGIC;								-- data valid from the fifo
								 fifo_read_en				: out STD_LOGIC								-- Read Enable control for incrementing FIFO
							);
End Component;

Component RCI_Module is
					Port ( 
							-----------------------------------------------------------------
							----System Clock & Reset Signals
							-----------------------------------------------------------------
								RCI_Global_clk	                  : in 		std_logic;--Global Clock 100 MHz
								RCI_mod_rst      		            : in 		std_logic;-- Active High 
							-----------------------------------------------------------------
							----USB Controller Interface Operated in Asynchronous Mode      
							-----------------------------------------------------------------
								RCI_addr                      	: in 		std_logic_vector (7 downto 0);-- USB_RCI_ address
								RCI_data                      	: inout  std_logic_vector (7 downto 0);                                                 
								RCI_csb_n                     	: in		std_logic ;
								RCI_Wr_n                      	: in  	std_logic ;
								RCI_Rd_n                      	: in  	std_logic ;
								RCI_oe_n									: in  	std_logic ;
							---------------------------------------------------------------
							----ADC Module Interface                                                   
							---------------------------------------------------------------
							
								RCI_FLEx_GAIN_PGA						: inout  std_logic_vector (7 downto 0) ;--W
								
							---------------------------------------------------------------
							----DAC Module Interface                                                   
							---------------------------------------------------------------
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

							---------------------------------------------------------------
						----	Input/Output Interface Registers                                                   
							---------------------------------------------------------------				
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

							
							---------------------------------------------------------------
						--	Transmitter Side Configuration Register                                                   
							---------------------------------------------------------------				
							
								RCI_Focal_point 						 : inout  std_logic_vector (7 downto 0) --W
				
					);
							
end Component;	


				---------------------------------------------------
							-- Component   instantiations
				---------------------------------------------------

Begin

-- IC AD9279 Component instantiation	

IC_AD9279_mod : AD_module

				port map(	 
								AD_GLOBAL_CLK 				=> RM_glb_clk,										
								AD_MOD_RST 					=>	RM_glb_Reset,                				
								AD_SDIO		 				=>	RM_ADC_SDIO,               		
								AD_CSB						=> RM_ADC_CSB,
								AD_CLK_25Mhz				=> RM_ADC_CLK_25MHZ,
								AD_prog_done				=> prog_done,
								enable_done4				=> RM_PS_EN,
								data_readback				=> SIG_RCI_testing
						);	

--DAC Module Instantiation

 DAC : DAC_Module 
		port map( 
						 DAC_GLOBAL_CLK 		=> RM_glb_clk,
						 DAC_MOD_RST 			=> RM_glb_Reset,
						 DAC_CLOCK_122_88		=> RM_DAC_CLOCK_122_88,
				--		 DAC_data_present		=> tp_sig,
						 DAC_Data				=> sig_DAC_out_data,
						 DAC_WRT_A				=> RM_DAC_WRT_A,	
						 DAC_enable_done5		=> RM_PS_EN		
					);
						

-- LVDS signal Component Instantiation of IC AD9279
 
LVDS_interface : lvds_adc_interface  
                generic map (
                BIT_WIDTH_ADC  => BIT_WIDTH_ADC_TOP
                )			
				
				Port map (                                        
								global_clk  				=> RM_glb_clk,
								reset                   => RM_glb_Reset,
								ADC_FCO                 => RM_ADC_FCO,
								ADC_DCO                 => RM_ADC_DCO,
								ADC_OUT_CH1             => RM_ADC_CH1,
								ADC_OUT_CH2             => RM_ADC_CH2,
								ADC_OUT_CH3             => RM_ADC_CH3,
								ADC_OUT_CH4             => RM_ADC_CH4,
								ADC_OUT_CH5             => RM_ADC_CH5,
								ADC_OUT_CH6             => RM_ADC_CH6,
								ADC_OUT_CH7             => RM_ADC_CH7,
								ADC_OUT_CH8             => RM_ADC_CH8,
							   ADC_datavalid           => SIG_ADC_DATAVALID,
								ADC_DATA_CH1            => SIG_LVDS_DATA_IN_CH1,
								ADC_DATA_CH2            => SIG_LVDS_DATA_IN_CH2,
								ADC_DATA_CH3            => SIG_LVDS_DATA_IN_CH3,
								ADC_DATA_CH4            => SIG_LVDS_DATA_IN_CH4,
								ADC_DATA_CH5            => SIG_LVDS_DATA_IN_CH5,
								ADC_DATA_CH6            => SIG_LVDS_DATA_IN_CH6,
								ADC_DATA_CH7            => SIG_LVDS_DATA_IN_CH7,
								ADC_DATA_CH8            => SIG_LVDS_DATA_IN_CH8
							 ); 
 
--Process Block instantiation for Channel 1 --

Channel_select_logic : ADC_CHANNEL_SWITCH 
                generic map (
				BIT_WIDTH => BIT_WIDTH_ADC_TOP
				)
					
				Port Map (  
								-- INPUTS
								--------------------------------------------
								CLK           		=> RM_ADC_DCO, --RM_glb_clk_400,	
								RESET_SYNC   		=>	RM_glb_Reset,	
								VALID_IN      		=> SIG_ADC_DATAVALID_s,					--SIG_ADC_DATAVALID,--LVDS_fifo_data_valid_d, 	
								ADC_IN_CH1    		=> SIG_LVDS_DATA_IN_CH1,-- ,--data_cosine_counter(11 downto 0),--Ssource_counter(11 downto 0),--SIG_LVDS_DATA_IN_CH1,--			----LVDS_dout_ch1,	
								ADC_IN_CH2    		=> SIG_LVDS_DATA_IN_CH2,--cosine_source_counter(11 downto 0),	----LVDS_dout_ch2,	x"000",--	source_counter2(11 downto 0),--
								ADC_IN_CH3    		=> SIG_LVDS_DATA_IN_CH3,--source_counter(11 downto 0),			----LVDS_dout_ch3,	x"000",--	source_counter3(11 downto 0),--
								ADC_IN_CH4    		=> SIG_LVDS_DATA_IN_CH4,--cosine_source_counter(11 downto 0),	----LVDS_dout_ch4,	x"000",--	source_counter4(11 downto 0),--
								ADC_IN_CH5    		=>	SIG_LVDS_DATA_IN_CH5,--source_counter(11 downto 0),			----LVDS_dout_ch5,	x"000",--	source_counter5(11 downto 0),--
								ADC_IN_CH6    		=> SIG_LVDS_DATA_IN_CH6,--x"000",--cosine_source_counter(11 downto 0),	----LVDS_dout_ch6,	x"000",--	source_counter6(11 downto 0),--
								ADC_IN_CH7    		=> SIG_LVDS_DATA_IN_CH7,--x"000",--source_counter(11 downto 0),			----LVDS_dout_ch7,	x"000",--	source_counter7(11 downto 0),--
								ADC_IN_CH8    		=>	SIG_LVDS_DATA_IN_CH8,--x"000",--cosine_source_counter(11 downto 0),	----LVDS_dout_ch8,	x"000",--	source_counter8(11 downto 0),--
								BEAM_NUMBER   		=> RM_Beam_No,-- beam_num_sig_2,RM_Beam_No,--
--								FIFO_empty_ch1		=> LVDS_fifo_empty_d,
					-- OUTPUTS                 
					--------------------------------------------
								VALID_OUT  			=> SW_data_valid,
								FIFO_RD_enable1	=> sig_read_en_LVDS_fifo1,
								FIFO_RD_enable2	=> sig_read_en_LVDS_fifo2,
								FIFO_RD_enable3	=> sig_read_en_LVDS_fifo3,
								FIFO_RD_enable4	=> sig_read_en_LVDS_fifo4,
								FIFO_RD_enable5	=> sig_read_en_LVDS_fifo5,
								FIFO_RD_enable6	=> sig_read_en_LVDS_fifo6,
								FIFO_RD_enable7	=> sig_read_en_LVDS_fifo7,
								FIFO_RD_enable8	=> sig_read_en_LVDS_fifo8,
								
								ADC_OUT_CH1   		=> SW_ADC_OUT_CH1,	
								ADC_OUT_CH2   		=> SW_ADC_OUT_CH2,	
								ADC_OUT_CH3   		=> SW_ADC_OUT_CH3,	
								ADC_OUT_CH4   		=> SW_ADC_OUT_CH4,	
								ADC_OUT_CH5   		=>	SW_ADC_OUT_CH5,	
								ADC_OUT_CH6   		=> SW_ADC_OUT_CH6, 	
								ADC_OUT_CH7   		=> SW_ADC_OUT_CH7,	
								ADC_OUT_CH8   		=> SW_ADC_OUT_CH8	
							);     	           

--Decimator mode Module instantiation--

	adc_deci_i1 : adc_data_decimator
--		 generic map (
--				INPUT_BIT_WIDTH     =>  INPUT_BIT_WIDTH_TOP ,
--				OUTPUT_BIT_WIDTH    =>  OUTPUT_BIT_WIDTH_TOP
--				)
				port map (
								clk_in 						=> RM_ADC_DCO, --RM_glb_clk_400,
								rst_in 						=> RM_glb_Reset,
								pb_data_tick 				=> SW_data_valid,
								decimation_factor 		=> SIG_RCI_Decimation_FACTOR(1 downto 0),
								pb_data_in 					=> SW_ADC_OUT_CH1,--data_cosine_counter(11 downto 0),--
								decimated_data_out 		=> deci_data_out_CH1,
								decimated_data_valid 	=> deci_data_valid_CH1
							);
														
adc_deci_i2 : adc_data_decimator
--		generic map (
--				INPUT_BIT_WIDTH                 =>  INPUT_BIT_WIDTH_TOP ,
--				OUTPUT_BIT_WIDTH                =>  OUTPUT_BIT_WIDTH_TOP
--				)
				port map (
							clk_in              => RM_ADC_DCO, --RM_glb_clk_400,
							rst_in              => RM_glb_Reset,
							pb_data_tick        => SW_data_valid,
							decimation_factor   => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in          => SW_ADC_OUT_CH2,
							decimated_data_out  => deci_data_out_CH2,
							decimated_data_valid=> deci_data_valid_CH2
							);
	adc_deci_i3 : adc_data_decimator
--		generic map (
--				INPUT_BIT_WIDTH                 =>  INPUT_BIT_WIDTH_TOP ,
--				OUTPUT_BIT_WIDTH                =>  OUTPUT_BIT_WIDTH_TOP
--				)
				port map (
							clk_in              => RM_ADC_DCO, --RM_glb_clk_400,
							rst_in              => RM_glb_Reset,
							pb_data_tick        => SW_data_valid,
							decimation_factor   => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in          => SW_ADC_OUT_CH3,
							decimated_data_out  => deci_data_out_CH3,
							decimated_data_valid=> deci_data_valid_CH3
							);
	adc_deci_i4 : adc_data_decimator
--		generic map (
--				INPUT_BIT_WIDTH                 =>  INPUT_BIT_WIDTH_TOP ,
--				OUTPUT_BIT_WIDTH                =>  OUTPUT_BIT_WIDTH_TOP
--				)
				port map (
							clk_in              => RM_ADC_DCO, --RM_glb_clk_400,
							rst_in              => RM_glb_Reset,
							pb_data_tick        => SW_data_valid,
							decimation_factor   => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in          => SW_ADC_OUT_CH4,
							decimated_data_out  => deci_data_out_CH4,
							decimated_data_valid=> deci_data_valid_CH4
							);
	adc_deci_i5 : adc_data_decimator
--		generic map (
--				INPUT_BIT_WIDTH                 =>  INPUT_BIT_WIDTH_TOP ,
--				OUTPUT_BIT_WIDTH                =>  OUTPUT_BIT_WIDTH_TOP
--				)
				port map (
							clk_in              => RM_ADC_DCO, --RM_glb_clk_400,
							rst_in              => RM_glb_Reset,
							pb_data_tick        => SW_data_valid,
							decimation_factor   => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in          => SW_ADC_OUT_CH5,
							decimated_data_out  => deci_data_out_CH5,
							decimated_data_valid=> deci_data_valid_CH5
							);
	adc_deci_i6 : adc_data_decimator
--		generic map (
--				INPUT_BIT_WIDTH                 =>  INPUT_BIT_WIDTH_TOP ,
--				OUTPUT_BIT_WIDTH                =>  OUTPUT_BIT_WIDTH_TOP
--				)
				port map (
							clk_in              => RM_ADC_DCO, --RM_glb_clk_400,
							rst_in              => RM_glb_Reset,
							pb_data_tick        => SW_data_valid,
							decimation_factor   => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in          => SW_ADC_OUT_CH6,
							decimated_data_out  => deci_data_out_CH6,
							decimated_data_valid=> deci_data_valid_CH6
							);
	adc_deci_i7 : adc_data_decimator
--		generic map (
--				INPUT_BIT_WIDTH                 =>  INPUT_BIT_WIDTH_TOP ,
--				OUTPUT_BIT_WIDTH                =>  OUTPUT_BIT_WIDTH_TOP
--				)
				port map (
							clk_in              => RM_ADC_DCO, --RM_glb_clk_400,
							rst_in              => RM_glb_Reset,
							pb_data_tick        => SW_data_valid,
							decimation_factor   => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in          => SW_ADC_OUT_CH7,
							decimated_data_out  => deci_data_out_CH7,
							decimated_data_valid=> deci_data_valid_CH7
							);
	adc_deci_i8 : adc_data_decimator
--		generic map (
--				INPUT_BIT_WIDTH                 =>  INPUT_BIT_WIDTH_TOP ,
--				OUTPUT_BIT_WIDTH                =>  OUTPUT_BIT_WIDTH_TOP
--				)
				port map (
							clk_in              => RM_ADC_DCO, --RM_glb_clk_400,
							rst_in              => RM_glb_Reset,
							pb_data_tick        => SW_data_valid,
							decimation_factor   => SIG_RCI_Decimation_FACTOR(1 downto 0),
							pb_data_in          => SW_ADC_OUT_CH8,
							decimated_data_out  => deci_data_out_CH8,
							decimated_data_valid=> deci_data_valid_CH8
							);       

deci_data_valid_CHall <= deci_data_valid_CH1 or deci_data_valid_CH2 or deci_data_valid_CH3 or deci_data_valid_CH4 or deci_data_valid_CH5 or deci_data_valid_CH6 or deci_data_valid_CH7 or deci_data_valid_CH8; 
-- All Eight channel Procees Block Instantiation		

							
Module_Process_Block_CH_GEN :  for i in 0 to 7 generate  
begin   							
PROCESS_BLOCK_inst :  Module_Process_Block_CH   
     generic map (
				INPUT_BIT_WIDTH     =>  INPUT_BIT_WIDTH_TOP ,
				OUTPUT_BIT_WIDTH    =>  OUTPUT_BIT_WIDTH_TOP
				)
				port map(	
								CLK_400MHZ 					=> RM_ADC_DCO, --RM_glb_clk_400,
								Module_RST					=>	RM_glb_Reset,
								Data_present 				=> PB_data_valid_out(i),
--								FIFO_RD_enable1			    => sig_read_en_LVDS_fifo(i),
--								FIFO_empty_ch1				=> LVDS_fifo_empty_gen(i),
								FP_in					    => SIG_RCI_Focal_point,
								PR_CH_NO                    => PR_CH_NO_gen(i),
								PB_DATA_in					=> deci_data_ch(i),
								PB_DATA_out					=> SIG_PB_DATA_OUT_CH(i),
								PB_data_tick_out			=> SIG_PB_data_tick(i)
						);
						
   end generate Module_Process_Block_CH_GEN;
	
SIG_PB_data_tick1 <=   SIG_PB_data_tick(0);   
SIG_PB_data_tick2 <=   SIG_PB_data_tick(1);   
SIG_PB_data_tick3 <=   SIG_PB_data_tick(2);   
SIG_PB_data_tick4 <=   SIG_PB_data_tick(3);   
SIG_PB_data_tick5 <=   SIG_PB_data_tick(4);   
SIG_PB_data_tick6 <=   SIG_PB_data_tick(5);   
SIG_PB_data_tick7 <=   SIG_PB_data_tick(6);   
SIG_PB_data_tick8 <=   SIG_PB_data_tick(7);

SIG_PB_DATA_OUT_CH1 <= SIG_PB_DATA_OUT_CH(0);
SIG_PB_DATA_OUT_CH2 <= SIG_PB_DATA_OUT_CH(1);
SIG_PB_DATA_OUT_CH3 <= SIG_PB_DATA_OUT_CH(2);
SIG_PB_DATA_OUT_CH4 <= SIG_PB_DATA_OUT_CH(3);
SIG_PB_DATA_OUT_CH5 <= SIG_PB_DATA_OUT_CH(4);
SIG_PB_DATA_OUT_CH6 <= SIG_PB_DATA_OUT_CH(5);
SIG_PB_DATA_OUT_CH7 <= SIG_PB_DATA_OUT_CH(6);
SIG_PB_DATA_OUT_CH8 <= SIG_PB_DATA_OUT_CH(7); 

deci_data_ch(0) <= deci_data_out_CH1;--deci_data_ch1;--SIG_LVDS_DATA_IN_CH1;--
deci_data_ch(1) <= deci_data_out_CH2;--deci_data_ch2;
deci_data_ch(2) <= deci_data_out_CH3;--deci_data_ch3;
deci_data_ch(3) <= deci_data_out_CH4;--deci_data_ch4;
deci_data_ch(4) <= deci_data_out_CH5;--deci_data_ch5;
deci_data_ch(5) <= deci_data_out_CH6;--deci_data_ch6;
deci_data_ch(6) <= deci_data_out_CH7;--deci_data_ch7;
deci_data_ch(7) <= deci_data_out_CH8;--	deci_data_ch8;

PR_CH_NO_gen(0) <= "000";
PR_CH_NO_gen(1) <= "001";
PR_CH_NO_gen(2) <= "010";
PR_CH_NO_gen(3) <= "011";
PR_CH_NO_gen(4) <= "100";
PR_CH_NO_gen(5) <= "101";
PR_CH_NO_gen(6) <= "110";
PR_CH_NO_gen(7) <= "111";

PB_data_valid_out(0)   <= deci_data_valid_CH1;--SIG_ADC_DATAVALID_s;--
PB_data_valid_out(1)   <= deci_data_valid_CH2;
PB_data_valid_out(2)   <= deci_data_valid_CH3;
PB_data_valid_out(3)   <= deci_data_valid_CH4;
PB_data_valid_out(4)   <= deci_data_valid_CH5;
PB_data_valid_out(5)   <= deci_data_valid_CH6;
PB_data_valid_out(6)   <= deci_data_valid_CH7;
PB_data_valid_out(7)   <= deci_data_valid_CH8;
		
-- Adder Module Instantiation		
		
	
Adder_i : Adder_module 
    
	 port map( 						
						clk_in			=> RM_ADC_DCO,--RM_ADC_DCO, --RM_glb_clk_400,					
						reset_in			=>	RM_glb_Reset,		
						ch1 				=>	SIG_PB_DATA_OUT_CH1,--  sgn_ch2 deci_data_out_CH1 & x"00000"; --SIG_PB_DATA_OUT_CH1,	 x"00000000",-		--
						ch2 				=>	SIG_PB_DATA_OUT_CH2	,-- sgn_ch3 deci_data_out_CH2 & x"00000"; --SIG_PB_DATA_OUT_CH2,x"00000000",--			--	x"00000000",--SIG_PB_DATA_OUT_CH2,--x"00000000",--
						ch3				=>	SIG_PB_DATA_OUT_CH3  ,--sgn_ch4 deci_data_out_CH3 & x"00000"; --SIG_PB_DATA_OUT_CH3,	x"00000000",--		--    x"00000000",--   SIG_PB_DATA_OUT_CH3x"00000000",--,--
						ch4 				=>	SIG_PB_DATA_OUT_CH4 	,--sgn_ch5deci_data_out_CH4 & x"00000"; --SIG_PB_DATA_OUT_CH4,	x"00000000",--		--   	x"00000000",--SIG_PB_DATA_OUT_CH4,--x"00000000",--
						ch5 				=>	SIG_PB_DATA_OUT_CH5	,--sgn_ch6deci_data_out_CH5 & x"00000"; --SIG_PB_DATA_OUT_CH5,	x"00000000",--		--   	x"00000000",--SIG_PB_DATA_OUT_CH5,--x"00000000",--
						ch6 				=>	SIG_PB_DATA_OUT_CH6	,--sgn_ch7deci_data_out_CH6 & x"00000"; --SIG_PB_DATA_OUT_CH6,	x"00000000",--		--   	x"00000000",--SIG_PB_DATA_OUT_CH6,--x"00000000",--
						ch7 				=>	SIG_PB_DATA_OUT_CH7	,--sgn_ch8deci_data_out_CH7 & x"00000"; --SIG_PB_DATA_OUT_CH7,	x"00000000",--		--   	x"00000000",--SIG_PB_DATA_OUT_CH7,--x"00000000",--
						ch8 				=>	SIG_PB_DATA_OUT_CH8	,--deci_data_out_CH8 & x"00000"; --SIG_PB_DATA_OUT_CH8,			--               	x"00000000",--SIG_PB_DATA_OUT_CH8,--x"00000000",--
						add_output 		=>	SIG_ADD_DATA_OUT,		
						add_valid_in	=> SIG_PB_data_tick1,--fifo_wr_en1,--SW_data_valid,--SW_data_valid,--deci_data_valid_CH1,--PB_data_valid_out(0),	SIG_PB_data_tick1,--	
						add_valid_out	=>	SIG_out_adder_data_tick,		
						add_carry_in 	=> '0',	
						add_carry_out 	=> open
					);		
					
	--sgn_ch1 <=  x"00000"	& SIG_LVDS_DATA_IN_CH1;--deci_data_out_CH1 ;--x"00000" & source_counter(11 downto 0); -- --data_cosine_counter;--SW_ADC_OUT_CH1;--
--sgn_ch2 <=  x"00000"	& deci_data_out_CH2 ;                                            -- SW_ADC_OUT_CH2;--
--sgn_ch3 <=  x"00000"	& deci_data_out_CH3 ;                                           --  SW_ADC_OUT_CH3;--
--sgn_ch4 <=  x"00000"	& deci_data_out_CH4 ;                                           --  SW_ADC_OUT_CH4;--
--sgn_ch5 <=  x"00000"	& deci_data_out_CH5 ;                                           --  SW_ADC_OUT_CH5;--
--sgn_ch6 <=  x"00000"	& deci_data_out_CH6 ;                                           --  SW_ADC_OUT_CH6;--
--sgn_ch7 <=  x"00000"	& deci_data_out_CH7 ;					                             --  SW_ADC_OUT_CH7;--
--sgn_ch8 <=  x"00000"	& deci_data_out_CH8 ;				                                --  SW_ADC_OUT_CH8;--
--					

-- SRAM FIFO  Instantiation

SRAM_wr_data_i : sram_wr_fifo
				port map (
							 glb_clk1       		=> RM_ADC_DCO,
				          glb_clk2            => RM_glb_clk,
				          g_reset             => RM_glb_Reset,
				          data_available	   => SIG_out_adder_data_tick,---deci_data_valid_CH1,--SIG_out_adder_data_tick,--fifo_wr_en1,--SIG_out_adder_data_tick,--
				          rd_en				   => sig_hf_wr_en,--sram_wr_data_rd_en,
							 adc_data_tick			=> SIG_WR_REG_DATA_TICK,
				          data_in             => SIG_ADD_DATA_OUT,--sgn_ch1(15 downto 0),--data_cosine_counter,--
				          data_out			   => SIG_WR_REG_DATA,
				          data_valid		      => sram_wr_data_valid,
				          sram_fifo_full		=> sram_wr_data_fifo_full,

				          sram_fifo_empty		=> sram_wr_data_fifo_empty
							);

-- Header footer Module instantiation		


header_insertion : header_footer_module

				port map (
							  data_in 						=>	SIG_WR_REG_DATA,
							  data_out  					=> source_counter_1,
							  wr_en1   						=> write_int_sig,
							  clk_200MHZ  					=> RM_glb_clk,
							  HF_usb_start 				=> RM_usb_start,
							  reset_hf   					=> RM_glb_Reset,
							  valid_data 					=> sram_wr_data_valid,--SIG_out_adder_data_tick,
							  HF_sig_acq 					=> aqcuire_sig,
							  sram_wr_en_hfm 				=> sram_wr_data_rd_en1,
							  sram_wr_en_out 				=> sig_hf_wr_en,
							  adc_data_tick_in			=> SIG_WR_REG_DATA_TICK,
								adc_data_tick_out			=> SIG_WR_REG_DATA_TICK_1,
							  fifo_full_hf 				=> sram_wr_data_fifo_full
	  );


-- SRAM Scheduler Module instantiation--

SRAM_Schedular_i : SRAM_Schedular
				port map(
								glb_clk						=>	RM_glb_clk,      
								g_reset      				=> RM_glb_Reset,      
								ADC_ready					=> SIG_WR_REG_DATA_TICK_1,
								sram_fifo_full				=> sram_wr_data_fifo_full, -- From RCI/ADC module --
								Wr_done						=> SIG_Sch_Wr_done,		
								Rd_done						=> SIG_Sch_Rd_done_s,
								sram_wr_data_rd_en	   => sram_wr_data_rd_en1,	
								Wr_en							=> SIG_Sch_Wr_en,			
								Rd_en							=> SIG_Sch_Rd_en,			
								usb_fifo_full				=> sig_usb_fifo_full,
								decimation_factor	      => SIG_RCI_Decimation_FACTOR(1 downto 0),
								write_int               => write_int_sig,
								footer_tick					=> SIG_footer_tick,
								SRAM_full					=> SIG_Sch_SRAM_full,	
								SRAM_empty					=> SIG_Sch_SRAM_empty,	
								SRAM_Addr_R_W				=> SIG_Sch_Addr_R_W
					);

sram_wr_data_rd_en <= sram_wr_data_rd_en1 and (not(SRAM_adv_n_s) or (not(SRAM_adsc_n_s)));


-- SRAM Controller Interface Module instantiation--

SRAM_Controller : sram_interface			
				port map(  
								clk_in          			=>	RM_glb_clk,
								rst_in			  			=> RM_glb_Reset,	
								-- SRAM interface Module					
				          --sram_clk_out    			=>	open RM_SRAM_clk_out,       
								mode            			=> open, --RM_SRAM_mode,      
								addr           			=> RM_SRAM_addr,       
								adv_n           			=> SRAM_adv_n_s,       
								adsp_n          			=> RM_SRAM_adsp_n,                                 
								adsc_n          			=> SRAM_adsc_n_s,                                   
								ce_n            			=> RM_SRAM_ce_n,                                   
								ce2             		   => RM_SRAM_ce2,                        
								ce2_n           			=> RM_SRAM_ce2_n,                             
								bwa_n           			=> RM_SRAM_bwa_n,                            
								bwb_n           			=> RM_SRAM_bwb_n,      
								bwc_n           			=> RM_SRAM_bwc_n,      
								bwd_n           			=> RM_SRAM_bwd_n,      
								oe_n            			=> RM_SRAM_oe_n,       
								global_wr_n     			=> RM_SRAM_global_wr_n,      
								bwe_n           			=> RM_SRAM_bwe_n,      
								zz              			=> RM_SRAM_zz,         
								DQ              			=> RM_SRAM_DQ,         
								-- Schedular interface --
								wr_en				 			=>	SIG_Sch_Wr_en,      
								rd_en							=> SIG_Sch_Rd_en,      
								wr_done				 		=> SIG_Sch_Wr_done,	
								rd_done				 		=> SIG_Sch_Rd_done_s,		
								sram_addrs_in     		=> SIG_Sch_Addr_R_W,		
								sram_wr_data_in   		=> source_counter_1,--SIG_WR_REG_DATA,			
								sram_rd_data_out  		=> SIG_RD_dec_DATA,			
								sram_rd_data_valid		=> SIG_SRAM_RD_data_valid
					);    


-- USB FIFO Module intantiation

USB_FIFO : sram_usb_fifo
	  PORT MAP (
								g_reset						=> RM_glb_Reset,
								wr_clk 						=> RM_glb_clk,
								rd_clk 						=> RM_USB_CLKIN_48_MHZ,
								fifo_data_in				=> SIG_RD_dec_DATA(15 downto 0),
								fifo_wr_en 					=> SIG_SRAM_RD_data_valid,
								fifo_rd_en 					=> usb_fifo_rd_en,
								fifo_data_out 				=> SIG_RD_REG_OUT_DATA,
								usb_fifo_full 				=> sig_usb_fifo_full,
								usb_fifo_empty				=> sig_usb_fifo_empty,
								fifo_data_valid 			=> sig_usb_fifo_data_valid					 
  );


	
-- USB Inteface Module Instantiation--
	
USB_Interface_controller: USB_FX2LP_Controller 
	port map( 
							 --FX2LP Interface
					 clk_48mhz      	=> RM_USB_CLKIN_48_MHZ,				 --Interface Clock
					 reset     			=> RM_glb_Reset, 					 --Global reset
					 fdata     			=> USB_usb_data_out_s,		 --  FIFO data lines.
					 faddr     			=> RM_USB_fddr_n,					 --  FIFO select lines
					 slrd      			=> RM_USB_slrd_n,			 -- Read control line
					 slwr      			=> RM_USB_slwr_n,			 -- Write control line
					 flagb     			=> RM_USB_flagb,				 --EP6 full flag
					 usb_start 			=>	RM_USB_start,					 -- START/STOP of streaming
					-- flagc     			=>	RM_USB_flagc,								 --EP2 empty flag
					 sloe      			=> RM_USB_sloe_n,					 --Slave Output Enable control
					 test_count			=> SIG_TEST_COUNT,									
							-- FIFO interface									
					 data_in   			=> SIG_RD_REG_OUT_DATA,		-- Data input from the fifo
					 data_valid			=> sig_usb_fifo_data_valid,-- data valid from the fifo
					 fifo_empty			=> sig_usb_fifo_empty,		
					 fifo_read_en		=> usb_fifo_rd_en				-- Read Enable control for incrementing FIFO
				);

--RCI Module Interface

RCI_MOD : RCI_Module 
				port map( 

						--  Clock & Reset Signals
								RCI_Global_clk	        	=> RM_glb_clk,
								RCI_mod_rst      		  	=> RM_glb_Reset,
						-- USB Controller Interface Operated in Asynchronous Mode      
								RCI_addr               	=> RM_USB_RCI_addr, 
								RCI_data               	=> RM_USB_RCI_data,                              
								RCI_csb_n              	=> RM_USB_RCI_csb_n,
								RCI_Wr_n               	=> RM_USB_RCI_Wr_n, 
								RCI_Rd_n               	=> RM_USB_RCI_Rd_n, 
								RCI_oe_n						=> RM_USB_RCI_oe_n,	
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
								RCI_Focal_point 			=>	 SIG_RCI_Focal_point 	
               );  

-- Signal Mapping to the Top Entity

RM_tp <= tp_sig;
RM_USB_usb_data_out <= USB_usb_data_out_s;
USB_slwr_s <= sig_USB_slwr_s;
RM_SRAM_adv_n <= SRAM_adv_n_s;
RM_SRAM_adsc_n <= SRAM_adsc_n_s;
RM_Focal_point <= SIG_RCI_Focal_point;
RM_ADC_prog_done <= prog_done;
--RM_adc_ch1_op(0) <= SIG_ADC_DATAVALID_s;
--RM_adc_ch1_op(1) <= SW_data_valid;--sig_hf_wr_en;
--RM_adc_ch1_op(2) <= sram_wr_data_valid;
--RM_adc_ch1_op(3) <= sram_wr_data_fifo_full;
--RM_adc_ch1_op(4) <= sram_wr_data_fifo_empty;
--RM_adc_ch1_op(5) <= SIG_WR_REG_DATA_TICK;
RM_adc_ch1_op(11 downto 0 ) <= SIG_LVDS_DATA_IN_CH1;--SIG_WR_REG_DATA(5 downto 0);
--RM_adc_ch1_op <= SW_ADC_OUT_CH1;--deci_data_ch1;--source_counter(11 downto 0);--SW_ADC_OUT_CH1;--				deci_data_ch1;--	
--RM_adc_ch2_op(9 downto 0) <= SIG_WR_REG_DATA(15 downto 6);--deci_data_ch2;--cosine_source_counter(11 downto 0);--SW_ADC_OUT_CH2;--    deci_data_ch2;--
RM_adc_ch2_op(15 downto 0) <= SIG_WR_REG_DATA(15 downto 0);
--RM_adc_ch2_op(11 downto 10) <= "00";--deci_data_ch2;--cosine_source_counter(11 downto 0);--SW_ADC_OUT_CH2;--    deci_data_ch2;--
RM_adc_ch3_op <= SW_ADC_OUT_CH3;--deci_data_ch3;--source_counter(11 downto 0);--SW_ADC_OUT_CH3;-            deci_data_ch3;--
RM_adc_ch4_op <= SIG_LVDS_DATA_IN_CH4;--SW_ADC_OUT_CH4;--deci_data_ch4;--cosine_source_counter(11 downto 0);--SW_ADC_OUT_CH4;--    deci_data_ch4;--
RM_adc_ch5_op <= SW_ADC_OUT_CH5;--deci_data_ch5;--SW_ADC_OUT_CH5;--source_counter(11 downto 0);--SW_ADC_OUT_CH5;--           deci_data_ch5;--
RM_adc_ch6_op <= SW_ADC_OUT_CH6;--deci_data_ch6;--SW_ADC_OUT_CH6;--cosine_source_counter(11 downto 0);--SW_ADC_OUT_CH6;--    deci_data_ch6;--
RM_adc_ch7_op <= SW_ADC_OUT_CH7;--deci_data_ch7;--SW_ADC_OUT_CH7;--source_counter(11 downto 0);--SW_ADC_OUT_CH7;--           deci_data_ch7;--
RM_adc_ch8_op <= SW_ADC_OUT_CH8;--deci_data_ch8;--SW_ADC_OUT_CH8;--cosine_source_counter(11 downto 0);--SW_ADC_OUT_CH8;--    deci_data_ch8;--
RM_adc_Adder_op <= SIG_ADD_DATA_OUT;--source_counter_1;--SIG_WR_REG_DATA;
RM_trigger1 <= SW_data_valid;  --  SIG_ADC_DATAVALID;
RM_trigger2 <= fifo_wr_en1;
RM_RCI_TEST	<= SIG_RCI_DAC_SAMPLE1_LB;

--testing input code--
--process(RM_ADC_dcO, RM_glb_Reset)
--begin
--	if (RM_glb_Reset = '1')then
--		 source_counter <= (others => '0');
--		 beam_num_sig <=X"01";
--		 fifo_wr_en1 <= '0';
--	elsIF(falling_edge(RM_ADC_dcO)) THEN
--	if(RM_USB_start = '1' and aqcuire_sig = '1' ) then
--		
----			source_counter <= x"0100";
--			if( data_cosine_counter  <  x"1b58") then
----				if(dual_int = "01") then
--				
--				data_cosine_counter <= data_cosine_counter + '1';
--
--						source_counter<= data_cosine_counter;
--
--						fifo_wr_en1 <= '1';
--			else
--
--				data_cosine_counter <= (others => '0');
--				fifo_wr_en1 <= '1';
--				
--				end if;
--			else
--				fifo_wr_en1 <= '0';
--				end if;
--			end if;
--			end process;
--- detecting rising edge of transmite enable--
--process(RM_ADC_dcO, RM_Tx_Beam_EN, RM_glb_Reset)
--begin
--		if (RM_glb_Reset = '1' and RM_USB_start = '0')then
--			del_sig_tx_enable <= '0';
--		elsIF( rising_edge(RM_ADC_dcO)) THEN
--		
--			del_sig_tx_enable <= RM_Tx_Beam_EN;
--		end if;
--end process;
--
--
----data_input to fifo at fco rate----------
--
SIG_ADC_DATAVALID_s <= SIG_ADC_DATAVALID and fifo_wr_en1;
--
process(RM_ADC_fCO, RM_glb_Reset,RM_USB_start, fifo_wr_en1,RM_Tx_Beam_EN)
begin
	if (RM_glb_Reset = '1' ) then --and RM_USB_start = '0')then
--		data_cosine_counter <= x"0000";
		fifo_wr_en1 <= '0';
		beam_num_sig <= X"01";
		source_counter <= X"0000";
		source_counter1 <= X"0000";
		beam_num_sig_1<= beam_num_sig;
--		fifo_wr_en2   <= fifo_wr_en1; 
	elsif rising_edge(RM_ADC_fCO) then
--		beam_num_sig_1<= beam_num_sig;
--		beam_num_sig_2<= beam_num_sig_1;
		fifo_wr_en2   <= fifo_wr_en1; 
		--if( aqcuire_sig = '1' ) then ---and sram_wr_data_fifo_full = '0' ) then ---- and) then --RM_USB_start = '1' and
		 if (RM_Tx_Beam_EN = '1') then 
					flag_capture <= '1';
				 end if;	
			if( flag_capture = '1') then 
			
			if(data_cosine_counter >= x"00C8" and data_cosine_counter < x"1C1F" )then 
		
			--if( data_cosine_counter  <  x"1b59") then--1b57
							fifo_wr_en1 <= '1';
							data_cosine_counter <= data_cosine_counter + '1';
							
							source_counter <= not source_counter ;
						
--					if((data_cosine_counter > x"0dac") and (data_cosine_counter < x"0e0c")) then
--							source_counter <= x"ffff";
----							
--					else
--							source_counter <= x"0000";
--					end if;
			elsif(data_cosine_counter < x"00C8") then
				data_cosine_counter <= data_cosine_counter + '1';
				fifo_wr_en1 <= '0';
			else
				
				fifo_wr_en1 <= '0';
					data_cosine_counter <=  x"0000";
					flag_capture <= '0';
					
			end if;
					

						
		else

			fifo_wr_en1 <= '0';
			end if;
		end if;	

end process;	
			--if(beam_num_sig = x"01" OR beam_num_sig = x"09" OR beam_num_sig = x"11" OR beam_num_sig = x"19" OR beam_num_sig = x"21" OR beam_num_sig = x"29" OR beam_num_sig = x"31" OR beam_num_sig = x"39" OR beam_num_sig = x"41" OR beam_num_sig = x"49" OR beam_num_sig = x"51" OR beam_num_sig = x"59" OR beam_num_sig = x"61" OR beam_num_sig = x"69" OR beam_num_sig = x"71" OR beam_num_sig = x"79" OR beam_num_sig = x"81") then
--			if( beam_num_sig = x"01") then  	
--process(RM_ADC_fCO,RM_glb_Reset,RM_USB_start)
--begin
--       if (RM_glb_Reset = '1') then
--				cosine_source_counter <= (others => '0');
--				aqcuire_sig <= '0';
--				source_counter <= (others => '0');
--       elsif(rising_edge(RM_ADC_fCO)) THEN
--				if( flag_capture = '1' ) then-- SIG_ADC_DATAVALID   --RM_USB_start = '1'  and
--					cosine_source_counter <= cosine_source_counter + '1';
--						if(cosine_source_counter < x"003F") then -- dead zone time 
--							aqcuire_sig <= '0';
--						elsif(cosine_source_counter >= x"003F" and cosine_source_counter < x"1b95")then
--								aqcuire_sig <= '1';
--							if((cosine_source_counter > x"0dac") and (cosine_source_counter < x"0E0C")) then	
--							
--								source_counter <= x"ffff";
--							else
--								source_counter <= (others => '0');
--							end if;
--						else
--							aqcuire_sig <= '0';
--							cosine_source_counter <= (others => '0');
--							--source_counter <= (others => '0');
--							flag_capture <= '0';
--						end if;
--				 end if;	
--			
--				 if (RM_Tx_Beam_EN = '1') then 
--					flag_capture <= '1';
--				 end if;	
--			SIG_ADC_DATAVALID_s1 <= SIG_ADC_DATAVALID;

--			end if;
	
--END PROCESS; 
		
End Behav_Rx_side;