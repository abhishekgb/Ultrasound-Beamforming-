----------------------------------------------------------------------------------
-- Engineer: 			Abhishek Gubbi Basavaraj/Sayed Faizan Aliakbar
-- 
-- Create Date:    	19:58:54 02/27/2013 
-- Design Name: 
-- Module Name:    	IC_Beamformer - Behavioral 
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
use IEEE.std_logic_unsigned.all;

entity IC_Beamformer is
    Port (
				TX_GLOBAL_CLK	: IN STD_LOGIC;
				TX_FPGA_sWR		: OUT STD_LOGIC;	-- serial data out	
--				TX_FPGA_sRD 	: IN STD_LOGIC;
				TX_FPGA_sLE 	: OUT STD_LOGIC;
				TX_MODULE_RST 	: IN STD_LOGIC;
				TX_AD9279_pgm_done: in  std_logic;
				TX_FPGA_sCLK	: OUT STD_LOGIC;
				TX_FPGA_Tx_EN 	: OUT STD_LOGIC;
				CONTROL_STATIC_CONFIG :IN	STD_LOGIC;
				CONTROL_DYNAMIC_CONFIG :IN STD_LOGIC;
				TX_RCI_DATA 	: IN STD_LOGIC_VECTOR(7 downto 0);
				BEAM_NO 			:IN STD_LOGIC_VECTOR (7 downto 0);
				enable_done		: in std_logic
			);
end IC_Beamformer;

ARCHITECTURE BEAMFORMER_BEHAVIORAL of IC_Beamformer is

-----------------------------------------------------------------------------------
--						SIGNAL DECLARATION
-----------------------------------------------------------------------------------

SIGNAL SLE: STD_LOGIC := '0';
SIGNAL SR : STD_LOGIC_VECTOR (27 downto 0) := x"0000000"; --SHIFT REGISTER
SIGNAL ADDR_ROM : STD_LOGIC_VECTOR (9 downto 0) := "00" & x"00";
SIGNAL DATA_ROM : STD_LOGIC_VECTOR (11 downto 0) := x"000";
SIGNAL SELECT_COUNTER :  STD_LOGIC_VECTOR (3 downto 0) := x"0";-- FOR SELECTION OF THE 5 CONFIGURTION IN ONE_TIME_STATIC_CONFIG_STATE
SIGNAL SHIFT_COUNTER :  STD_LOGIC_VECTOR (4 downto 0) := "00000";-- COUNTER FOR RIGHT SHIFTING DATA 
SIGNAL COUNTER_50MHZ :  STD_LOGIC_VECTOR (1 downto 0) := "00";-- COUNTER FOR 5MHZ CLOCK
SIGNAL MY_50MHZ :	STD_LOGIC := '0';	--TEMPORARY CLOCK SIGNAL
SIGNAL FAL_EDGE_50MHZ :	STD_LOGIC := '0';--FALLING EDGE OF MY_50MHZ SIGNAL 
SIGNAL MY_50MHZ_DELAY :	STD_LOGIC := '0';-- DELAYED 50 MHZ SIGNAL
SIGNAL FOCAL_POINT :  STD_LOGIC_VECTOR (7 downto 0) := x"00"; -- FOCAL POINT DATA ACCEPTED FROM THE RCI MEMORY
SIGNAL START_SCLK :	STD_LOGIC := '0';		--FLAG FOR TURNING ON AND OFF CLOCK 
SIGNAL STATIC_FLAG :	STD_LOGIC := '0';		--FLAG FOR RETURNING TO STATIC CONFIGURATION AFTER TRANSMISSION
SIGNAL DYNAMIC_FLAG : STD_LOGIC := '0';	--FLAG FOR RETURNING TO DYNAMIC CONFIGURATION AFTER TRANSMISSION
SIGNAL WAITING_COUNTER :  STD_LOGIC_VECTOR (11 downto 0) := x"000";
SIGNAL BEAM_INTERVAL_COUNTER :  STD_LOGIC_VECTOR (23 downto 0) := x"000000";
SIGNAL Tx_ENABLE_SIGNAL :	STD_LOGIC := '0';
SIGNAL LATCH_COUNTER :  STD_LOGIC_VECTOR (3 downto 0) := x"0";
SIGNAL RISING_DYNAMIC_CONTROL :	STD_LOGIC := '0';
SIGNAL DYNAMIC_DELAYED_SIG :	STD_LOGIC := '0';
SIGNAL FLAG_DYNAMIC :	STD_LOGIC := '0';
SIGNAL WINDOW_COUNTER  : STD_LOGIC_VECTOR (3 downto 0):= "0000";-- this counter is for counting 8 beams
SIGNAL PAGE_START_ADDR : STD_LOGIC_VECTOR(9 DOWNTO 0):= "00"&x"00";-- starting  addr for each page(FOCUL POINT)

