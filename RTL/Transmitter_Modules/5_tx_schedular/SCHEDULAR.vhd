----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:37 03/13/2013 
-- Design Name: 
-- Module Name:    SCHEDULAR - SCHEDULAR_BEHAV 
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

ENTITY SCHEDULAR IS
    Port ( 
			  SC_GLOBAL_CLK 		: IN STD_LOGIC;
			  RESET_IN 				: IN  STD_LOGIC;
			  TEST_BEAM_NO 		: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			  TEST_FP_NO 			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			  Tx_CONTROL_STATIC 	: OUT STD_LOGIC;
           Tx_CONTROL_DYNAMIC : OUT STD_LOGIC;
			  enable_done2			: IN STD_LOGIC
			 -- TRIG_BEAM 			: IN STD_LOGIC;
			  --TRIG_FP				: IN STD_LOGIC
			 );
END SCHEDULAR;

ARCHITECTURE SCHEDULAR_BEHAV OF SCHEDULAR IS

SIGNAL BEAM_INTERVAL_COUNTER 	: STD_LOGIC_VECTOR(16 DOWNTO 0):= "0" & x"0000"; --330us FREE RUNNING COUNTER
SIGNAL STATIC_COUNTER 			: STD_LOGIC_VECTOR(1 DOWNTO 0):= "00";
SIGNAL DYNAMIC_COUNTER 			: STD_LOGIC_VECTOR(1 DOWNTO 0):= "00";
SIGNAL STATIC_CONFIG 			: STD_LOGIC;
SIGNAL DYNAMIC_CONFIG 			: STD_LOGIC;
SIGNAL BEAM_NO 					:STD_LOGIC_VECTOR(6 DOWNTO 0):= "000" &x"0";
SIGNAL FP_NO 						:STD_LOGIC_VECTOR(7 DOWNTO 0):= x"00";


SIGNAL RISING_TRIG_FP 			: STD_LOGIC:= '0';
SIGNAL TRIG_FP_DELAY 			: STD_LOGIC:= '0';
SIGNAL TRIG_FP_DELAY1 			: STD_LOGIC:= '0';


SIGNAL FLAG 						: STD_LOGIC := '0';
SIGNAL TRIG_BEAM_DELAY 			: STD_LOGIC := '0';
SIGNAL RISING_TRIG_BEAM 		: STD_LOGIC := '0';
--SIGNAL sync 				: STD_LOGIC ;
--SIGNAL detect : std_ulogic_vector (1 downto 0);

TYPE STATE_TYPE IS (
                      IDLE_STATE, 
							STATIC_CONFIG_STATE,
							DYNAMIC_CONFIG_STATE
					    );
SIGNAL SCHEDULAR_STATE : STATE_TYPE;

BEGIN

Tx_CONTROL_STATIC <= STATIC_CONFIG;
Tx_CONTROL_DYNAMIC <= DYNAMIC_CONFIG;

TEST_BEAM_NO <= BEAM_NO;
--TEST_FP_NO <= FP_NO;

PROCESS (SC_GLOBAL_CLK)
BEGIN
    IF RISING_EDGE(SC_GLOBAL_CLK) then
			IF (RESET_IN = '1') THEN

					BEAM_INTERVAL_COUNTER <= "0" & x"0000"; --330us FREE RUNNING COUNTER
					BEAM_NO <= "000" &x"1";
					FP_NO <= x"00";
					STATIC_CONFIG <= '0';
					DYNAMIC_CONFIG <= '0';
					FLAG <= '0';
					SCHEDULAR_STATE <= IDLE_STATE;
					
			ELSE
						CASE SCHEDULAR_STATE is

									WHEN IDLE_STATE =>
									
											
											BEAM_INTERVAL_COUNTER <= "0" & x"0000"; --330us FREE RUNNING COUNTER--											BEAM_NO <= "000" &x"0";
											STATIC_CONFIG <= '0';
											DYNAMIC_CONFIG <= '0';
											STATIC_COUNTER <= "00";
											SCHEDULAR_STATE <= STATIC_CONFIG_STATE;
											
										
									WHEN STATIC_CONFIG_STATE =>
																				
											IF (FLAG = '0' AND enable_done2 = '1') THEN-- generation of the static configuration TRIG_BEAM											
													IF(STATIC_COUNTER < "11") THEN
															IF(STATIC_COUNTER = "01") THEN
																STATIC_CONFIG <= '1';
															ELSE
																STATIC_CONFIG <= '0';
															END IF;	
																STATIC_COUNTER <= STATIC_COUNTER + '1';
--                                        STATIC_CONFIG <= '1';
													ELSE
														STATIC_CONFIG <= '0';
--														FLAG <= '1';
														SCHEDULAR_STATE <= DYNAMIC_CONFIG_STATE;
													END IF;
											ELSE
												SCHEDULAR_STATE <= STATIC_CONFIG_STATE;
											END IF;	
									
																				
																	
									WHEN DYNAMIC_CONFIG_STATE =>
											
											
											IF (enable_done2 = '1' ) then --AND RISING_TRIG_BEAM = '1') then --enable_done added on 13-6-13 
																						
													IF(BEAM_NO < 121) THEN -- changed
															
															BEAM_NO <= BEAM_NO +'1';
															DYNAMIC_CONFIG <= '1';
													ELSE				
															BEAM_NO <= "000" &x"1";-- CHANGED FORM 0 TO 1 FIXED AT 25/4/13 -SFA
															FP_NO <= FP_NO + '1';
													END IF;
											
											ELSE		
												SCHEDULAR_STATE <= DYNAMIC_CONFIG_STATE;
												DYNAMIC_CONFIG <= '0';
											END IF;
											
--											IF (enable_done2 = '1' )--AND TRIG_FP = '1' and TRIG_FP_DELAY = '0') then --rising edge
													IF(FP_NO > 9) THEN 
														FP_NO <= (OTHERS => '0');
--														
--													ELSE
--														FP_NO <= FP_NO + '1';
													END IF;		
--											END IF;		
							END CASE	;
					END IF;
				END IF;
		END PROCESS;
		
		
--	process(SC_GLOBAL_CLK)
--    begin
--         IF RISING_EDGE(SC_GLOBAL_CLK) then
--				IF (RESET_IN = '1') THEN
--					TRIG_BEAM_DELAY <= '0';
--
--				ELSE
--					TRIG_BEAM_DELAY <= TRIG_BEAM;
--					
--					END IF;
--				END IF;
--    end process;
--    RISING_TRIG_BEAM <= (not TRIG_BEAM_DELAY) and TRIG_BEAM; 

						
--	process(SC_GLOBAL_CLK)
--    begin
--         IF RISING_EDGE(SC_GLOBAL_CLK) then
----				IF (RESET_IN = '1') THEN
----					TRIG_FP_DELAY <= '0';	
----						
----				ELSE
--					TRIG_FP_DELAY <= TRIG_FP;
--					END IF;
----				END IF;
--    end process;
--    RISING_TRIG_FP <= (not TRIG_FP_DELAY) and TRIG_FP; 



END SCHEDULAR_BEHAV;