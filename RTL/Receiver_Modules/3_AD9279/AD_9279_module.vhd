----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:59 05/20/2013 
-- Design Name: 
-- ModuCSB Name:    AD_moduCSB - AD_Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - FiCSB Created
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

entity AD_module is
			Port ( 
					  AD_GLOBAL_CLK 		: IN  STD_LOGIC;
					  AD_MOD_RST 			: IN  STD_LOGIC;
					  
					  AD_SDIO		 		: INOUT  STD_LOGIC;
					  AD_CSB					: OUT STD_LOGIC;
					  AD_CLK_25Mhz			: OUT STD_LOGIC;
					  AD_prog_done			: out STD_LOGIC;
					 -- AD_DYNAMIC_CONFIG 	: IN  STD_LOGIC;
					  enable_done4			: IN  STD_LOGIC;
					  data_readback		: out STD_LOGIC_VECTOR (7 downto 0)
					  
					);

end AD_module;

architecture AD_Behavioral of AD_module is

TYPE STATE_TYPE is (
                      IDLE_STATE,
							 DATA_LOADING_STATE,
							 CSB_STATE,
							 TRANSMITTING_STATE,
							 CSB_EN_STATE,
							 WAITING_STATE,
							 register_reading_state,
							 receiving_state,
							 read_wait_STATE
						  );
SIGNAL AD_IC_STATES  : STATE_TYPE;

SIGNAL CSB_signal					: STD_LOGIC := '1';
SIGNAL MY_25Mhz					: STD_LOGIC := '1';
SIGNAL FAL_EDGE_25Mhz			: STD_LOGIC := '0';
SIGNAL START_CLOCK_25Mhz		: STD_LOGIC := '0';
SIGNAL READ_FLAG					: STD_LOGIC := '0';

SIGNAL DYNAMIC_DELAYED_SIG		: STD_LOGIC := '0';
SIGNAL RISING_DYNAMIC_CONTROL	: STD_LOGIC := '0';
SIGNAL program_signal			: STD_LOGIC := '0'; 

SIGNAL MY_25Mhz_DELAY			: STD_LOGIC := '0';
SIGNAL SR							: STD_LOGIC_VECTOR (23 downto 0) := (others => '0');-- shift register for transmitting stage
SIGNAL SR_IN						: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');-- shift register for transmitting stage
SIGNAL SHIFT_COUNTER 			: STD_LOGIC_VECTOR(7 downto 0) :=(others => '0');-- COUNTER TO SHIFT CSBFT 32 BIT DATA FOR EACH IC
SIGNAL SELECT_COUNTER 			: STD_LOGIC_VECTOR (3 downto 0) := x"0";-- FOR SELECTION OF THE  CONFIGURTION IN ONE_TIME_STATIC_CONFIG_STATE
SIGNAL COUNTER_25Mhz				: STD_LOGIC_VECTOR(7 downto 0) :=(others => '0');-- COUNTER FOR GENERATING 5 MHZ
SIGNAL CSB_COUNTER				: STD_LOGIC_VECTOR(3 downto 0) :=(others => '0');
SIGNAL WAITING_COUNTER			: STD_LOGIC_VECTOR(31 downto 0) :=(others => '0');

signal init : std_logic;
signal cnt : std_logic_vector (7 downto 0);

