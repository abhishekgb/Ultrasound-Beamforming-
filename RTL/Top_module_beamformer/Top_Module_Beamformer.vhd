
----------------------------------------------------------------------------------
-- Engineer				: 	Abhishek Gubbi Basavaraj/Sayed Faizan Aliakbar 
-- Create Date			:   15:30:57 06/01/2014 
-- Design Name			: 	Beam former Top module with Transmitter and Receiver Integration.
-- Module Name			:  Top_Module_Beamformer 
-- Project Name		: 	Ultrasound_Beamformer
-- Target Devices		: 	XC5VLX50-1FF676
-- Tool versions		: 	Xilinx ISE 14.4
-- Description			: 	Top module contains the port mapping between the Transmitter and Receiver section
-- Dependencies		: 
-- Revision				: 		
-- Revision 			:	0.01 - File Created
-- Additional Comments	: 
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
--Working Libraries Needed
----------------------------------------------------------------------------------
library ieee; 
Library UNISIM;                                                                  
use ieee.std_logic_1164.all;                                                    
use IEEE.NUMERIC_STD.ALL;                                                
use ieee.std_logic_signed.all;
use UNISIM.vcomponents.all; 



Entity Top_Module_Beamformer is
    port (
				----------------------------------------------------------------------------------
				--							Transmitter Section I/O's
				----------------------------------------------------------------------------------	
					-- 	Clock interface                                            
							Top_CLK_100Mhz				: in  std_logic;
							--Top_SYSTEM_RST 			: in  std_logic;
	
					-- 	Power supply sequence interface                                         
							Top_ENABLE1_1					: out std_logic;
							Top_ENABLE1_2					: out std_logic;
							Top_ENABLE1_3					: out std_logic;
							Top_ENABLE1_4					: out std_logic;
							Top_ENABLE1_5					: out std_logic;
							Top_ENABLE1_6					: out std_logic;
							Top_SYNC							: out std_logic;
							Top_POWER_OFF_SEQ 			: in  std_logic; 
							
					-- 	LM96570 Transmit Beamformer IC Interface                                
							Top_Tx_Beam_swr				: out std_logic;		--FPGA_sWR		
							Top_Tx_Beam_sle				: out std_logic;        --FPGA_sLE 	
							Top_Tx_Beam_sclk				: out std_logic;        --FPGA_sCLK	
							Top_Tx_Beam_srd				: out std_logic;        --FPGA_sRD		
							Top_Tx_Beam_EN					: out std_logic;        --TX_EN			
							
					-- 	Multiplexer IC Interface
							Top_Mux_clear_all				: out std_logic; 		-- CLEAR connected all the ic CLEAR externally in hardware
							Top_Mux_clk_5MHZ 				: out std_logic; 		-- Clock connected all the ic clk externally in hardware
							Top_Mux_Dout_IC_1				: in  std_logic; 		--|
							Top_Mux_Dout_IC_2				: in  std_logic;		--|
							Top_Mux_Dout_IC_3				: in  std_logic;		--|These pins are the Outputs from the Mux IC's
							Top_Mux_Dout_IC_4				: in  std_logic;		--|
							Top_Mux_LE_IC_1				: out std_logic;
							Top_Mux_LE_IC_2 				: out std_logic;
							Top_Mux_LE_IC_3 				: out std_logic;
							Top_Mux_LE_IC_4 				: out std_logic;
							Top_Mux_Din_IC_1 				: out std_logic;		--| 
							Top_Mux_Din_IC_2 				: out std_logic;		--|These pins are the inputs to the Mux IC's
							Top_Mux_Din_IC_3 				: out std_logic;		--|
							Top_Mux_Din_IC_4 				: out std_logic;			--|							

				----------------------------------------------------------------------------------
				--							Receiver Section I/O's
				----------------------------------------------------------------------------------
					-- 	AD9279 IC Programing interface
							Top_ADC_SDIO					: inout  std_logic; 		--|This pin is the input/output for reading writing configurations. 
							Top_ADC_CSB						: out std_logic; 			-- Chip Select Bar
							Top_ADC_CLK_25MHZ 				: out std_logic; 			-- SPI Clock operated at 25Mhz.
							
					--	LVDS interface from IC AD9279
							Top_ADC_FCO_P               	: in  std_logic;
							Top_ADC_FCO_N               	: in  std_logic;
							
							Top_ADC_DCO_P               	: in  std_logic;
							Top_ADC_DCO_N               	: in  std_logic;
							
							Top_ADC_CH1_P           		: in  std_logic;
							Top_ADC_CH1_N           		: in  std_logic;
							Top_ADC_CH2_P           		: in  std_logic;
							Top_ADC_CH2_N           		: in  std_logic;
							Top_ADC_CH3_P           		: in  std_logic;
							Top_ADC_CH3_N           		: in  std_logic;  
							Top_ADC_CH4_P           		: in  std_logic;
							Top_ADC_CH4_N           		: in  std_logic;  
							Top_ADC_CH5_P           		: in  std_logic;
							Top_ADC_CH5_N           		: in  std_logic;  
							Top_ADC_CH6_P           		: in  std_logic;
							Top_ADC_CH6_N           		: in  std_logic;  
							Top_ADC_CH7_P           		: in  std_logic;
							Top_ADC_CH7_N           		: in  std_logic;  
							Top_ADC_CH8_P           		: in  std_logic;
							Top_ADC_CH8_N           		: in  std_logic;  

					-- DAC Interface Module 
							Top_DAC_CLOCK_122_88			: in  std_logic;
							Top_DAC_out_data				: out std_logic_vector(11 downto 0); 	
							Top_DAC_WRT_A						: out std_logic;

					-- SRAM interface Module					

							Top_SRAM_clk_out    			: out std_logic; -- SRAM 200 MHz clock out --	
							--Top_SRAM_mode            		: out std_logic;	
							Top_SRAM_addr           		: out std_logic_vector(18 downto 0); 	
							Top_SRAM_adv_n           		: out std_logic;			 	
							Top_SRAM_adsp_n          		: out std_logic;                                	
							Top_SRAM_adsc_n       			: out std_logic;                                	
							Top_SRAM_ce_n         			: out std_logic;                                	
							Top_SRAM_ce2          			: out std_logic;                                	
							Top_SRAM_ce2_n        			: out std_logic;                                	
							Top_SRAM_bwa_n       	    	: out std_logic;                                	
							Top_SRAM_bwb_n       	    	: out std_logic;  	
							Top_SRAM_bwc_n       	    	: out std_logic;                                	
							Top_SRAM_bwd_n       	    	: out std_logic;			 	
							Top_SRAM_oe_n        	    	: out std_logic;                                
							Top_SRAM_global_wr_n 	    	: out std_logic;                                	
							Top_SRAM_bwe_n       	    	: out std_logic;                                
							Top_SRAM_zz          	    	: out std_logic; 
							Top_SRAM_DQ          	    	: inout std_logic_vector(17 downto 0);

					--USB interface Module
							Top_USB_CLKIN_48_MHZ			: in  std_logic; 
							Top_USB_sloe_n      			: out std_logic;  
							Top_USB_slrd_n      			: out std_logic;
							Top_USB_flagb        			: in  std_logic;
							Top_USB_flagc        			: in  std_logic;
							Top_USB_start					: in std_logic;
							Top_USB_fddr_n         			: out std_logic_vector(1 downto 0);
							Top_USB_usb_data_out     		: out std_logic_vector(15 downto 0);
							Top_USB_slwr_n       			: out std_logic;

					--RCI interface Module Operated in Asynchronous Mode      
							Top_USB_RCI_addr         		: in std_logic_vector (7 downto 0);-- USB_RCI_ address
							Top_USB_RCI_data        		: inout std_logic_vector (7 downto 0);                                                 
							Top_USB_RCI_csb_n        		: in std_logic ;
							Top_USB_RCI_Wr_n        		: in std_logic ;
							Top_USB_RCI_Rd_n        		: in std_logic ;
							Top_USB_RCI_oe_n				   : in std_logic ;
							
				----------------------------------------------------------------------------------
				--							Testing I/O's
				----------------------------------------------------------------------------------				
							
					--  Schedular Interface
							--Top_FOCUL_POINT_IN    		: in  std_logic;
							--Top_DYANAMIC_SIG 				: in  std_logic;
--							Top_POWER_OFF_SEQ				: in  std_logic;

					-- OTHERS teSTING
							Top_tp							: out std_logic	
		
						
	
							);