SIGNAL CHECK_FLAG : STD_LOGIC := '0';

-----------------------------------------------------------------------------------
--						STATES DECLARATION
-----------------------------------------------------------------------------------

TYPE state_type is (
                      IDLE, 
                      ONE_TIME_STATIC_CONFIG_STATE,
							 DYNAMIC_CONFIG_STATE,
							 LATCHING_STATE,
							 TRANSMITTING_STATE,
							 LATCH_EN_STATE,
							 WAITING_STATE,
							 Tx_ENABLE_STATE
						  );
SIGNAL BEAMFORMER_IC_STATES  : state_type;


-----------------------------------------------------------------------------------
--						COMPONENT DECLARATION
-----------------------------------------------------------------------------------
COMPONENT TX_LUT
  PORT (
    clka  : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);-- ADDRESS IS FETCHED TO READ FROM THE ROM
    douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)-- DATA FOR READING FROM THE ROM WITH RESPCTIVE ADRRESS
  );
END COMPONENT;
------------------------------------------------------------------------------------

BEGIN

TX_FPGA_sWR    <= SR(0); --LAST BIT OF SHIFT REGISTER PORTED TO sWR PIN OF BEAMFORMER IC 
TX_FPGA_sLE 	<= SLE;
TX_FPGA_sCLK	<= MY_50MHZ_DELAY;
TX_FPGA_Tx_EN  <= Tx_ENABLE_SIGNAL;

LOOK_UP_TABLE : TX_LUT
  PORT MAP (
    clka => TX_GLOBAL_CLK,
    addra => ADDR_ROM,
    douta => DATA_ROM
  );

BEAMFORMER_STATE_MACHINE : PROCESS (TX_GLOBAL_CLK,TX_MODULE_RST)
	BEGIN
	IF (TX_MODULE_RST = '1') THEN
					ADDR_ROM <= (others => '0');	--"ZZZZZZZZZZ";--
					SLE <= '1';
					SR	<= x"0000000";
					SHIFT_COUNTER <= "00000";
					START_SCLK <= '0';
					BEAM_INTERVAL_COUNTER<= (others => '0');
					BEAMFORMER_IC_STATES <= IDLE;
					
     ELSIF RISING_EDGE(TX_GLOBAL_CLK) THEN
				
					CASE BEAMFORMER_IC_STATES is					
								WHEN IDLE =>									
													WINDOW_COUNTER <= "0000";
													SELECT_COUNTER <= x"0";
													STATIC_FLAG <= '0';
													DYNAMIC_FLAG <= '0';
													SLE <= '1';
													SR	<= x"0000000";
													
													IF(enable_done = '1' and CONTROL_STATIC_CONFIG = '1') THEN
														BEAMFORMER_IC_STATES  <= ONE_TIME_STATIC_CONFIG_STATE;
														STATIC_FLAG <= '1';
													ELSIF (RISING_DYNAMIC_CONTROL = '1') THEN
														BEAMFORMER_IC_STATES  <= DYNAMIC_CONFIG_STATE;
														DYNAMIC_FLAG <= '1';
													ELSE
														BEAMFORMER_IC_STATES  <= IDLE;
												    END IF;
											
								WHEN ONE_TIME_STATIC_CONFIG_STATE =>
								
												IF (SELECT_COUNTER < x"6") THEN-- 5 counts for static configuration
													case SELECT_COUNTER is 
													when x"0"   => 
														         SR <= x"000049A";	--TOP CONTROL REGISTER 1 BIT TOGGLE
															      SHIFT_COUNTER <= "10011"; --20 COUNTS
															      SLE <= '0';
															      BEAMFORMER_IC_STATES  <= TRANSMITTING_STATE;
													when x"1"   => 
													            SR <= x"001049A";	--TOP CONTROL REGISTER
															      SHIFT_COUNTER <= "10011"; --20 COUNTS 
															      SLE <= '0';
															      BEAMFORMER_IC_STATES  <= TRANSMITTING_STATE;
													when x"2"   => 
													            SR <= x"000005B";	--PLL CLOCK INPUT SELECT CONTROL REGISTER
															      SHIFT_COUNTER <= "01101"; --14 COUNTS 
															      SLE <= '0';
															      BEAMFORMER_IC_STATES  <= TRANSMITTING_STATE;
													when x"3"   =>
													            SR <= x"00181D8";	--Global 'P' PATTERN
															      SHIFT_COUNTER <= "10101"; --22 COUNTS from 14 counts
															      SLE <= '0';
															      BEAMFORMER_IC_STATES  <= TRANSMITTING_STATE;
													when x"4"   =>
													            SR <= x"0007E19";	--Global 'N' PATTERN
															      SHIFT_COUNTER <= "10101"; --22 COUNTS from 14 counts
															      SLE <= '0';
															      BEAMFORMER_IC_STATES  <= TRANSMITTING_STATE;
													when others =>
													            STATIC_FLAG <= '0';
															      DYNAMIC_FLAG <= '1';
															      WINDOW_COUNTER <="0001";
															      BEAMFORMER_IC_STATES  <= IDLE; --DYNAMIC_CONFIG_STATE;
													end case;