CONSTANT DATA_FLEX_Vref			: STD_LOGIC_VECTOR (23 downto 0)  := x"001803" ; --FLEX_Vref internal ref
CONSTANT DATA_FLEX_Vref_2		: STD_LOGIC_VECTOR (23 downto 0)  := x"001843" ; --FLEX_Vref with external refe       ----nt req
CONSTANT MODE_full_Pwr_dwn		: STD_LOGIC_VECTOR (23 downto 0)  := x"000801" ; --Modes_1_full_Power_down            ----nt req
CONSTANT MODE_Reset				: STD_LOGIC_VECTOR (23 downto 0)  := x"000803" ; --Modes_1_reset                      ----nt req
CONSTANT MODE_Chiprun			: STD_LOGIC_VECTOR (23 downto 0)  := x"000800" ; --Modes_1_Chiprun                    ----nt req
CONSTANT DATA_1 					: STD_LOGIC_VECTOR (23 downto 0)  := x"00053F" ; --Device Index_1       ----053F
CONSTANT DATA_2 					: STD_LOGIC_VECTOR (23 downto 0)  := x"00040F" ; --Device Index_2       ----040F
CONSTANT DATA_3 					: STD_LOGIC_VECTOR (23 downto 0)  := x"00FF01" ; --device_update 
CONSTANT DATA_4 					: STD_LOGIC_VECTOR (23 downto 0)  := x"000210" ; --CHIP_GRADE
CONSTANT DATA_5 					: STD_LOGIC_VECTOR (23 downto 0)  := x"000800" ; --MODES
CONSTANT DATA_6 					: STD_LOGIC_VECTOR (23 downto 0)  := x"00110E" ; --FLEX_GAIN  change from 6  to 0   ---110E                 -----CHANGED FRM 1105
CONSTANT DATA_7 					: STD_LOGIC_VECTOR (23 downto 0)  := x"002C01" ; --ANALOG_INPUT (01 = RFB1||RFB2) --002C01                   ---CHANGED FRM 2C01
CONSTANT DATA_8 					: STD_LOGIC_VECTOR (23 downto 0)  := x"000D00" ; --TEST_IO +                       ---0D00
CONSTANT DATA_9 					: STD_LOGIC_VECTOR (23 downto 0)  := x"002D08" ; --CW Doppler I/Q demodulator phase
CONSTANT DATA_10 					: STD_LOGIC_VECTOR (23 downto 0)  := x"002B47" ; --FLEX_FILTER (0111 = fLP/3.16)
CONSTANT DATA_11 					: STD_LOGIC_VECTOR (23 downto 0)  := x"000FC0" ; --FLEX_CHANNEL_INPUT (1110 = 0.7 × 1/4.5 × fSAMPLE)
constant output_adjust        : STD_LOGIC_VECTOR (23 downto 0)  := x"001531" ; --OUTPUT ADJUST
CONSTANT DATA_usr_A 				: STD_LOGIC_VECTOR (23 downto 0)  := x"0019D5" ; -- USER DEFINED PATTERN REG 1 ---nt req
CONSTANT DATA_usr_B 				: STD_LOGIC_VECTOR (23 downto 0)  := x"001AB3" ; -- USER DEFINED PATTERN REG 2 ---nt req
CONSTANT Soft_Reset_ON			: STD_LOGIC_VECTOR (23 downto 0)  := x"00003C" ; --Soft_Reset_ON 
CONSTANT Soft_Reset_OFF			: STD_LOGIC_VECTOR (23 downto 0)  := x"000018" ; --Soft_Reset_OFF 

constant output_mode          : STD_LOGIC_VECTOR (23 downto 0)  := x"001401" ;--out_mode to offset binary

CONSTANT DATA_read_mode			: STD_LOGIC_VECTOR (23 downto 0)  := x"8008"&"ZZZZZZZZ" ; --device_update                          ----nt req
CONSTANT DATA_read_FLEX_Vref	: STD_LOGIC_VECTOR (23 downto 0)  := x"8018"&"ZZZZZZZZ" ; --DATA_read_FLEX_Vref                    ----nt req
CONSTANT DATA_read_chip_ID		: STD_LOGIC_VECTOR (23 downto 0)  := x"8001"&"ZZZZZZZZ" ; --DATA_read_device_chip ID reading       ----nt req
CONSTANT DATA_read_1				: STD_LOGIC_VECTOR (23 downto 0)  := x"8005"&"ZZZZZZZZ" ; --Device Index_1                     ----nt req
CONSTANT DATA_read_2				: STD_LOGIC_VECTOR (23 downto 0)  := x"80FF"&"ZZZZZZZZ" ; --device_update                      ----nt req
CONSTANT SHIFT_VALUE 			: STD_LOGIC_VECTOR (7 downto 0)   := x"18"; -- 24 COUNT                                            ----nt req
CONSTANT DATA_read_6				: STD_LOGIC_VECTOR (23 downto 0)  := x"8011"&"ZZZZZZZZ" ; --DATA_read_FLEX_GAIN                ----nt req
CONSTANT DATA_read_TEST_IO		: STD_LOGIC_VECTOR (23 downto 0)  := x"800D"&"ZZZZZZZZ" ; --DATA_read_TEST_IO                        ----nt req
CONSTANT DATA_read_usr_A		: STD_LOGIC_VECTOR (23 downto 0)  := x"8019"&"ZZZZZZZZ" ; -- PATTERN REG 1 READ                    ----nt req
CONSTANT DATA_read_usr_B		: STD_LOGIC_VECTOR (23 downto 0)  := x"801A"&"ZZZZZZZZ" ; -- PATTERN REG 2 READ                     ----nt req
CONSTANT Soft_Reset_read				: STD_LOGIC_VECTOR (23 downto 0)  := x"8000"&"ZZZZZZZZ" ;  --Soft_Reset_ON_read back        ----nt req
 --00
