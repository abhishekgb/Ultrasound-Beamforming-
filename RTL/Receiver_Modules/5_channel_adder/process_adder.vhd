----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:14 07/15/2013 
-- Design Name: 
-- Module Name:    process_adder - Behav_process_adder 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity process_adder is
            generic(
	              INPUT_BIT_WIDTH_ADDER         : integer     := 32;
	              OUTPUT_BIT_WIDTH_ADDER        : integer     := 16
		        );
				 Port ( 
							ADD_GLOBAL_CLK 	 	: IN  STD_LOGIC;
							ADD_mod_RST	 			: IN  STD_LOGIC;
							ADD_present3	 		: IN  STD_LOGIC;
							
							ADD_IN_CH1   			: IN  STD_LOGIC_VECTOR(INPUT_BIT_WIDTH_ADDER -1 downto 0);
							ADD_IN_CH2   			: IN  STD_LOGIC_VECTOR(INPUT_BIT_WIDTH_ADDER -1 downto 0);
							ADD_IN_CH3   			: IN  STD_LOGIC_VECTOR(INPUT_BIT_WIDTH_ADDER -1 downto 0);
							ADD_IN_CH4   			: IN  STD_LOGIC_VECTOR(INPUT_BIT_WIDTH_ADDER -1 downto 0);
							ADD_IN_CH5   			: IN  STD_LOGIC_VECTOR(INPUT_BIT_WIDTH_ADDER -1 downto 0);
							ADD_IN_CH6   			: IN  STD_LOGIC_VECTOR(INPUT_BIT_WIDTH_ADDER -1 downto 0);
							ADD_IN_CH7   			: IN  STD_LOGIC_VECTOR(INPUT_BIT_WIDTH_ADDER -1 downto 0);
							ADD_IN_CH8   			: IN  STD_LOGIC_VECTOR(INPUT_BIT_WIDTH_ADDER -1 downto 0);
							adder_data_tick		    : OUT STD_LOGIC;
							ADD_FINAL_OUT	 		: OUT STD_LOGIC_VECTOR(OUTPUT_BIT_WIDTH_ADDER - 1 downto 0)
		
						);
end process_adder;

architecture Behav_process_adder of process_adder is

--TYPE state_type is (
--						IDLE_STATE, 
--                      ADDER_STATE					 
--                    );
--SIGNAL Process_adder_states  : state_type;

--signal out_final_reg 		: STD_LOGIC_VECTOR(19 downto 0) := (others=> '0');

--signal delayed_present3		: STD_LOGIC := '0';
--signal RISING_Present3		: STD_LOGIC := '0';

component channel_adder is
	port
		(clk,rst,ce : in std_logic;
		 din1,din2,din3,din4,din5,din6,din7,din8 : in std_logic_vector (15 downto 0);
		 dout : out std_logic_vector (15 downto 0);
		 data_valid : out std_logic
		 );
end component;

begin

i1 : channel_adder
	port map
		(
			clk => ADD_GLOBAL_CLK,
			rst => ADD_mod_RST,
			ce => ADD_present3,
			din1 => ADD_IN_CH1,
			din2 => ADD_IN_CH2,
			din3 => ADD_IN_CH3,
			din4 => ADD_IN_CH4,
			din5 => ADD_IN_CH5,
			din6 => ADD_IN_CH6,
			din7 => ADD_IN_CH7,
			din8 => ADD_IN_CH8,
			data_valid => adder_data_tick,
			dout => ADD_FINAL_OUT
		);

--ADD_FINAL_OUT <= out_final_reg(19 downto 4);
--
--PROCESS (ADD_GLOBAL_CLK)
--
--BEGIN
--
--      IF RISING_EDGE(ADD_GLOBAL_CLK) then
--				IF (ADD_mod_RST = '1') THEN
--					out_final_reg <= (others=> '0');--x"00000";
--					adder_data_tick <= '0';
--					Process_adder_states  <= IDLE_STATE;
--
--					
--				ELSE
--					CASE Process_adder_states is
--					 
--							WHEN IDLE_STATE =>
--									
--									adder_data_tick <= '0';
--									IF (RISING_Present3 = '1') THEN
--										Process_adder_states  <= ADDER_STATE;
--									ELSE
--										Process_adder_states  <= IDLE_STATE;
--									END IF;
--
--							WHEN ADDER_STATE =>
--									
--									out_final_reg <= 	((ADD_IN_CH1 + ADD_IN_CH2) + (ADD_IN_CH3 + ADD_IN_CH4) +
--															(ADD_IN_CH5 + ADD_IN_CH6) + (ADD_IN_CH7 + ADD_IN_CH8)) ;
--									adder_data_tick <= '1';
--									Process_adder_states  <= IDLE_STATE;
--							WHEN OTHERS =>			  
--												Process_adder_states  <= IDLE_STATE;										
--					END CASE;
--				END IF;
--      END IF;
--END PROCESS;
--
--
--PROCESS(ADD_GLOBAL_CLK)
--		begin
--         IF RISING_EDGE(ADD_GLOBAL_CLK) then
--					IF (ADD_mod_RST = '1') THEN
--							delayed_present3 <= '0';
--							
--						ELSE
--			
--							delayed_present3 <= ADD_present3;
--					END IF;
--			END IF;
--		
--END PROCESS;
--
--RISING_Present3 <= (not delayed_present3) and ADD_present3; 	 


	

end Behav_process_adder;

