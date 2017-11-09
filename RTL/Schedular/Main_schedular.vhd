----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:37 03/13/2013 
-- Design Name: 
-- Module Name:    Main_Schedular - Main_Schedular_BEHAV 
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

ENTITY Main_Schedular IS
    Port ( 
			  SC_GLOBAL_CLK 		: IN STD_LOGIC;
			  RESET_IN 				: IN  STD_LOGIC;
			  sc_usb_start			: IN  STD_LOGIC;
			  TEST_BEAM_NO 		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--			  TEST_FP_NO 			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			  Tx_CONTROL_STATIC 	: OUT STD_LOGIC;
           Tx_CONTROL_DYNAMIC : OUT STD_LOGIC;
			  enable_done2			: IN STD_LOGIC;
			  SC_ADC_FCO			: IN STD_LOGIC;
			  SC_HF_SIG				: OUT STD_LOGIC;
--			  TRIG_BEAM 			: IN STD_LOGIC
--			  TRIG_FP				: IN STD_LOGIC
	---from tx side
			  SC_tx_enable       : in std_logic
			 );
END Main_Schedular;

ARCHITECTURE Main_Schedular_BEHAV OF Main_Schedular IS

SIGNAL BEAM_INTERVAL_COUNTER 	: STD_LOGIC_VECTOR(31 DOWNTO 0):= (others => '0');--"0" & x"0000"; --330us FREE RUNNING COUNTER
SIGNAL STATIC_COUNTER 			: STD_LOGIC_VECTOR(1 DOWNTO 0):= "00";
SIGNAL DYNAMIC_COUNTER 			: STD_LOGIC_VECTOR(1 DOWNTO 0):= "00";
SIGNAL STATIC_CONFIG 			: STD_LOGIC;
SIGNAL DYNAMIC_CONFIG 			: STD_LOGIC;
SIGNAL DYNAMIC_CONFIG_d			: STD_LOGIC;
SIGNAL DYNAMIC_CONFIG_d1		: STD_LOGIC;
SIGNAL BEAM_NO 					:STD_LOGIC_VECTOR(7 DOWNTO 0):= x"00";
SIGNAL two_min_count				:STD_LOGIC_VECTOR(7 DOWNTO 0):= (others => '0');

--SIGNAL FP_NO 						:STD_LOGIC_VECTOR(7 DOWNTO 0):= x"00";

--
--SIGNAL RISING_TRIG_FP 			: STD_LOGIC:= '0';
--SIGNAL TRIG_FP_DELAY 			: STD_LOGIC:= '0';
--SIGNAL TRIG_FP_DELAY1 			: STD_LOGIC:= '0';


SIGNAL FLAG 						: STD_LOGIC := '0';
--SIGNAL TRIG_BEAM_DELAY 			: STD_LOGIC := '0';
--SIGNAL RISING_TRIG_BEAM 		: STD_LOGIC := '0';
--SIGNAL sync 				: STD_LOGIC ;
--SIGNAL detect : std_ulogic_vector (1 downto 0);

TYPE STATE_TYPE IS (
                      IDLE_STATE, 
							STATIC_CONFIG_STATE,
							DYNAMIC_CONFIG_STATE
					    );
SIGNAL Main_Schedular_STATE : STATE_TYPE;



--------header footer scheduler-----------
--signal sig_tx_enable                	: std_logic;
signal del_sig_tx_enable 					: std_logic:= '0';
signal TX_enable_sig1 						: std_logic:= '0';
signal aqcuire_sig 							: std_logic:= '0';
signal stop_acq 								: std_logic:= '0';
signal aqcuire_cnt 							: std_logic_vector(15 downto 0):= (others => '0');
signal dead_cnt 								: std_logic_vector( 15 downto 0):= (others => '0');	
signal sig_hf_wr_en 							: std_logic:= '0';	
constant aqcuire_time 						:	std_logic_vector(15 downto 0):= x"1E58";--7764 samples
constant dead_time 							:	std_logic_vector(15 downto 0):= x"002F";--765 ns