BEGIN

--		For Simulation -- 
--PROCESS(AD_GLOBAL_CLK)
--begin
--IF RISING_EDGE(AD_GLOBAL_CLK) THEN	
--		IF(READ_FLAG = '0' and FAL_EDGE_25Mhz = '1') THEN
--		   AD_SDIO	<= SR(23);
--			SR_IN <= SR(23) & SR_IN (23 downto 1); -- First LSB
--		ELSE
--			data_readback <= SR_IN;
--		END IF;
--	END IF;	
--END PROCESS;

-- For Board Testing --
PROCESS(AD_GLOBAL_CLK,AD_MOD_RST)
begin
 if (AD_MOD_RST = '1') then 
  --cnt <= (others => '0');
  SR_IN <= (others => '0');
 elsIF RISING_EDGE(AD_GLOBAL_CLK) THEN	
		if (FAL_EDGE_25Mhz = '1') then 
	 		IF(READ_FLAG = '1') THEN
			 --if (cnt <= x"03") then 
				SR_IN <=  AD_SDIO & SR_IN (7 downto 1); -- First MSB
				--cnt <= cnt + '1';
			  --end if;	
			end if;	
		ELSE
		   data_readback <= SR_IN;
			--AD_SDIO			<= SR(23);
		END IF;
	END IF;	
END PROCESS;

AD_SDIO <= SR(23) when READ_FLAG = '0' else 'Z';
AD_CSB			<= CSB_signal;
AD_CLK_25Mhz 	<= MY_25Mhz_DELAY;
AD_prog_done 	<= program_signal;

MULTIPCSBXER_STATE_MACHINE : PROCESS (AD_GLOBAL_CLK,AD_MOD_RST)

	BEGIN
     IF (AD_MOD_RST = '1') THEN
					CSB_signal <= '1';
					SHIFT_COUNTER <=(others => '0');
					START_CLOCK_25Mhz <= '0';
					READ_FLAG <= '0';
					SR <= (others => '0');
					init <= '0';
					AD_IC_STATES <= IDLE_STATE;

     ELSIF RISING_EDGE(AD_GLOBAL_CLK) THEN
				
	
				CASE AD_IC_STATES is
							
									WHEN IDLE_STATE =>
												CSB_signal <= '1';
												SHIFT_COUNTER <=(others => '0');
												START_CLOCK_25Mhz <= '0';
													
												IF (enable_done4 = '1') THEN -- AND RISING_DYNAMIC_CONTROL = '1'
													AD_IC_STATES  <= DATA_LOADING_STATE;
												ELSE
													AD_IC_STATES  <= IDLE_STATE;
												END IF;
													
													
									WHEN DATA_LOADING_STATE =>
									
											SHIFT_COUNTER <= SHIFT_VALUE; --24 COUNTS
											CSB_signal <= '0';
											
											case SELECT_COUNTER is
											  										
												when X"0" => SR <= Soft_Reset_ON;
												when X"1" => SR <= Soft_Reset_OFF;
												when X"2" => SR <= DATA_4;
												when X"3" => SR <= DATA_5;
												when X"4" => SR <= output_mode;
												when X"5" => SR <= output_adjust;
												when X"6" => SR <= DATA_6;
												when X"7" => SR <= DATA_7;
												when x"8" => SR <= DATA_8;
												when X"9" => SR <= DATA_11;
												when X"A" => SR <= DATA_10;
												when X"B" => SR <= DATA_1;
												when X"C" => SR <= DATA_2;
												when X"D" => SR <= DATA_3;
												when others => Null;
											end case;
												
											AD_IC_STATES   <= CSB_STATE;	


									WHEN CSB_STATE =>			
												
												START_CLOCK_25Mhz <= '1';
												AD_IC_STATES  <= TRANSMITTING_STATE;
																							
									WHEN TRANSMITTING_STATE =>
																				
											IF(SHIFT_COUNTER > x"0" ) THEN
																			
													IF(FAL_EDGE_25Mhz = '1') THEN
															SR <=  SR (22 downto 0) & '0';-- leFT SHIFT
															SHIFT_COUNTER <= SHIFT_COUNTER - '1';
													END IF;
											ELSE			
												AD_IC_STATES  <= CSB_EN_STATE;														
												START_CLOCK_25Mhz <= '0';
											END IF;
									
									 WHEN CSB_EN_STATE =>
													
												CSB_signal <= '1';
												AD_IC_STATES  <= WAITING_STATE;