--														
											END IF;
													
													IF(STATIC_FLAG <= '1') THEN
														SELECT_COUNTER <= SELECT_COUNTER + '1';
													END IF;
															
								WHEN DYNAMIC_CONFIG_STATE =>										
												IF(BEAM_NO = 1) THEN																									
														CASE TX_RCI_DATA IS														
																WHEN 	x"00" => PAGE_START_ADDR <= "00"&x"00"; CHECK_FLAG <='1';	--0;
																WHEN 	x"01" => PAGE_START_ADDR <= "00"&x"40"; CHECK_FLAG <='1';	--64;
																WHEN 	x"02" => PAGE_START_ADDR <= "00"&x"80"; CHECK_FLAG <='1';	--128;
																WHEN 	x"03" => PAGE_START_ADDR <= "00"&x"C0"; CHECK_FLAG <='1';	--192;
																WHEN 	x"04" => PAGE_START_ADDR <= "01"&x"00"; CHECK_FLAG <='1';	--256;
																WHEN 	x"05" => PAGE_START_ADDR <= "01"&x"40"; CHECK_FLAG <='1';	--320;
																WHEN 	x"06" => PAGE_START_ADDR <= "01"&x"80"; CHECK_FLAG <='1';	--384;
																WHEN 	x"07" => PAGE_START_ADDR <= "01"&x"C0"; CHECK_FLAG <='1';	--448;
																WHEN 	x"08" => PAGE_START_ADDR <= "10"&x"00"; CHECK_FLAG <='1';	--512;
																WHEN 	x"09" => PAGE_START_ADDR <= "10"&x"40"; CHECK_FLAG <='1';	--576;
																WHEN OTHERS => NULL;															
														END CASE;										
												END IF;									
													if CHECK_FLAG = '1' and BEAM_NO = x"01" then 
													   CHECK_FLAG <= '0' ;
													end if;
																						
										--			IF  (BEAM_NO >= 1 AND BEAM_NO < 122 ) THEN-- changed
														SHIFT_COUNTER <= "11011";-- load 28 bit count