BEGIN

Tx_CONTROL_STATIC <= STATIC_CONFIG;
Tx_CONTROL_DYNAMIC <= DYNAMIC_CONFIG or DYNAMIC_CONFIG_d or DYNAMIC_CONFIG_d1;

TEST_BEAM_NO <= BEAM_NO;
--TEST_FP_NO <= FP_NO;

-----------------------------------------------------------------------------------------
--Transmiter section timings
-----------------------------------------------------------------------------------------

PROCESS (SC_GLOBAL_CLK)
BEGIN
    IF RISING_EDGE(SC_GLOBAL_CLK) then
			IF (RESET_IN = '1') THEN

					BEAM_INTERVAL_COUNTER <= (others => '0');--"0" & x"0000"; --330us FREE RUNNING COUNTER
					BEAM_NO <= x"01";
--					FP_NO <= x"00";
					STATIC_CONFIG <= '0';
					DYNAMIC_CONFIG <= '0';
					FLAG <= '0';
					two_min_count <= (others => '0');
					Main_Schedular_STATE <= IDLE_STATE;
					
			ELSE
						CASE Main_Schedular_STATE is

									WHEN IDLE_STATE =>
									
											
											BEAM_INTERVAL_COUNTER <= (others => '0');--"0" & x"0000"; --330us FREE RUNNING COUNTER--											BEAM_NO <= "000" &x"0";
											STATIC_CONFIG <= '0';
											DYNAMIC_CONFIG <= '0';
											STATIC_COUNTER <= "00";
											Main_Schedular_STATE <= STATIC_CONFIG_STATE;
											
										
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
														FLAG <= '1';
														DYNAMIC_CONFIG <= '1';
														Main_Schedular_STATE <= DYNAMIC_CONFIG_STATE;
													END IF;
											ELSE
												Main_Schedular_STATE <= STATIC_CONFIG_STATE;
											END IF;	
									
																				
																	
									WHEN DYNAMIC_CONFIG_STATE =>
											
										--if(two_min_count = x"3D" )then --3D
											--two_min_count <= (others => '0');
										--	DYNAMIC_CONFIG <= '1';
											
										--else
										if(sc_usb_start = '1') then
											IF (BEAM_INTERVAL_COUNTER = x"0019389D")then --000101D0  "1" & x"01D0") then --330us 17D78400
												BEAM_INTERVAL_COUNTER <= (others => '0');
												two_min_count <= two_min_count + '1';
												DYNAMIC_CONFIG <= '1';
												IF(BEAM_NO < 121) THEN -- changed
													BEAM_NO <= BEAM_NO +'1';
												ELSE				
													BEAM_NO <= x"01";-- CHANGED FORM 0 TO 1 FIXED AT 25/4/13 -SFA
												END IF;
											
											ELSE		
												BEAM_INTERVAL_COUNTER <= BEAM_INTERVAL_COUNTER + '1';
												Main_Schedular_STATE <= DYNAMIC_CONFIG_STATE;
												DYNAMIC_CONFIG <= '0';
											END IF;
										else
											BEAM_NO <= x"01";
											DYNAMIC_CONFIG <= '0';
											Main_Schedular_STATE <= DYNAMIC_CONFIG_STATE;
										end if;	
										