--														CSB_COUNTER <= (others => '0');
--											END IF;
											
									WHEN WAITING_STATE =>
												
												IF(WAITING_COUNTER < x"00000C8") then --x"B9ACA00") and init = '0' then -- 5 sec wait-- x"77359400") THEN --counter for WAITING 10sec-- 
													WAITING_COUNTER <= WAITING_COUNTER + '1';
--												elsif (WAITING_COUNTER < x"00000C8") then --x"B9ACA00") and init = '1' then	
--													WAITING_COUNTER <= WAITING_COUNTER + '1';
												ELSE	
													WAITING_COUNTER <= 	x"00000000";
--													AD_IC_STATES  <= IDLE_STATE;
													SELECT_COUNTER <= SELECT_COUNTER + '1';
													init <= '0';	
													AD_IC_STATES  <= register_reading_state;
												END IF;			
												
									when register_reading_state =>
												
--												IF (SELECT_COUNTER < x"1") THEN
--												
--													IF (SELECT_COUNTER = x"0") THEN
--														SR <= DATA_read_chip_ID;	-- DATA_read_chip_id REGISTER address
--														SHIFT_COUNTER <= SHIFT_VALUE; --20 COUNTS load
--														CSB_signal <= '0';
--														START_CLOCK_25Mhz <= '1';
--														AD_IC_STATES  <= receiving_state;
--														
----													ELSIF	(SELECT_COUNTER = x"1") THEN	
----														SR <= DATA_read_FLEX_Vref;	-- DATA_read_FLEX_GAIN REGISTER address
----														SHIFT_COUNTER <= SHIFT_VALUE; --20 COUNTS load
----														CSB_signal <= '0';
----														START_CLOCK_25Mhz <= '1';
----														AD_IC_STATES  <= receiving_state;	
--														
----													IF (SELECT_COUNTER = x"0") THEN
----														SR <= DATA_read_1;	-- Device Index_1 REGISTER address
----														SHIFT_COUNTER <= SHIFT_VALUE; --20 COUNTS load
----														CSB_signal <= '0';
----														START_CLOCK_25Mhz <= '1';
----														AD_IC_STATES  <= receiving_state;
--														
													IF	(SELECT_COUNTER = x"E") THEN	
														SR <= Soft_Reset_read;
														SHIFT_COUNTER <= SHIFT_VALUE; --20 COUNTS load
														program_signal <= '1';
														CSB_signal <= '0';
														START_CLOCK_25Mhz <= '1';
														AD_IC_STATES  <= receiving_state;
														
--													ELSIF	(SELECT_COUNTER = x"9") THEN	
--														SR <= DATA_read_usr_A;	-- Device Index_1 REGISTER address
--														SHIFT_COUNTER <= SHIFT_VALUE; --20 COUNTS load
--														CSB_signal <= '0';
--														START_CLOCK_25Mhz <= '1';
--														AD_IC_STATES  <= receiving_state;
--
--													ELSIF	(SELECT_COUNTER = x"A") THEN	
--														SR <= DATA_read_usr_B;	-- Device Index_1 REGISTER address
--														SHIFT_COUNTER <= SHIFT_VALUE; --20 COUNTS load
--														CSB_signal <= '0';
--														START_CLOCK_25Mhz <= '1';
--														AD_IC_STATES  <= receiving_state;
	
												ELSE
													AD_IC_STATES  <= IDLE_STATE;
