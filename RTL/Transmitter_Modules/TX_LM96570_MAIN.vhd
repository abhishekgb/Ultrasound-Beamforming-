----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:12:57 05/9/2013 
-- Design Name: 
-- Module Name:    Beamformer_main - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Beamformer_main is
    Port (	
				CLK_100MHZ 	: in  STD_LOGIC;
				FPGA_sWR		: out std_logic;	-- serial data out	
				FPGA_sLE 	: out  STD_LOGIC;
				SYSTEM_RST 	: in  STD_LOGIC;
				FPGA_sCLK	: out  STD_LOGIC;
				FPGA_sRD		: out  STD_LOGIC;
				TX_EN			: out std_logic;
				
				FOCUL_POINT_IN    : IN std_logic;
				DYANAMIC_SIG : in STD_LOGIC;
				
				ENABLE1_1	: out std_logic;
				ENABLE1_2	: out std_logic;
				ENABLE1_3	: out std_logic;
				ENABLE1_4	: out std_logic;
				ENABLE1_5	: out std_logic;
				ENABLE1_6	: out std_logic;
				SYNC			: out std_logic	
			);
end TX_LM96570_MAIN;

architecture Behavioral of TX_LM96570_MAIN is

COMPONENT Inst_clk_module
		PORT(
				CLKIN_IN 			: IN STD_LOGIC;
				RST_IN 				: IN STD_LOGIC;          
				CLKIN_IBUFG_OUT 	: OUT STD_LOGIC;
				CLK0_OUT 			: OUT STD_LOGIC;
				CLK2X_OUT 			: OUT STD_LOGIC;
				LOCKED_OUT 			: OUT STD_LOGIC
			 );
END COMPONENT;


COMPONENT POWER_SEQUENCE IS
	PORT(
			P_OTP1			: IN STD_LOGIC;
			P_RESET			: IN STD_LOGIC;
			P_GLOBAL_CLK	: IN STD_LOGIC;
			P_ENABLE1_1		: OUT STD_LOGIC;
			P_ENABLE1_2		: OUT STD_LOGIC;
			P_ENABLE1_3		: OUT STD_LOGIC;
			P_ENABLE1_4		: OUT STD_LOGIC;
			P_ENABLE1_5		: OUT STD_LOGIC;
			P_ENABLE1_6		: OUT STD_LOGIC;
			P_SYNC			: OUT STD_LOGIC
		);
END COMPONENT;

COMPONENT IC_Beamformer is
    Port (
				TX_GLOBAL_CLK	: IN STD_LOGIC;
				TX_FPGA_sWR		: OUT STD_LOGIC;	-- serial data out	
--				TX_FPGA_sRD 	: IN STD_LOGIC;
				TX_FPGA_sLE 	: OUT STD_LOGIC;
				TX_MODULE_RST 	: IN STD_LOGIC;
				TX_FPGA_Tx_EN 	: OUT STD_LOGIC;
				TX_FPGA_sCLK	: OUT STD_LOGIC;
				enable_done		: in std_logic;
				CONTROL_STATIC_CONFIG :IN	STD_LOGIC;
				CONTROL_DYNAMIC_CONFIG :IN STD_LOGIC;
				TX_RCI_DATA 	: IN STD_LOGIC_VECTOR(7 downto 0);
				BEAM_NO 			:IN STD_LOGIC_VECTOR (6 downto 0)
			);
END COMPONENT;

COMPONENT SCHEDULAR IS
	Port ( 
			  SC_GLOBAL_CLK : IN STD_LOGIC;
			  RESET_IN : IN  STD_LOGIC;
			  TEST_BEAM_NO : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			  TEST_FP_NO : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			  Tx_CONTROL_STATIC : OUT STD_LOGIC;
			  enable_done2			: IN STD_LOGIC;
           Tx_CONTROL_DYNAMIC : OUT STD_LOGIC;
			  TRIG_BEAM 	: IN STD_LOGIC;
			  TRIG_FP				: IN STD_LOGIC
			 );		 
END COMPONENT;

--COMPONENT debounce IS
--  GENERIC(
--    counter_size  :  INTEGER := 14); --counter size (19 bits gives 10.5ms with 50MHz clock)
--  PORT(
--    clk     : IN  STD_LOGIC;  --input clock
--    button  : IN  STD_LOGIC;  --input signal to be debounced
--    result  : OUT STD_LOGIC); --debounced signal
--END COMPONENT;