End Top_Module_Beamformer;

Architecture Behavioural_Top_Module_Beamformer of Top_Module_Beamformer is

----------------------------------------------------------------------------------
--							Signals Declaration
----------------------------------------------------------------------------------

---------------------------------------------------------------------------------
--							Transmitter Section Signals.
---------------------------------------------------------------------------------
			---------------------------- ONLY FOR CHIPSCOPE PURPOSE -------------------------------------			
signal    source_counter_CHIPSCOPE     :  std_logic_vector(15 downto 0) := (others => '0') ;
signal    data_sine_counter_CHIPSCOPE  :  std_logic_vector(3 downto 0) := (others => '0');
signal    lvds_fifo_full1_CHIPSCOPE              :  std_logic;


-- Power supply sequence signals
signal en_done							:std_logic := '0';
signal USB_CLKIN_sig 				: std_logic:= '0';
signal OFF_SEQ_result_temp			:std_logic := '0';
signal P_RCI_temp						:std_logic := '0';
signal OFF_SEQ_DYANAMIC_SIG_TEMP	:std_logic := '0';
signal Sig_Top_Tx_Beam_EN			:std_logic := '0'; 

---------------------------------------------------------------------------------
--							Receiver Section Signals.
---------------------------------------------------------------------------------
--
signal ADC_FCO_BUFGDS     			: std_logic:= '0';
signal ADC_FCO_BUFIO     			: std_logic:= '0';
signal ADC_FCO			     			: std_logic:= '0';
signal ADC_DCO_BUFGDS     			: std_logic:= '0';
signal ADC_DCO_BUFIO     			: std_logic:= '0';
signal ADC_DCO			     			: std_logic:= '0';
signal ADC_CH1_BUFDS 				: std_logic:= '0';
signal ADC_CH2_BUFDS 				: std_logic:= '0';
signal ADC_CH3_BUFDS 				: std_logic:= '0';
signal ADC_CH4_BUFDS 				: std_logic:= '0';
signal ADC_CH5_BUFDS 				: std_logic:= '0';
signal ADC_CH6_BUFDS 				: std_logic:= '0';
signal ADC_CH7_BUFDS 				: std_logic:= '0';
signal ADC_CH8_BUFDS 				: std_logic:= '0';
signal sig_ad9279_pgm_done			: std_logic:= '0'; 
--dac signals
signal sig_WRT_A						:std_logic := '0';
signal SIG_CLOCK_122_88				:std_logic := '0';
signal sig_DAC_data    				: std_logic_vector(11 downto 0) := (others => '0');
--usb signals
signal USB_slwr_s 					: std_logic;
signal USB_slrd_s 					: std_logic;
signal sig_Top_USB_start 			: std_logic:= '0';
signal sig_USB_usb_data_out		: std_logic_vector(15 downto 0) := (others => '0');
-- RCI signal
signal sig_Focal_point			: std_logic_vector (7 downto 0);
 