--													AD_IC_STATES  <= register_reading_state;
--													SELECT_COUNTER <= (others => '0');
--													SELECT_COUNTER <= SELECT_COUNTER + '1';
												END IF;
--
									when receiving_state =>
							
												IF(SHIFT_COUNTER > x"0" ) THEN
														IF(SHIFT_COUNTER > x"8" ) THEN 
															IF(FAL_EDGE_25Mhz = '1') THEN
																	--SR <= SR sla 1;
																	SR <=  SR (22 downto 0) & '0';-- leFT SHIFT
																	SHIFT_COUNTER <= SHIFT_COUNTER - '1';
															END IF;
														ELSE
															READ_FLAG <= '1';
															IF(FAL_EDGE_25Mhz = '1') THEN
																	--SR <= SR sla 1;
																	--SR <=  SR (22 downto 0) & '0';-- leFT SHIFT
																	SHIFT_COUNTER <= SHIFT_COUNTER - '1';
															END IF;
														END IF;
												ELSE			
--														AD_IC_STATES  <= IDLE_STATE;
														READ_FLAG <= '0';
														AD_IC_STATES  <= read_wait_STATE;
--													IF	(SELECT_COUNTER = x"A") THEN	
--														SELECT_COUNTER <= x"8"; 
--													else
-- 													   SELECT_COUNTER <= SELECT_COUNTER + '1';												
--													end if;
														START_CLOCK_25Mhz <= '0';
												END IF;
									
									WHEN read_wait_STATE =>
												
												CSB_signal <= '1';
												IF(WAITING_COUNTER < x"00000C8") then--x"B9ACA00") then -- 5 sec wait--x"77359400") THEN --counter for WAITING 10sec--x"000000ff") then --  
													WAITING_COUNTER <= WAITING_COUNTER + '1';
												ELSE	
													WAITING_COUNTER <= 	x"00000000";
													AD_IC_STATES <= read_wait_STATE;
													--AD_IC_STATES  <= IDLE_STATE;
													--SELECT_COUNTER <= SELECT_COUNTER + '1';
													--AD_IC_STATES  <= register_reading_state;
												END IF;
													
									WHEN OTHERS => AD_IC_STATES <= IDLE_STATE;									
									
								END CASE;
						END IF;					
						
	END PROCESS	MULTIPCSBXER_STATE_MACHINE;							

	
	PROCESS (AD_GLOBAL_CLK,AD_MOD_RST)
		BEGIN
		IF (AD_MOD_RST = '1') THEN
					MY_25Mhz <= '1';
					COUNTER_25Mhz <=(others => '0');
					MY_25Mhz_DELAY <= '0';
		ELSIF RISING_EDGE(AD_GLOBAL_CLK) then
						
								if (START_CLOCK_25Mhz = '1') then
									IF (COUNTER_25Mhz > x"8") THEN	--1mhz				-- 5 n sec => 1 count cycCSB  
										MY_25Mhz <= NOT MY_25Mhz;							-- 200 n sec(5 Mhz) => "X" count cycCSB => 40		  
										COUNTER_25Mhz <=(others => '0');  			-- 50% Duty cycCSB = 20 counts => ("14") HEX.
																
									ELSE
										COUNTER_25Mhz <= COUNTER_25Mhz + '1';
									END IF;
								end if;								
								if (START_CLOCK_25Mhz = '1') then
									MY_25Mhz_DELAY <= MY_25Mhz;
								else
									MY_25Mhz_DELAY <= '0';
								end if;								
						FAL_EDGE_25Mhz <= MY_25Mhz_DELAY AND NOT MY_25Mhz;
				END IF;	
	END PROCESS;

--	PROCESS(AD_GLOBAL_CLK)
--		begin
--         IF RISING_EDGE(AD_GLOBAL_CLK) then
--					IF (AD_MOD_RST = '1') THEN
--							DYNAMIC_DELAYED_SIG <= '0';
--							
--						ELSE
--			
--							DYNAMIC_DELAYED_SIG <= AD_DYNAMIC_CONFIG;
--					END IF;
--			END IF;
--    END PROCESS;
--	 
--    RISING_DYNAMIC_CONTROL <= (not DYNAMIC_DELAYED_SIG) and AD_DYNAMIC_CONFIG; 

end AD_Behavioral;

