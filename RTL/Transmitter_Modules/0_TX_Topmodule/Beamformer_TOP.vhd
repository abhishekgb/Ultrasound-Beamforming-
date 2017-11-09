----------------------------------------------------------------------------------

-- Engineer: 			Abhishek Gubbi Basavaraj/Sayed Faizan Aliakbar	
-- 
-- Create Date:   	12:02:34 09/05/2013 
-- Design Name: 		Top level 
-- Module Name:   	Txside_Top_module - Behavioral 
-- Project Name: 		Ultrasound Beam Former 
-- Target Devices: 	XC5VLX50-1FF676
-- Tool versions: 	ISE 14.4
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;                                                   
use IEEE.STD_LOGIC_UNSIGNED.ALL;  

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Txside_Top_module is
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
							TM_Focal_point					: in	std_logic_vector (7 downto 0);
							TM_BEAM_no						: in  std_logic_vector(7 downto 0);
							TM_Static_sig					: in  std_logic;
							TM_Dynamic_sig					: in  std_logic;
							TM_AD9279_pgm_done			: in  std_logic
				);
end Txside_Top_module;


Architecture Main_Behavioral of Txside_Top_module is

				---------------------------------------------------
							-- Signals Declaration
				---------------------------------------------------
-- Power supply sequence signals
signal en_done							:STD_LOGIC := '0';
signal OFF_SEQ_result_temp			:STD_LOGIC := '0';

----Schedular signals  
--signal STATIC_CONFIG_TEMP 			:STD_LOGIC := '0';
--signal BEAM_DYANAMIC_SIG_TEMP 	:STD_LOGIC := '0';
--signal FP_DYANAMIC_SIG_TEMP 		:STD_LOGIC := '0';
--signal OFF_SEQ_DYANAMIC_SIG_TEMP :STD_LOGIC := '0';
--signal Tx_DYNAMIC_CONFIG_temp 	:STD_LOGIC := '0';

--signal Mux_DYNAMIC_CONFIG_temp 	:STD_LOGIC := '0';
signal LE_IC_TEMP						:STD_LOGIC := '0';
signal BEAM_NO_TEMP	 				:STD_LOGIC_VECTOR(6 downto 0):= "0000000";

-- LM96570 Transmit Beamformer IC signals & Multiplexer IC signals
signal TRIG_BEAM_TEMP				:STD_LOGIC := '0';
signal BEAM_result_temp				:STD_LOGIC := '0';
signal FP_result_temp				:STD_LOGIC := '0';
signal FOCAL_PT_TEMP					:STD_LOGIC_VECTOR (7 downto 0):= x"00";


				---------------------------------------------------
							-- Component Declaration
				---------------------------------------------------
				
-- Power supply sequence Component
				component POWER_SEQUENCE is
						port(
								P_OTP1						: in  std_logic;
								P_RESET						: in  std_logic;
								P_GLOBAL_CLK				: in  std_logic;
								P_ENABLE1_1					: out std_logic;
								P_ENABLE1_2					: out std_logic;
								P_ENABLE1_3					: out std_logic;
								P_ENABLE1_4					: out std_logic;
								P_ENABLE1_5					: out std_logic;
								P_ENABLE1_6					: out std_logic;
								P_SYNC						: out std_logic
							);
				end component;

-- LM96570 Transmit Beamformer IC Component
				component IC_Beamformer is
					 Port (
								TX_GLOBAL_CLK				: in  std_logic;
								enable_done					: in  std_logic;
								CONTROL_STATIC_CONFIG 	: in  std_logic;
								CONTROL_DYNAMIC_CONFIG 	: in  std_logic;
								TX_MODULE_RST 				: in  std_logic;
								TX_FPGA_sWR					: out std_logic;	
								TX_FPGA_sLE 				: out std_logic;
								TX_FPGA_Tx_EN 				: out std_logic;
								TX_FPGA_sCLK				: out std_logic;
								TX_AD9279_pgm_done		: in  std_logic;
								TX_RCI_DATA 				: in  std_logic_vector (7 downto 0);
								BEAM_NO 						: in  std_logic_vector (7 downto 0)
							);
				end component;
				