--testing
signal tp_sig						: std_logic := '0';
signal LA_datavalid1				: std_logic := '0';
signal LA_datavalid2				: std_logic := '0';
signal LA_ADC_ch1					: std_logic_vector (11 downto 0);
signal LA_ADC_ch2					: std_logic_vector (15 downto 0);
signal LA_ADC_ch3					: std_logic_vector (11 downto 0);
signal LA_ADC_ch4					: std_logic_vector (11 downto 0);
signal LA_ADC_ch5					: std_logic_vector (11 downto 0);
signal LA_ADC_ch6					: std_logic_vector (11 downto 0);
signal LA_ADC_ch7					: std_logic_vector (11 downto 0);
signal LA_ADC_ch8					: std_logic_vector (11 downto 0);
signal LA_Adder_op				: std_logic_vector (15 downto 0);
signal LA_DAC_data				: std_logic_vector (11 downto 0);

signal dead_zone_sig				: std_logic := '0';
signal delayed_Tx_EN				: std_logic := '0';
signal flag							: std_logic := '0';
signal dead_zone_counter		: std_logic_vector (15 downto 0):= (others => '0'); 
signal sig_Top_tp					: std_logic := '0';
---------------------------------------------------------------------------------
--							Schedular Signals.
---------------------------------------------------------------------------------
signal sig_beam_no     				: std_logic_vector(7 downto 0);-- := (others => '0');
signal Sig_tx_Dynamic 				: std_logic:= '0';
signal Sig_tx_Static 				: std_logic:= '0'; 
signal sig_headerfooter				: std_logic:= '0'; 


---------------------------------------------------------------------------------
--							Other Signals.
---------------------------------------------------------------------------------
-- Clock interface Signals
signal glb_clk		 					:std_logic := '0';
signal glb_clk_s	 					:std_logic := '0';
signal glb_clk_180	 				:std_logic := '0'; 
signal glb_clk_180_s	 				:std_logic := '0'; 
signal glb_clk_400mhz				:std_logic := '0';
signal sig_clk_400Mhz_s				:std_logic := '0';
signal sig_Bufg  						:std_logic := '0';
signal sig_lock						:std_logic;
signal g_reset							:std_logic := '1';
--signal g_reset 						:std_logic := '1';
--signal g_reset_r2 						:std_logic := '1';
signal reset_counter	 				:std_logic_vector(7 downto 0):= x"00";
signal trigger			 				:std_logic_vector(7 downto 0):= x"00";
signal COUNTER_VALUE	 				:std_logic_vector(15 downto 0);

---------------------------------------------------------------------------------
--							Component   Declarations.
---------------------------------------------------------------------------------
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
	
-- debouncing logic Component for Power OFF Sequence Increament		
	component PS_DEBOUNCE IS
				PORT(
						clk     				: IN  STD_LOGIC;  --button clock
						button  				: IN  STD_LOGIC;  --button signal to be debounced
						tig_mod_rst	 		: IN  STD_LOGIC;	 
						result  				: OUT STD_LOGIC --debounced signal
					 );
	end component;