SIGNAL GLOBAL_CLK :STD_LOGIC ;
SIGNAL mybufg  	:STD_LOGIC ;
SIGNAL lock  		:STD_LOGIC ;
SIGNAL source 		:STD_LOGIC ;
SIGNAL reset 		:STD_LOGIC ;

SIGNAL STATIC_CONFIG_OUT_TEMP :STD_LOGIC ;
SIGNAL DYNAMIC_CONFIG_OUT_TEMP :STD_LOGIC ;
SIGNAL FOCAL_PT_OUT_TEMP 	: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL BEAM_NO_OUT_TEMP :STD_LOGIC_VECTOR(6 DOWNTO 0) ;
SIGNAL en_done:STD_LOGIC ;
SIGNAL TRIG_BEAM_TEMP:STD_LOGIC ;
SIGNAL DYANAMIC_SIG_TEMP:STD_LOGIC := '0';

BEGIN

reset <= SYSTEM_RST ; 
--TRIG_BEAM_CP <= TRIG_BEAM_TEMP;
ENABLE1_6 <= en_done;
process(GLOBAL_CLK) is
 begin
  if(rising_edge(GLOBAL_CLK)) then
    DYANAMIC_SIG_TEMP <= DYANAMIC_SIG ;
   end if;
 end process;


MODULE_DCM : Inst_clk_module 
PORT MAP(
		CLKIN_IN => CLK_100MHZ,
		RST_IN 	=> '0',
		CLKIN_IBUFG_OUT => mybufg,
		CLK0_OUT => source,
		CLK2X_OUT => GLOBAL_CLK,
		LOCKED_OUT => lock 
	);

POWER : POWER_SEQUENCE
	
	PORT MAP(	
					P_OTP1 => '0',		
					P_RESET	=>	reset,	
					P_GLOBAL_CLK	=> GLOBAL_CLK,
					P_ENABLE1_1	=>	ENABLE1_1,
					P_ENABLE1_2	=>	ENABLE1_2,
					P_ENABLE1_3	=>	ENABLE1_3,
					P_ENABLE1_4	=>	ENABLE1_4,
					P_ENABLE1_5	=> ENABLE1_5,	
					P_ENABLE1_6	=>	en_done,
					P_SYNC	=> 	SYNC
		);
		
		
--dynamic_sig_switch : debounce
--
--PORT MAP (
--    clk     => GLOBAL_CLK,
--    button  => DYANAMIC_SIG,
--    result  => TRIG_BEAM_TEMP
--	 );

TRANSMIT : IC_Beamformer
    PORT MAP (
					TX_GLOBAL_CLK => GLOBAL_CLK,
					TX_FPGA_sWR	=>	FPGA_sWR,
					TX_FPGA_sLE => FPGA_sLE,
					TX_MODULE_RST => reset,
					TX_FPGA_sCLK => FPGA_sCLK,
					TX_FPGA_Tx_EN => TX_EN,
					CONTROL_STATIC_CONFIG => STATIC_CONFIG_OUT_TEMP,
					CONTROL_DYNAMIC_CONFIG => DYANAMIC_SIG_TEMP,
					TX_RCI_DATA => FOCAL_PT_OUT_TEMP,
					BEAM_NO =>  BEAM_NO_OUT_TEMP,
					enable_done => en_done
				);

MINI : SCHEDULAR
    PORT MAP 
			(
			  SC_GLOBAL_CLK => GLOBAL_CLK,
			  RESET_IN => reset,
			  TEST_BEAM_NO => BEAM_NO_OUT_TEMP ,
			  TEST_FP_NO => FOCAL_PT_OUT_TEMP,
			  Tx_CONTROL_STATIC => STATIC_CONFIG_OUT_TEMP,
           Tx_CONTROL_DYNAMIC => DYNAMIC_CONFIG_OUT_TEMP,
			  enable_done2	 => en_done,
			  TRIG_BEAM 		=> DYANAMIC_SIG_TEMP,
			  TRIG_FP	 		=> FOCUL_POINT_IN
			 );
					

End Behavioral;