--									WHEN DYNAMIC_CONFIG_STATE =>
--											
--											IF (BEAM_INTERVAL_COUNTER = "1" & x"01D0") then --330us 
--												BEAM_INTERVAL_COUNTER <= (others => '0');
--												DYNAMIC_CONFIG <= '1';
--												IF(BEAM_NO < 121) THEN -- changed
--															
--															BEAM_NO <= BEAM_NO +'1';
--															
--												ELSE				--															BEAM_NO <= x"01";-- CHANGED FORM 0 TO 1 FIXED AT 25/4/13 -SFA
--												END IF;
--											
--											ELSE		
--												BEAM_INTERVAL_COUNTER <= BEAM_INTERVAL_COUNTER + '1';
--												Master_Schedular_STATE <= DYNAMIC_CONFIG_STATE;
--												DYNAMIC_CONFIG <= '0';
--											END IF;	
							END CASE	;
					END IF;
				END IF;
		END PROCESS;
		
		
	process(SC_GLOBAL_CLK)
    begin
         IF RISING_EDGE(SC_GLOBAL_CLK) then
				IF (RESET_IN = '1') THEN
					DYNAMIC_CONFIG_d <= '0';
					DYNAMIC_CONFIG_d1 <= '0';

				ELSE
					DYNAMIC_CONFIG_d <= DYNAMIC_CONFIG;
					DYNAMIC_CONFIG_d1 <= DYNAMIC_CONFIG_d;
					
					END IF;
				END IF;
    end process;
--
--process(SC_ADC_FCO)
--begin
--	IF( rising_edge(ADC_FCO)) THEN
--		if (g_reset = '1' )then
--			   HF_count <= (others => '0');
--				Sig_HF <= '0';
--		else
--
--				if(HF_count < x"1E58" ) then--7764 samples
--					HF_count <= HF_count + '1';
--					if(HF_count = x"1E54" ) then
--						Sig_HF <= '1';
--					end if;	
--				else
--					Sig_HF <= '0';
--				end if;
--			END IF;	
--		END IF;
--END PROCESS;




-----------------------------------------------------------------------------------------
--receiver section timings
-----------------------------------------------------------------------------------------

--for counting nos of samples

process (SC_ADC_FCO,RESET_IN)
begin
	if (RESET_IN = '1' )then
		aqcuire_cnt <= (others => '0');
		stop_acq <= '0';
	else
		IF( rising_edge(SC_ADC_FCO)) THEN
			if(TX_enable_sig1 = '1') then
				stop_acq <= '0';
				aqcuire_cnt <= (others => '0');
			end if; 
			
			if(aqcuire_sig = '1') then
				--aqcuire_cnt < = (others => '0');
				if(aqcuire_cnt < aqcuire_time )then
             	aqcuire_cnt <= aqcuire_cnt + '1';		
               stop_acq <= '0';
				elsif(aqcuire_cnt = aqcuire_time) then
						stop_acq <= '1';
				end if;
			end if;
	end if;
end if;	
end process;
--
--SC_ADC_FCO	SC_HF_SIG

-- detection of Tx enable rising edge
process(SC_ADC_FCO,RESET_IN)
  begin
  		if (RESET_IN = '1' )then
			del_sig_tx_enable <= '0';				
		elsIF( rising_edge(SC_ADC_FCO)) THEN
			del_sig_tx_enable <= SC_tx_enable;
		end if;
	end process;	
	
TX_enable_sig1 <= del_sig_tx_enable and SC_tx_enable;

-- dead zone time calculations process
process (SC_ADC_FCO,RESET_IN)
begin
	if (RESET_IN = '1' )then
		dead_cnt <= dead_time + '1';
	else
		IF( rising_edge(SC_ADC_FCO)) THEN
			if(TX_enable_sig1 = '1') then
--				dead_time_sig <= '1';
				dead_cnt <= (others => '0');
			elsif(dead_cnt < dead_time ) then
					dead_cnt <= dead_cnt + '1';
					aqcuire_sig <= '0';
				
	      elsif(dead_cnt = dead_time) then 
				if(stop_acq = '1') then
						aqcuire_sig <= '0';
				else
					aqcuire_sig <= '1';
				end if;
        end if;
		end if;	
	end if;
end process;				
				
SC_HF_SIG <= aqcuire_sig;
				
END Main_Schedular_BEHAV;