-- Transmitter Top module 
Component Txside_Top_module is
       port (
					-- Clock Interface                                            
							TM_glb_clk						: in  std_logic;
							TM_glb_Reset			 		: in  std_logic;
	
					-- 	Power supply sequence interface                                         
							TM_ENABLE1_1					: out std_logic;
							TM_ENABLE1_2					: out std_logic;
							TM_ENABLE1_3					: out std_logic;
							TM_ENABLE1_4					: out std_logic;
							TM_ENABLE1_5					: out std_logic;
							TM_ENABLE1_6					: out std_logic;
							TM_SYNC							: out std_logic;
							TM_POWER_OFF_SEQ 				: in  std_logic; 
							
					-- 	LM96570 Transmit Beamformer IC Interface                                
							TM_Tx_Beam_swr					: out std_logic;			--FPGA_sWR		
							TM_Tx_Beam_sle					: out std_logic;        --FPGA_sLE 	
							TM_Tx_Beam_sclk				: out std_logic;        --FPGA_sCLK	
							TM_Tx_Beam_srd					: out std_logic;        --FPGA_sRD		
							TM_Tx_Beam_EN					: out std_logic;        --TX_EN			
							
					-- 	Multiplexer IC Interface
							TM_Mux_clear_all				: out std_logic; 		-- CLEAR connected all the ic CLEAR externally in hardware
							TM_Mux_clk_5MHZ 				: out std_logic; 		-- Clock connected all the ic clk externally in hardware
							TM_Mux_Dout_IC_1				: in  std_logic; 		--|
							TM_Mux_Dout_IC_2				: in  std_logic;		--|
							TM_Mux_Dout_IC_3				: in  std_logic;		--|These pins are the Outputs from the Mux IC's
							TM_Mux_Dout_IC_4				: in  std_logic;		--|
							TM_Mux_LE_IC_1					: out std_logic;
							TM_Mux_LE_IC_2 				: out std_logic;
							TM_Mux_LE_IC_3 				: out std_logic;
							TM_Mux_LE_IC_4 				: out std_logic;
							TM_Mux_Din_IC_1 				: out std_logic;		--| 
							TM_Mux_Din_IC_2 				: out std_logic;		--|These pins are the inputs to the Mux IC's
							TM_Mux_Din_IC_3 				: out std_logic;		--|
							TM_Mux_Din_IC_4 				: out std_logic;		--|					
											
					--  Schedular Interface
							TM_Focal_point					: in  std_logic_vector (7 downto 0);
							TM_BEAM_no						: in  std_logic_vector(7 downto 0);
							TM_Static_sig					: in  std_logic;
							TM_Dynamic_sig					: in  std_logic;
							TM_AD9279_pgm_done			: in  std_logic
					);
End Component;


Component Rxside_Top_module is
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
						RM_DAC_out_data					: out std_logic_vector(11 downto 0);				
						RM_DAC_WRT_A						: out std_logic;				
																	
				-- SRAM interface Module					
				                               			
						--RM_SRAM_clk_out    				: out std_logic; -- SRAM 200 MHz clock out --			 			
						--RM_SRAM_mode     				: out std_logic;	      			
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
						RM_adc_ch1_op						: out std_logic_vector (11 downto 0); 
						RM_adc_ch2_op						: out std_logic_vector (15 downto 0); 
						RM_adc_ch3_op						: out std_logic_vector (11 downto 0); 
						RM_adc_ch4_op						: out std_logic_vector (11 downto 0); 
						RM_adc_ch5_op						: out std_logic_vector (11 downto 0); 
						RM_adc_ch6_op						: out std_logic_vector (11 downto 0); 
						RM_adc_ch7_op						: out std_logic_vector (11 downto 0); 
						RM_adc_ch8_op						: out std_logic_vector (11 downto 0);
						RM_adc_Adder_op					: out std_logic_vector(15 downto 0);
						RM_DAC_data_out					: out std_logic_vector (11 downto 0);
						RM_RCI_TEST							: inout std_logic_vector (7 downto 0);
						RM_trigger1							: out std_logic;
						RM_trigger2							: out std_logic;
						RM_Tx_Beam_EN						: in std_logic;
			---------------------------- ONLY FOR CHIPSCOPE PURPOSE -------------------------------------			
						source_counter_CHIPSCOPE     : out std_logic_vector(15 downto 0);
			            lvds_fifo_full1_CHIPSCOPE               : out std_logic;
                        data_sine_counter_CHIPSCOPE     : out std_logic_vector(3 downto 0)
					
				);
End Component;


---- debouncing logic Component for Beam Increament & for Focalpoint Increament				
--				component debounce_logic IS
--							PORT(
--									 clk     				: IN  STD_LOGIC;  --button clock
--									 button  				: IN  STD_LOGIC;  --button signal to be debounced
--									 tig_mod_rst	 		: IN  STD_LOGIC;	 
--									 result  				: OUT STD_LOGIC --debounced signal
--								 );
--					end component;				
				
	
-- debouncing logic Component for Power OFF Sequence Increament		
--				component PS_DEBOUNCE IS
--							PORT(
--									 clk     				: IN  STD_LOGIC;  --button clock
--									 button  				: IN  STD_LOGIC;  --button signal to be debounced
--									 tig_mod_rst	 		: IN  STD_LOGIC;	 
--									 result  				: OUT STD_LOGIC --debounced signal
--								 );
--					end component;	

---- Schedular module (Mini Schedular)

		component Main_Schedular IS
					 Port ( 
							  SC_GLOBAL_CLK 		: IN STD_LOGIC;
							  RESET_IN 				: IN  STD_LOGIC;
							  sc_usb_start			: IN  STD_LOGIC;
							  TEST_BEAM_NO 		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
							  Tx_CONTROL_STATIC 	: OUT STD_LOGIC;
							  Tx_CONTROL_DYNAMIC : OUT STD_LOGIC;
							  enable_done2			: IN STD_LOGIC;
							  SC_ADC_FCO			: IN STD_LOGIC;
							  SC_HF_SIG				: OUT STD_LOGIC;
							  ---from tx side
							  SC_tx_enable       : in std_logic
							 );
		End Component  ; 