--														SLE <= '0';
														START_SCLK <= '0'; -- added 18/04/13
														DYNAMIC_FLAG <= '1';
														WINDOW_COUNTER <= WINDOW_COUNTER +'1';
														BEAMFORMER_IC_STATES  <= LATCHING_STATE ;
														IF(WINDOW_COUNTER > 7 ) THEN -- from 9 to 8 changed														
														   WINDOW_COUNTER <= "0000";-- changed to 1 from 0 -- SKB
														   DYNAMIC_FLAG <= '0';
														   BEAMFORMER_IC_STATES  <= WAITING_STATE;																
														END IF;
													   case BEAM_NO is
													   when  x"01" | x"09" | x"11" | x"19" | x"21" | x"29" | x"31" | x"39" | x"41" | x"49" | x"51" | x"59" | x"61" | x"69" | x"71" | x"79" | x"81" 	=>  	ADDR_ROM <= PAGE_START_ADDR + 0 + WINDOW_COUNTER; 
																
			
			                                 when  x"02" | x"0A" | x"12" | x"1A" |  x"22" |  x"2A" |  x"32" |  x"3A" |  x"42" | x"4A" |  x"52" |  x"5A" |  x"62" |  x"6A" |  x"72"   		=> 	ADDR_ROM <= PAGE_START_ADDR + 8 + WINDOW_COUNTER; 
																																																					
																																																					
				                              when x"03" | x"0B" | x"13" | x"1B" |  x"23" |  x"2B" |  x"33" |  x"3B" |  x"43" | x"4B" |  x"53" |  x"5B" |  x"63" |  x"6B" |  x"73" 			=> 	ADDR_ROM <= PAGE_START_ADDR + 16+ WINDOW_COUNTER;
																																																				
																																																					
				                              when  x"04" | x"0C" | x"14" | x"1C" |  x"24" |  x"2C" |  x"34" |  x"3C" |  x"44" | x"4C" |  x"54" |  x"5C" |  x"64" |  x"6C" |  x"74"      	=>    ADDR_ROM <= PAGE_START_ADDR + 24+ WINDOW_COUNTER;
																																																					
																																																					
				                              when  x"05" | x"0D" | x"15" | x"1D" |  x"25" |  x"2D" |  x"35" |  x"3D" |  x"45" | x"4D" |  x"55" |  x"5D" |  x"65" |  x"6D" |  x"75"      	=>   	ADDR_ROM <= PAGE_START_ADDR + 32+ WINDOW_COUNTER;
																																																					
																																																					
				                              when  x"06" | x"0E" | x"16" | x"1E" |  x"26" |  x"2E" |  x"36" |  x"3E" |  x"46" | x"4E" |  x"56" |  x"5E" |  x"66" |  x"6E" |  x"76"        =>   	ADDR_ROM <= PAGE_START_ADDR + 40+ WINDOW_COUNTER;
																																																					
																																																					
				                              when  x"07" | x"0F" | x"17" | x"1F" |  x"27" |  x"2F" |  x"37" |  x"3F" |  x"47" | x"4F" |  x"57" |  x"5F" |  x"67" |  x"6F" |  x"77"        =>  	ADDR_ROM <= PAGE_START_ADDR + 48+ WINDOW_COUNTER;
																																																					
																																																					
				                              when  x"08" | x"10" | x"18" | x"20" |  x"28" |  x"30" |  x"38" |  x"40" |  x"48" | x"50" |  x"58" |  x"60" |  x"68" |  x"70" |  x"78"       	=>   	ADDR_ROM <= PAGE_START_ADDR + 56+ WINDOW_COUNTER;

				                              when others => null ;
			                                 end case;
												--	end if;
													
							WHEN LATCHING_STATE =>						-- ADDER THIS STATE FOR FETCHING THE DATA LATE
													
													SR <=  x"0000" & DATA_ROM(11 DOWNTO 0);	
													LATCH_COUNTER <= LATCH_COUNTER + '1';
													IF (LATCH_COUNTER > x"4") THEN
														SLE <= '0';
														BEAMFORMER_IC_STATES  <= TRANSMITTING_STATE ;
--														START_SCLK <= '1';-- turning ON the sCLK
														LATCH_COUNTER <= x"0";
													END IF;
													
							WHEN TRANSMITTING_STATE =>

									
											START_SCLK <= '1';-- turning ON the sCLK
																							
												IF(FAL_EDGE_50MHZ = '1') THEN
														IF(SHIFT_COUNTER > 0) THEN
															SR <=  '0' & SR (27 downto 1);
															SHIFT_COUNTER <= SHIFT_COUNTER - '1';
														ELSE
															BEAMFORMER_IC_STATES  <= LATCH_EN_STATE;
															START_SCLK <= '0';														
														END IF;
										
												END IF;	

							WHEN LATCH_EN_STATE =>
													START_SCLK <= '0';
													LATCH_COUNTER <= LATCH_COUNTER + '1';
													IF (LATCH_COUNTER < x"8") THEN
														IF(LATCH_COUNTER > x"4") THEN
															SLE <= '1';
														END IF;
													ELSE
													
															IF(STATIC_FLAG = '1') THEN
																	BEAMFORMER_IC_STATES  <= ONE_TIME_STATIC_CONFIG_STATE;
																	-- START_SCLK <= '0';
																	IF(LATCH_COUNTER > x"8") THEN
																		SLE <= '1';
																	END IF;
																
																LATCH_COUNTER <= x"0";
															
															ELSIF (DYNAMIC_FLAG = '1') THEN
--														
--																	IF(WINDOW_COUNTER > 8) THEN --------------> added this on 25/4/13
--																		BEAMFORMER_IC_STATES  <= WAITING_STATE;
--																		WINDOW_COUNTER <= "0001";			 -------|
--																	ELSE
																		BEAMFORMER_IC_STATES  <= DYNAMIC_CONFIG_STATE;
