----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:34 07/10/2013 
-- Design Name: 
-- Module Name:    DAC_Module - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DAC_Module is
			Port ( 
						 DAC_GLOBAL_CLK 		: IN  STD_LOGIC;
						 DAC_MOD_RST 			: IN  STD_LOGIC;
						 DAC_CLOCK_122_88		: IN  STD_LOGIC;
						 DAC_data_present		: out  STD_LOGIC;-- used for trigerring after 330us to fg on 21_11_13
						 DAC_Data				: OUT STD_LOGIC_VECTOR(11 downto 0);	--Output for writing configurations. 
						 DAC_WRT_A				: OUT STD_LOGIC; 		
						 DAC_enable_done5		: IN  STD_LOGIC
					);
end DAC_Module;

architecture Behav_DAC of DAC_Module is

TYPE state_type is (
                      IDLE_STATE,
							 DEAD_ZONE_STATE, 
                      INCREMENT_DAC_DATA_STATE,
							 WRT_A_LATCH_STATE,
							 WAITING_STATE
                    );
SIGNAL DAC_states  : state_type;

TYPE state is (
                s1,
					 s2
               );
SIGNAL ext_clk_state  : state;

SIGNAL DAC_Data_sig		:  STD_LOGIC_VECTOR (11 downto 0):= (OTHERS =>'0');
SIGNAL DAC_counter_1		:  STD_LOGIC_VECTOR (7 downto 0):= (OTHERS =>'0');
SIGNAL DAC_counter_2		:  STD_LOGIC_VECTOR (1 downto 0):= (OTHERS =>'0');
SIGNAL counter_330us		:  STD_LOGIC_VECTOR (17 downto 0):= (OTHERS =>'0');
SIGNAL RIS_CLOCK_122_88		:	STD_LOGIC:= '0';
SIGNAL delay_CLOCK_122_88	:	STD_LOGIC:= '0';
--SIGNAL RISING_data_present	:	STD_LOGIC:= '0';
--SIGNAL delayed_data_present:	STD_LOGIC:= '0';
--SIGNAL delayed_data_present1:	STD_LOGIC:= '0';
SIGNAL SIG_WRT_A				:	STD_LOGIC:= '0';
SIGNAL OUT_WRT_A				:	STD_LOGIC:= '0';


begin

DAC_Data  <= x"FFF";-- DAC_Data_sig;--
DAC_WRT_A <= OUT_WRT_A;

PROCESS (DAC_GLOBAL_CLK)

BEGIN

      IF RISING_EDGE(DAC_GLOBAL_CLK) then
				IF (DAC_MOD_RST = '1') THEN
				
					DAC_counter_1 <= (OTHERS =>'0');
					DAC_Data_sig <= (others => '0');
					DAC_states  <= IDLE_STATE;

					
				ELSE
					CASE DAC_states is
					 
                    WHEN IDLE_STATE =>
									
									
												DAC_counter_1 <= (OTHERS =>'0');
												DAC_counter_2 <= (OTHERS =>'0');
--												DAC_Data_sig <= (others => '0');--x"000";--
												IF (DAC_enable_done5 = '1') THEN
													DAC_states  <= DEAD_ZONE_STATE;
												ELSE
													DAC_states  <= IDLE_STATE;
												END IF;

                    WHEN DEAD_ZONE_STATE =>
											
											
												IF(DAC_counter_1 < x"29" ) THEN -- wait for 200 ns dead zone
													DAC_counter_1 <= DAC_counter_1 + '1';
												ELSE
													DAC_states  <= WRT_A_LATCH_STATE;
													DAC_counter_1 <=(others => '0');
												END IF;
												  
													
							WHEN INCREMENT_DAC_DATA_STATE =>
												
												IF(counter_330us < "00" & x"0078") then
														DAC_data_present <= '1';
														DAC_states   <= INCREMENT_DAC_DATA_STATE;
														DAC_Data_sig <= x"C1C";--(others => '0');
												else
														DAC_data_present <= '0';
														IF ( DAC_Data_sig < x"FFE" ) then -- or DAC_Data_sig = x"fff")
															DAC_states   <= WRT_A_LATCH_STATE;
														else
															DAC_states   <= INCREMENT_DAC_DATA_STATE;
														END IF;														
												END IF;
												
												
													

							WHEN WRT_A_LATCH_STATE =>	
										
												IF(DAC_counter_1 < x"02" ) THEN
														SIG_WRT_A <= '1';
														DAC_counter_1 <= DAC_counter_1 + '1';
														DAC_states  <= WRT_A_LATCH_STATE;
												ELSE
														DAC_states  <= WAITING_STATE;
														DAC_counter_1 <= (others => '0');
														SIG_WRT_A <= '0';
												END IF;
												
							WHEN WAITING_STATE =>
											
											
												IF(DAC_counter_1 < x"18" ) THEN 
													DAC_counter_1 <= DAC_counter_1 + '1';
												ELSE
													DAC_states  <= INCREMENT_DAC_DATA_STATE;
													DAC_counter_1 <= (others => '0');
													DAC_Data_sig <= DAC_Data_sig + x"01";
												
--													DAC_counter_2 <= DAC_counter_2 + '1';
												END IF;					
																				
								
							WHEN OTHERS => DAC_states  <= IDLE_STATE;
														
					END CASE;
				END IF;
      END IF;
END PROCESS;


PROCESS(DAC_GLOBAL_CLK)
		begin
         IF RISING_EDGE(DAC_GLOBAL_CLK) then
					IF (DAC_MOD_RST = '1') THEN
						counter_330us <= (others => '0');
					else
						if(counter_330us = "10" & x"03a0") then-- 330us sec count
							counter_330us <= (others => '0');
						else
							counter_330us <= counter_330us + '1';
						end if;
					end if;
			end if;
end process;			


PROCESS(DAC_GLOBAL_CLK)
		begin
         IF RISING_EDGE(DAC_GLOBAL_CLK) then
					IF (DAC_MOD_RST = '1') THEN
							delay_CLOCK_122_88 <= '0';
--							RIS_CLOCK_122_88 <= '0';
						ELSE
			
							delay_CLOCK_122_88 <= DAC_CLOCK_122_88;
					END IF;
			END IF;

END PROCESS;

			
	 
	PROCESS(DAC_GLOBAL_CLK)
		begin
         IF RISING_EDGE(DAC_GLOBAL_CLK) then
					IF (DAC_MOD_RST = '1') THEN
							OUT_WRT_A <= '0';
					ELSE
					
						IF (DAC_CLOCK_122_88 = '1' and (not delay_CLOCK_122_88 = '1') )then--RIS_CLOCK_122_88 = '1') then

							CASE ext_clk_state is
					 
								WHEN s1 =>
											
										IF (SIG_WRT_A = '1') THEN
											ext_clk_state <= s2;
											OUT_WRT_A <= '1';
										ELSE
											OUT_WRT_A <= '0';
											ext_clk_state <= s1;
										end if;		
												
								WHEN s2 =>
										OUT_WRT_A <= '1';
										ext_clk_state <= s1;
							
							WHEN others => ext_clk_state <= s1;
							end case;	
						END IF;
					END IF;
				END IF;
  END PROCESS;

 
end Behav_DAC;