-- DAC module

-----------------------------------------------------------------------------------
----							To be removed
-----------------------------------------------------------------------------------
--signal control1_temp : std_logic_vector (35 downto 0);
--
--component icontrol2
--  PORT (
--    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
--
--end component;
--
--component logicanalyser1
--  PORT (
--    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
--    CLK : IN STD_LOGIC;
--    DATA : IN std_logic_vector(111 DOWNTO 0);
--    TRIG0 : IN STD_LOGIC_VECTOR(1 DOWNTO 0));
--
--end component;

	
Begin
---------------------------------------------------------------------------------
--							Internal Reset Generation
---------------------------------------------------------------------------------
				
RESET_LOGIC : process (glb_clk)
	begin
		IF RISING_EDGE(glb_clk) then
			--if (SYSTEM_RST = '1') THEN
				--g_reset <= '1';						
			--else
--				if(reset_counter = x"F0" ) then
--					g_reset <= '0';
--					g_reset <= '0';
--					g_reset_r2 <= '0';
				if (sig_lock = '1') then 
					g_reset <= '0';
--					reset_counter <= reset_counter + '1';
				end if;
		End if;
End process;
---------------------------------------------------------------------------------
--							Component   instantiations
---------------------------------------------------------------------------------

-- RAW signal to source signal generation using buffering
---------------------------------------------------------------------------------
-- 							USB Clock (48 MHz) IBUFG --
---------------------------------------------------------------------------------
	clk_48mhz : IBUFG
   generic map (
      IOSTANDARD => "DEFAULT")
   port map (
      O => USB_CLKIN_sig, -- 48 MHz Clock buffer output
      I => TOP_USB_CLKIN_48_MHZ  -- Clock buffer input
   );

---------------------------------------------------------------------------------
--							DAC input Clock (122.88 MHz) IBUFG --
---------------------------------------------------------------------------------
	clk_122_88mhz : IBUFG
   generic map (
      IOSTANDARD => "DEFAULT")
   port map (
      O => SIG_CLOCK_122_88, -- 122.88 MHz Clock buffer output
      I => Top_DAC_CLOCK_122_88  -- Clock buffer input
   );
---------------------------------------------------------------------------------
--							SRAM Clock out (200 MHz) BUFG
---------------------------------------------------------------------------------

	SRAM_200mhz : BUFG
   port map (
      O => Top_SRAM_clk_out, 
      I => glb_clk_s  
   );
---------------------------------------------------------------------------------
--							System Clock (200 MHz) BUFG --
---------------------------------------------------------------------------------   
	clk_200mhz : BUFG
   port map (
      O => glb_clk, 
      I => glb_clk_s  
   );
	
	clk_200mhz_180 : BUFG
   port map (
      O => glb_clk_180, 
      I => glb_clk_180_s  
   );
---------------------------------------------------------------------------------
--							System Clock (400 MHz) BUFG --
---------------------------------------------------------------------------------	

	clk_400mhz : BUFG
   port map (
      O => glb_clk_400mhz, 
      I => sig_clk_400Mhz_s  
   );
---------------------------------------------------------------------------------
-- 							Conversion for FCO  
---------------------------------------------------------------------------------

   FCO_IBUFDS : IBUFDS
   generic map (
      IOSTANDARD => "DEFAULT")
   port map (
      O => ADC_FCO_BUFGDS,  -- Clock buffer output
      I => Top_ADC_FCO_P,  -- Diff_p clock buffer input
      IB => Top_ADC_FCO_N -- Diff_n clock buffer input
   );

   FCO_BUFIO : BUFIO
   port map (
      O => ADC_FCO_BUFIO,--ADC_FCO, --ADC_FCO_BUFIO,     -- Clock buffer output
      I => ADC_FCO_BUFGDS      -- Clock buffer input
   );

	FCO_BUFR : BUFR
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
-- 							Conversion for DCO
---------------------------------------------------------------------------------  

   DCO_IBUFDS : IBUFDS
   generic map (
      IOSTANDARD => "DEFAULT")
   port map (
      O => ADC_DCO_BUFGDS,  -- Clock buffer output
      I => Top_ADC_DCO_P,  -- Diff_p clock buffer input
      IB => Top_ADC_DCO_N -- Diff_n clock buffer input
   );

   DCO_BUFIO : BUFIO
   port map (
      O => ADC_DCO_BUFIO,--  Clock buffer output--     --
      I => ADC_DCO_BUFGDS      -- Clock buffer input
   );

	DCO_BUFR : BUFR
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
     CH1_IBUFDS : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_CH1_BUFDS,  -- Clock buffer output
        I =>  Top_ADC_CH1_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => Top_ADC_CH1_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line2 
     CH2_IBUFDS : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_CH2_BUFDS,  -- Clock buffer output
        I =>  Top_ADC_CH2_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => Top_ADC_CH2_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line3 
     CH3_IBUFDS : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_CH3_BUFDS,  -- Clock buffer output
        I => Top_ADC_CH3_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => Top_ADC_CH3_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line4 
     CH4_IBUFDS : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_CH4_BUFDS,  -- Clock buffer output
        I => Top_ADC_CH4_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => Top_ADC_CH4_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line5 
     CH5_IBUFDS : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_CH5_BUFDS,  -- Clock buffer output
        I => Top_ADC_CH5_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => Top_ADC_CH5_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line6 
     CH6_IBUFDS: IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)--, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_CH6_BUFDS,  	-- Clock buffer output
        I => Top_ADC_CH6_P,  	-- Diff_p clock buffer input (connect directly to top-level port)
        IB => Top_ADC_CH6_N 	-- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line7 
     CH7_IBUFDS : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)		-- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_CH7_BUFDS,  	-- Clock buffer output
        I => Top_ADC_CH7_P,  	-- Diff_p clock buffer input (connect directly to top-level port)
        IB => Top_ADC_CH7_N 	-- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line8 
     CH8_IBUFDS : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => TRUE)		-- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        --IOSTANDARD => "DEFAULT" )
     port map (
        O => ADC_CH8_BUFDS,  	-- Clock buffer output
        I => Top_ADC_CH8_P,  	-- Diff_p clock buffer input (connect directly to top-level port)
        IB => Top_ADC_CH8_N 	-- Diff_n clock buffer input (connect directly to top-level port)
     ); 

 