--																		WINDOW_COUNTER <= WINDOW_COUNTER +'1';---| ADDED ON 24/4/13
--																	END IF;								-----------------|
																
																	-- START_SCLK <= '0';	
--																	IF(LATCH_COUNTER > x"8") THEN
--																		SLE <= '1';
--																	END IF;
																	LATCH_COUNTER <= x"0";
															END IF;
													
													END IF;
												

							WHEN WAITING_STATE =>
												
												if(TX_AD9279_pgm_done = '1') then	
													IF(WAITING_COUNTER < x"770") THEN --counter for WAITING 10 us
														WAITING_COUNTER <= WAITING_COUNTER + '1';
													ELSE	
														WAITING_COUNTER <= 	x"000";
														BEAMFORMER_IC_STATES  <= Tx_ENABLE_STATE;
													END IF;
												else
													BEAMFORMER_IC_STATES  <= WAITING_STATE;
												end if;													
								
							
							WHEN Tx_ENABLE_STATE =>
											
											IF(enable_done = '1') then -- ADDED ON 13-6-13 FAIZ
													IF(BEAM_INTERVAL_COUNTER < x"19389D")then--3.3ms(A1220) 1650us(50910)990 us(30570)  "1" & x"01D1") THEN --330us
																																		
															BEAM_INTERVAL_COUNTER <= BEAM_INTERVAL_COUNTER + '1';--330us FREE RUNNING COUNTER
															
															IF(BEAM_INTERVAL_COUNTER < x"0000C8") then --AND TX_EN_STOP = '0') THEN --counter for 1us
																Tx_ENABLE_SIGNAL <= '1';
															ELSE
																Tx_ENABLE_SIGNAL <= '0';
																
															END IF;
															
															IF( RISING_DYNAMIC_CONTROL = '1' ) THEN
																BEAMFORMER_IC_STATES  <= DYNAMIC_CONFIG_STATE;
																Tx_ENABLE_SIGNAL <= '0';--- added on 3-5-13
																BEAM_INTERVAL_COUNTER<= (others => '0');
															END IF;											
													ELSE
															
															BEAMFORMER_IC_STATES  <= Tx_ENABLE_STATE;
															BEAM_INTERVAL_COUNTER <= (others => '0');
															
													END IF;		
											ELSE
												BEAMFORMER_IC_STATES <= IDLE;
												Tx_ENABLE_SIGNAL <= '0';
											END IF;		
							
							WHEN OTHERS => BEAMFORMER_IC_STATES <= IDLE;
						END CASE;
					END IF;			
END PROCESS	BEAMFORMER_STATE_MACHINE;								

PROCESS (TX_GLOBAL_CLK,TX_MODULE_RST)
BEGIN
	IF (TX_MODULE_RST = '1') THEN
		MY_50MHZ <= '0';
		COUNTER_50MHZ <= "00";
		MY_50MHZ_DELAY <= '0';
	ELSIF RISING_EDGE(TX_GLOBAL_CLK) then
		IF (COUNTER_50MHZ > x"02") THEN				-- 5 n sec => 1 count cycle  
			MY_50MHZ <= NOT MY_50MHZ;					-- 2 micro sec(500Khz) => "X" count cycle => 400		  
			COUNTER_50MHZ <=(others => '0');  		-- 50% Duty cycle = 200 counts => ("C8") HEX.
		ELSE
			COUNTER_50MHZ <= COUNTER_50MHZ + '1';
		END IF;
					
		if (START_SCLK = '1') then
			MY_50MHZ_DELAY <= MY_50MHZ;
		else
			MY_50MHZ_DELAY <= '0';
		end if;
	END IF;						
END PROCESS;

FAL_EDGE_50MHZ <= MY_50MHZ_DELAY AND NOT MY_50MHZ;
	
	
process(TX_GLOBAL_CLK,TX_MODULE_RST)
begin
	IF (TX_MODULE_RST = '1') THEN
		DYNAMIC_DELAYED_SIG <= '0';
	ELSIF RISING_EDGE(TX_GLOBAL_CLK) then			
		DYNAMIC_DELAYED_SIG <= CONTROL_DYNAMIC_CONFIG;
	END IF;
end process;

RISING_DYNAMIC_CONTROL <= (not DYNAMIC_DELAYED_SIG) and CONTROL_DYNAMIC_CONFIG; 
	
	 
END BEAMFORMER_BEHAVIORAL;				