-- Multiplexer IC Component
				component MUX_MODULE is
						 Port ( 
								  MUX_GLOBAL_CLK 			: in  std_logic;
								  MUX_MOD_RST 				: in  std_logic;
								  MUX_DYNAMIC_CONFIG 	: in  std_logic;
								  MUX_DOUT_IC1 			: in  std_logic;
								  MUX_DOUT_IC2 			: in  std_logic;
								  MUX_DOUT_IC3 			: in  std_logic;
								  MUX_DOUT_IC4 			: in  std_logic;
								  enable_done3				: in  std_logic;
								  MUX_LE_IC					: out std_logic;
								  MUX_CLEAR 				: out std_logic;
								  MUX_CLK_5MHZ				: out std_logic;
								  MUX_DIN_IC1				: out std_logic;
								  MUX_DIN_IC2				: out std_logic;
								  MUX_DIN_IC3				: out std_logic;
								  MUX_DIN_IC4				: out std_logic;
								  MUX_BEAM_NO 				: in  std_logic_vector (7 downto 0)
								);
				end component;


 begin
				---------------------------------------------------
							-- Process statements
				---------------------------------------------------


-- Power supply Component Instantiation

			POWER : POWER_SEQUENCE
				
				port map(	
								P_OTP1 						=> '0',--OFF_SEQ_result_temp,		
								P_RESET						=>	TM_glb_Reset,	
								P_GLOBAL_CLK				=> TM_glb_clk,
								P_ENABLE1_1					=>	TM_ENABLE1_1,
								P_ENABLE1_2					=>	TM_ENABLE1_2,
								P_ENABLE1_3					=>	TM_ENABLE1_3,
								P_ENABLE1_4					=>	TM_ENABLE1_4,
								P_ENABLE1_5					=> TM_ENABLE1_5,	
								P_ENABLE1_6					=>	en_done,
								P_SYNC						=> TM_SYNC
					);
		

-- LM96570 Transmit Beamformer IC Component Instantiation

		
			TRANSMIT : IC_Beamformer
				 port map(
								TX_GLOBAL_CLK 				=> TM_glb_clk,
								TX_FPGA_sWR					=>	TM_Tx_Beam_swr,
								TX_FPGA_sLE 				=> TM_Tx_Beam_sle,
								TX_MODULE_RST 				=> TM_glb_Reset,
								TX_FPGA_sCLK 				=> TM_Tx_Beam_sclk,
								TX_FPGA_Tx_EN 				=> TM_Tx_Beam_EN,
								TX_AD9279_pgm_done		=> TM_AD9279_pgm_done,
								CONTROL_STATIC_CONFIG 	=> TM_Static_sig,--STATIC_CONFIG_TEMP,
								CONTROL_DYNAMIC_CONFIG 	=> TM_Dynamic_sig,--Tx_DYNAMIC_CONFIG_temp,
								TX_RCI_DATA 				=> TM_Focal_point,
								BEAM_NO 						=> TM_BEAM_no,--BEAM_NO_TEMP,
								--TX_fpga_SRrd				=> TM_Tx_Beam_srd
								enable_done 				=> en_done
							);


-- Multiplexer IC Component Instantiation

			MODULE_MUX : MUX_MODULE 
				 port map(
								MUX_GLOBAL_CLK 			=> TM_glb_clk ,
								MUX_MOD_RST 				=> TM_glb_Reset,
								MUX_BEAM_NO 				=> TM_BEAM_no,--BEAM_NO_TEMP,
								MUX_DYNAMIC_CONFIG 		=> TM_Dynamic_sig,--Tx_DYNAMIC_CONFIG_temp,
								MUX_DOUT_IC1 				=> TM_Mux_Dout_IC_1,
								MUX_DOUT_IC2 				=> TM_Mux_Dout_IC_2,
								MUX_DOUT_IC3 				=> TM_Mux_Dout_IC_3,
								MUX_DOUT_IC4 				=> TM_Mux_Dout_IC_4 ,
								MUX_DIN_IC1					=> TM_Mux_Din_IC_1,
								MUX_DIN_IC2					=> TM_Mux_Din_IC_2,
								MUX_DIN_IC3					=> TM_Mux_Din_IC_3,
								MUX_DIN_IC4					=> TM_Mux_Din_IC_4,
								MUX_LE_IC					=> LE_IC_TEMP,
								MUX_CLEAR 					=>	TM_Mux_clear_all,
								MUX_CLK_5MHZ				=> TM_Mux_clk_5MHZ,
								enable_done3	 			=> en_done
							
							);
							
				---------------------------------------------------
							-- Main Interface 
				---------------------------------------------------
				
TM_Mux_LE_IC_1	 <= LE_IC_TEMP;
TM_Mux_LE_IC_2	 <= LE_IC_TEMP;
TM_Mux_LE_IC_3	 <= LE_IC_TEMP;
TM_Mux_LE_IC_4  <= LE_IC_TEMP;
TM_ENABLE1_6 <= en_done;
--TM_glb_Reset  	 <= SYSTEM_RST;
--FP_DYANAMIC_SIG_TEMP <= FOCUL_POINT_IN;
--OFF_SEQ_DYANAMIC_SIG_TEMP <= POWER_OFF_SEQ;
end Main_Behavioral;