---------------------------------------------------------------------------------
--							Component Instantiation 
---------------------------------------------------------------------------------   

-- Digital Clock Manager 
   
		clock_gen : freq_mul
				port map(
								CLKin_in 				=> Top_CLK_100Mhz,
								CLKin_IBUFG_out 		=> sig_Bufg,
								CLKout0_out 			=> sig_clk_400Mhz_s,--400 MHz
								CLKout1_out 			=> glb_clk_s, --200 MHz
								CLKout2_out				=> glb_clk_180_s,
								LOCKED_out 				=> sig_lock
						);
						
--	Transmitter Instantiation
Top_Module_Transmitter : Txside_Top_module
       port map(
					-- Clock Interface                                            
							TM_glb_clk					=>	glb_clk,
							TM_glb_Reset			 	=>	g_reset,
	
					-- 	Power supply sequence interface                          
							TM_ENABLE1_1				=> Top_ENABLE1_1,				
							TM_ENABLE1_2				=> Top_ENABLE1_2,				
							TM_ENABLE1_3				=> Top_ENABLE1_3,				
							TM_ENABLE1_4				=> Top_ENABLE1_4,				
							TM_ENABLE1_5				=> Top_ENABLE1_5,				
							TM_ENABLE1_6				=> en_done,				
							TM_SYNC						=> Top_SYNC,						
							TM_POWER_OFF_SEQ 			=> Top_POWER_OFF_SEQ, 		
							                           
					-- 	LM96570 Transmit Beamformer IC Interface                           
							TM_Tx_Beam_swr				=>	Top_Tx_Beam_swr,			
							TM_Tx_Beam_sle				=>	Top_Tx_Beam_sle,			
							TM_Tx_Beam_sclk			=>	Top_Tx_Beam_sclk,			
							TM_Tx_Beam_srd				=>	Top_Tx_Beam_srd,			
							TM_Tx_Beam_EN				=>	Sig_Top_Tx_Beam_EN,				
							                          
					-- 	Multiplexer IC Interface   
							TM_Mux_clear_all			=>	Top_Mux_clear_all,			
							TM_Mux_clk_5MHZ 			=>	Top_Mux_clk_5MHZ,			
							TM_Mux_Dout_IC_1			=>	Top_Mux_Dout_IC_1,			
							TM_Mux_Dout_IC_2			=>	Top_Mux_Dout_IC_2,			
							TM_Mux_Dout_IC_3			=>	Top_Mux_Dout_IC_3,			
							TM_Mux_Dout_IC_4			=>	Top_Mux_Dout_IC_4,			
							TM_Mux_LE_IC_1				=>	Top_Mux_LE_IC_1,			
							TM_Mux_LE_IC_2 			=>	Top_Mux_LE_IC_2, 			
							TM_Mux_LE_IC_3 			=>	Top_Mux_LE_IC_3, 			
							TM_Mux_LE_IC_4 			=>	Top_Mux_LE_IC_4, 			
							TM_Mux_Din_IC_1 			=>	Top_Mux_Din_IC_1, 			
							TM_Mux_Din_IC_2 			=>	Top_Mux_Din_IC_2,			
							TM_Mux_Din_IC_3 			=>	Top_Mux_Din_IC_3, 			
							TM_Mux_Din_IC_4 			=>	Top_Mux_Din_IC_4,
							
					-- Schedular Interface
							TM_Focal_point				=> sig_Focal_point,
							TM_BEAM_no					=> sig_beam_no,--x"01",--
							TM_Static_sig				=> Sig_tx_static,
							TM_Dynamic_sig				=> Sig_tx_Dynamic,
							TM_AD9279_pgm_done		=> sig_ad9279_pgm_done
					);
					
--	Receiver Instantiation

Top_Module_Receiver : Rxside_Top_module
		port map(
					-- Clock interface                                            
							RM_glb_clk 					=> glb_clk,
							RM_glb_clk_180 			=> glb_clk_180,
							RM_glb_clk_400 			=> glb_clk_400mhz,
							RM_glb_Reset				=>	g_reset,
							RM_PS_EN						=> en_done,

					-- 	AD9279 IC Programing interface
							RM_ADC_SDIO					=>	Top_ADC_SDIO,			--	This pin is the input/output for reading writing configurations. 
							RM_ADC_CSB					=>	Top_ADC_CSB,			-- Chip Select Bar	
							RM_ADC_CLK_25MHZ 			=>	Top_ADC_CLK_25MHZ,	-- SPI Clock operated at 25Mhz.                 
							                             
					--	LVDS interface from IC AD9279  			
							RM_ADC_FCO					=> ADC_FCO,
							RM_ADC_DCO					=>	ADC_DCO,
							RM_ADC_CH1         		=>	ADC_CH1_BUFDS, 
							RM_ADC_CH2         		=> ADC_CH2_BUFDS,	
							RM_ADC_CH3     			=> ADC_CH3_BUFDS,
							RM_ADC_CH4     			=> ADC_CH4_BUFDS,
							RM_ADC_CH5     			=> ADC_CH5_BUFDS,
							RM_ADC_CH6     			=> ADC_CH6_BUFDS,
							RM_ADC_CH7     			=> ADC_CH7_BUFDS,
							RM_ADC_CH8     			=> ADC_CH8_BUFDS,	
                                                    		
					-- DAC Interface Module             	
							RM_DAC_CLOCK_122_88		=>	SIG_CLOCK_122_88, 		
							RM_DAC_out_data			=>	Top_DAC_out_data, 	
							RM_DAC_WRT_A				=>	Top_DAC_WRT_A,
            																	
					-- SRAM interface Module			   
                                                   
							--RM_SRAM_clk_out    		=> Top_SRAM_clk_out,	
							--RM_SRAM_mode          => --Top_SRAM_mode,
							RM_SRAM_addr           	=> Top_SRAM_addr,
							RM_SRAM_adv_n           => Top_SRAM_adv_n,
							RM_SRAM_adsp_n          => Top_SRAM_adsp_n,	
							RM_SRAM_adsc_n       	=> Top_SRAM_adsc_n,	
							RM_SRAM_ce_n         	=> Top_SRAM_ce_n,	
							RM_SRAM_ce2          	=> Top_SRAM_ce2,	
							RM_SRAM_ce2_n        	=> Top_SRAM_ce2_n,	
							RM_SRAM_bwa_n       	   => Top_SRAM_bwa_n,	
							RM_SRAM_bwb_n       	   => Top_SRAM_bwb_n,	
							RM_SRAM_bwc_n       	   => Top_SRAM_bwc_n,	
							RM_SRAM_bwd_n       	   => Top_SRAM_bwd_n,	
							RM_SRAM_oe_n        	  	=> Top_SRAM_oe_n,	
							RM_SRAM_global_wr_n 	   => Top_SRAM_global_wr_n,	
							RM_SRAM_bwe_n       	   => Top_SRAM_bwe_n,	
							RM_SRAM_zz          	   => Top_SRAM_zz,	
							RM_SRAM_DQ          	   => Top_SRAM_DQ,	

					--USB interface Module
							RM_USB_CLKIN_48_MHZ		=>	USB_CLKIN_sig,
							RM_USB_sloe_n      		=>	Top_USB_sloe_n,
							RM_USB_slrd_n      		=>	Top_USB_slrd_n,
							RM_USB_flagb        		=>	Top_USB_flagb,
							RM_USB_flagc        		=>	Top_USB_flagc,
							RM_USB_start				=>	sig_Top_USB_start,
							RM_USB_fddr_n         	=>	Top_USB_fddr_n,
							RM_USB_usb_data_out     =>	sig_USB_usb_data_out,
							RM_USB_slwr_n       		=>	Top_USB_slwr_n,

					--RCI interface Module Operated in Asynchronous Mode      
							RM_USB_RCI_addr        	=>	Top_USB_RCI_addr,
							RM_USB_RCI_data         =>	Top_USB_RCI_data,                        
							RM_USB_RCI_csb_n       	=>	Top_USB_RCI_csb_n,
							RM_USB_RCI_Wr_n       	=>	Top_USB_RCI_Wr_n,
							RM_USB_RCI_Rd_n       	=>	Top_USB_RCI_Rd_n,
							RM_USB_RCI_oe_n			=>	Top_USB_RCI_oe_n,
							
					-- OTHERS testing
							RM_Focal_point				=> sig_Focal_point,
							RM_Beam_No					=> sig_beam_no,
							RM_ADC_prog_done			=> sig_ad9279_pgm_done,
							RM_tp							=> sig_Top_tp,
							RM_adc_ch1_op				=> LA_ADC_ch1,
							RM_adc_ch2_op				=> LA_ADC_ch2,
							RM_adc_ch3_op				=> LA_ADC_ch3,
							RM_adc_ch4_op				=> LA_ADC_ch4,
							RM_adc_ch5_op				=> LA_ADC_ch5,
							RM_adc_ch6_op				=> LA_ADC_ch6,
							RM_adc_ch7_op				=> LA_ADC_ch7,
							RM_adc_ch8_op				=> LA_ADC_ch8,
							RM_adc_Adder_op			=> LA_Adder_op,
							RM_DAC_data_out			=> LA_DAC_data,
							RM_RCI_TEST					=> open , --trigger,
							RM_trigger1					=> LA_datavalid1,
							RM_trigger2					=> LA_datavalid2,
							RM_Tx_Beam_EN				=> Sig_Top_Tx_Beam_EN,
							source_counter_CHIPSCOPE    => source_counter_CHIPSCOPE ,
                     data_sine_counter_CHIPSCOPE => data_sine_counter_CHIPSCOPE,
			            lvds_fifo_full1_CHIPSCOPE             => lvds_fifo_full1_CHIPSCOPE                



							
							
						);
							
							
-- Schedular Module(Mini Schedular) 

			Main_SCH : Main_Schedular
				Port Map( 
							  SC_GLOBAL_CLK 			=>	glb_clk,
							  RESET_IN 				   => g_reset,
							  sc_usb_start				=> sig_Top_USB_start,
							  TEST_BEAM_NO 		   =>	sig_beam_no,
							  Tx_CONTROL_STATIC 	   => Sig_tx_Static,
							  Tx_CONTROL_DYNAMIC    => Sig_tx_Dynamic,
							  enable_done2			   => en_done,
							  SC_ADC_FCO				=> ADC_FCO,
							  SC_HF_SIG					=> sig_headerfooter,
							  SC_tx_enable          =>	Sig_Top_Tx_Beam_EN
							 );
			 
-------------------------------------------------------------------------------
	--						To be removed
-------------------------------------------------------------------------------
--
--i_control : icontrol2
--  port map (
--    CONTROL0 => control1_temp
--	 );
--
--Logic_Analyser : logicanalyser1
--port map (
--CLK => glb_clk,--ADC_DCO,--glb_clk_400mhz,--
--DATA(5 downto 0)  => LA_ADC_ch1(5 downto 0),
--data(11 downto 6) => "000000",
--DATA(27 downto 12) => LA_Adder_op,
----DATA(33 downto 28) => LA_ADC_ch2(11 downto 6),
--DATA(43 downto 28) => LA_ADC_ch2(15 downto 0),
----DATA(35 downto 24) => LA_ADC_ch3,
--DATA(47 downto 44) => LA_ADC_ch4(3 downto 0),
--DATA(59 downto 48) => LA_ADC_ch5,
--DATA(71 downto 60) => LA_ADC_ch6,
--DATA(83 downto 72) => LA_ADC_ch7,
--DATA(95 downto 84) => LA_ADC_ch8,
--DATA(111 downto 96) => LA_Adder_op,-- sig_USB_usb_data_out;sig_USB_usb_data_out,--
--TRIG0(0) =>	glb_clk, 
--TRIG0(1) => LA_ADC_ch1(1),
--CONTROL => control1_temp);
---------------------------------------------------------------------------------
-- for rising edge detection of tx en delaying the original signal
---------------------------------------------------------------------------------
--	PROCESS(glb_clk,Sig_Top_Tx_Beam_EN)
--		begin
--         IF RISING_EDGE(glb_clk) then
--					IF (g_reset = '1') THEN
--							delayed_Tx_EN <= '0';
--					ELSE
--						delayed_Tx_EN <= Sig_Top_Tx_Beam_EN;
--					END IF;
--			END IF;
--	END PROCESS;		
---------------------------------------------------------------------------------
-- dead zone timing generation 500ns for timing being for triggering the Logic analyser
---------------------------------------------------------------------------------
--dead_zone_timing_generation: process (glb_clk)
--	begin
--		IF RISING_EDGE(glb_clk) then
--			if (g_reset = '1') THEN
--				dead_zone_sig <= '0';
--				flag <= '0';
--				dead_zone_counter <= (others => '0');
--			else
--				if(Sig_Top_Tx_Beam_EN = '1' and delayed_Tx_EN = '0') then --rising edge detection
--					flag <= '1';
--				end if;	
--				
--				if( flag = '1' and dead_zone_counter < x"0068" ) then --68H for 500 ns
--					dead_zone_counter <= dead_zone_counter + '1';
--				else
--					dead_zone_counter <= (others => '0');
--					dead_zone_sig <= '0';
--				end if;
--				
--				if(dead_zone_counter = x"0064") then --COUNTER_VALUE - 3 ) then--160us(x"7D00") 85us(x"4268") 40us(x"1F40")	 --500 ns(64H)
--					dead_zone_sig <= '1';
--				elsif	(dead_zone_counter = x"0067") then
--					flag <= '0';
--				end if;	
--			End if;
--		END IF;	
--End process;
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
--							I/O Mapping
---------------------------------------------------------------------------------
Top_tp <= sig_Top_tp;
Top_ENABLE1_6    		<= en_done;
Top_Tx_Beam_EN			<= Sig_Top_Tx_Beam_EN;
Top_USB_usb_data_out	<=	sig_USB_usb_data_out;
sig_Top_USB_start <= Top_USB_start;
End Behavioural_Top_Module_Beamformer;