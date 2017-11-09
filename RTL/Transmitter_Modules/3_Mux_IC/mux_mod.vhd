----------------------------------------------------------------------------------
-- Company: 			Larsen & Toubro	
-- Engineer: 			Sayed Faizan Aliakbar
-- 
-- Create Date:    	14:21:20 03/15/2013 
-- Design Name: 
-- Module Name:    	mux_mod - Behavioral 
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
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY MUX_MODULE is
			Port ( 
					  MUX_GLOBAL_CLK 		: IN  STD_LOGIC;
					  MUX_MOD_RST 			: IN  STD_LOGIC;
					  MUX_BEAM_NO 			: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
					  MUX_DYNAMIC_CONFIG : IN  STD_LOGIC;
					  MUX_DOUT_IC1 		: IN  STD_LOGIC;
					  MUX_DOUT_IC2 		: IN  STD_LOGIC;
					  MUX_DOUT_IC3 		: IN  STD_LOGIC;
					  MUX_DOUT_IC4 		: IN  STD_LOGIC;
					  enable_done3			: IN  STD_LOGIC;
					  MUX_DIN_IC1			: OUT STD_LOGIC;
					  MUX_DIN_IC2			: OUT STD_LOGIC;
					  MUX_DIN_IC3			: OUT STD_LOGIC;
					  MUX_DIN_IC4			: OUT STD_LOGIC;
					  MUX_LE_IC				: OUT STD_LOGIC;
					  MUX_CLEAR 			: OUT STD_LOGIC;
					  MUX_CLK_5MHZ			: OUT STD_LOGIC
					  
					);
END MUX_MODULE;

ARCHITECTURE MUX_MODULE_BEHAV of MUX_MODULE is

TYPE STATE_TYPE is (
                      CLEAR_STATE,
							 IDLE_STATE,
							 CONFIG_WAITING_STATE,
							 DATA_SHIFTING_STATE,
                      DATA_LOADING_STATE,
							 LATCHING_STATE,
							 TRANSMITTING_STATE,
							 LATCH_EN_STATE
						  );
SIGNAL MUX_IC_STATES  : STATE_TYPE;

SIGNAL LE_signal					: STD_LOGIC := '1';
SIGNAL MY_5MHZ						: STD_LOGIC := '1';
SIGNAL MY_5MHZ_DELAY				: STD_LOGIC := '0';
SIGNAL FAL_EDGE_5MHZ				: STD_LOGIC := '0';
SIGNAL START_CLOCK_5MHZ			: STD_LOGIC := '0';
SIGNAL CLEAR_SIGNAL				: STD_LOGIC := '0';
SIGNAL DYNAMIC_DELAYED_SIG		: STD_LOGIC := '0';
SIGNAL RISING_DYNAMIC_CONTROL	: STD_LOGIC := '0';


SIGNAL MAIN_SR					: STD_LOGIC_VECTOR (127 downto 0) 	:=(others => '0');		-- shift register for loadig the values
SIGNAL SR						: STD_LOGIC_VECTOR (127 downto 0) 	:=  (others => '0');	-- shift register for transmitting stage
SIGNAL SHIFT_COUNTER 		: STD_LOGIC_VECTOR(7 downto 0) 		:=(others => '0');			-- COUNTER TO SHIFT LEFT 32 BIT DATA FOR EACH IC
SIGNAL MAIN_SR_COUNTER 		: STD_LOGIC_VECTOR(7 downto 0) 		:= x"80";						-- COUNTER SHIFTING BY 2 FOR 121 BEAM DATA SELECTION
SIGNAL COUNTER_5MHZ			: STD_LOGIC_VECTOR(7 downto 0) 		:=(others => '0');			-- COUNTER FOR GENERATING 5 MHZ
SIGNAL LATCH_COUNTER			: STD_LOGIC_VECTOR(7 downto 0) 		:=(others => '0');
SIGNAL CONFIG_WAIT_COUNTER : STD_LOGIC_VECTOR(15 downto 0) 		:=(others => '0');
SIGNAL clear_counter			: STD_LOGIC_VECTOR(19 downto 0) 		:=(others => '0');

CONSTANT DATA_MUX 	: STD_LOGIC_VECTOR (127 downto 0)  := x"AAAA0000000000000000000000000000";
CONSTANT SHIFT_VALUE : STD_LOGIC_VECTOR(7 downto 0)    := x"20"; -- 32 COUNT


BEGIN

MUX_DIN_IC1		<= SR(96); 
MUX_DIN_IC2		<= SR(64);
MUX_DIN_IC3		<= SR(32);
MUX_DIN_IC4		<= SR(0);
MUX_LE_IC		<= LE_signal;
MUX_CLEAR 		<= CLEAR_SIGNAL;
MUX_CLK_5MHZ 	<= MY_5MHZ_DELAY;

MULTIPLEXER_STATE_MACHINE : PROCESS (MUX_GLOBAL_CLK,MUX_MOD_RST)
BEGIN
	IF (MUX_MOD_RST = '1') THEN
					LE_signal <= '1';
					MAIN_SR	<= DATA_MUX;
					SHIFT_COUNTER <=(others => '0');
					START_CLOCK_5MHZ <= '0';
					CLEAR_SIGNAL <= '0';
					MUX_IC_STATES <= IDLE_STATE;--CLEAR_STATE;
					MAIN_SR_COUNTER <= x"80";
					
   ELSIF RISING_EDGE(MUX_GLOBAL_CLK) THEN
		CASE MUX_IC_STATES is
			
				WHEN CLEAR_STATE =>
							if (enable_done3 = '1' and MUX_BEAM_NO = x"01") then
								if(clear_counter = x"0000f") then --x"00190"x"61A80") then -- 2 us waiting counter -- -- tesing    
									CLEAR_SIGNAL <= '0';
									MUX_IC_STATES  <= IDLE_STATE;
									clear_counter <= (OTHERS => '0');
								else
									CLEAR_SIGNAL <= '1';
									clear_counter <= clear_counter + '1';
								end if;
							else
								MUX_IC_STATES  <= CLEAR_STATE;
							end if;
							
				WHEN IDLE_STATE  =>
							LE_signal <= '1';
--							MAIN_SR	<= DATA_MUX;
							SHIFT_COUNTER <=(others => '0');
							START_CLOCK_5MHZ <= '0';
																							
							IF (enable_done3 = '1' AND RISING_DYNAMIC_CONTROL = '1') THEN
								MUX_IC_STATES  <= CONFIG_WAITING_STATE;--DATA_SHIFTING_STATE;-- 
							ELSE
								MUX_IC_STATES  <= IDLE_STATE;
							END IF;
													
				WHEN CONFIG_WAITING_STATE =>				
							
							IF( CONFIG_WAIT_COUNTER >x"E290")then-- x"E290") THEN---x"01F4") THEN --/*--- WAITING OF 290us Added for the timing matching 
									MUX_IC_STATES  <= DATA_SHIFTING_STATE ;
									CONFIG_WAIT_COUNTER <=(others => '0');

							ELSE
									IF( CONFIG_WAIT_COUNTER > x"0013") THEN 
											CLEAR_SIGNAL <= '0';  --added on 16_5_13 100 ns clearing the prev latched data
									ELSE
											CLEAR_SIGNAL <= '1';
									end if;	
									CONFIG_WAIT_COUNTER <= CONFIG_WAIT_COUNTER + '1';
									MUX_IC_STATES  <= CONFIG_WAITING_STATE;
							END IF;
				
				WHEN DATA_SHIFTING_STATE =>
						
						IF( MUX_BEAM_NO = 1) then
								MAIN_SR	<= DATA_MUX;
								MUX_IC_STATES  <= DATA_LOADING_STATE;
															
						ELSE
							IF( MUX_BEAM_NO > 1 and MUX_BEAM_NO < 122) THEN
								MAIN_SR <=  "00" & MAIN_SR (127 downto 2);-- right SHIFT
								MAIN_SR_COUNTER <= MAIN_SR_COUNTER - 2;
								IF (MUX_BEAM_NO > 57 AND MUX_BEAM_NO < 66) THEN
									MAIN_SR(127) <= '0';
									MAIN_SR(126) <= '1';
								END IF;																
								IF(MUX_BEAM_NO = 66) THEN------ added 26_4_13 SFA
									MAIN_SR(127) <= '0';
									MAIN_SR(126) <= '0';
								END IF;	
																	MUX_IC_STATES  <= DATA_LOADING_STATE;
							end if;
						end if;												
	--													
					
					
									
				WHEN DATA_LOADING_STATE =>
				
							SR <= MAIN_SR;
							SHIFT_COUNTER <= SHIFT_VALUE; --32 COUNTS
							IF (LATCH_COUNTER < x"80") THEN
								LATCH_COUNTER <= LATCH_COUNTER + '1';
							ELSE														
									MUX_IC_STATES  <= LATCHING_STATE;
									LATCH_COUNTER <= (others => '0');
							END IF;

							
																		
				
				WHEN LATCHING_STATE =>			
							
							START_CLOCK_5MHZ <= '1';
							MUX_IC_STATES  <= TRANSMITTING_STATE;
																		
				WHEN TRANSMITTING_STATE =>
															
						IF(SHIFT_COUNTER > x"0" ) THEN
														
								IF(FAL_EDGE_5MHZ = '1') THEN
										--SR <= SR sla 1;
	--															SR <=  SR (126 downto 0) & '0';-- LEFT SHIFT
										SR <=  '0' & SR (127 downto 1);-- right SHIFT
										SHIFT_COUNTER <= SHIFT_COUNTER - '1';
										IF(SHIFT_COUNTER = x"1") THEN
											SR <=  (others => '0');
										END IF;	
								END IF;
						ELSE			
							MUX_IC_STATES  <= LATCH_EN_STATE;														
							START_CLOCK_5MHZ <= '0';
						
						END IF;
				
				 WHEN LATCH_EN_STATE =>													
								
						IF (LATCH_COUNTER < x"33") THEN													
								LATCH_COUNTER <= LATCH_COUNTER + '1';													
								IF(LATCH_COUNTER < x"07" ) THEN
										LE_signal <= '1';--'0';
								ELSIF(LATCH_COUNTER >= x"1E" AND LATCH_COUNTER < x"32") THEN
										LE_signal <= '0';
								END IF;
						ELSE
									MUX_IC_STATES  <= IDLE_STATE;
									LE_signal <= '1';
									LATCH_COUNTER <= (others => '0');
						END IF;									
						
							
					WHEN OTHERS => MUX_IC_STATES <= IDLE_STATE;									
				
			END CASE;
		END IF;		
	END PROCESS	MULTIPLEXER_STATE_MACHINE;								

	
	PROCESS (MUX_GLOBAL_CLK, MUX_MOD_RST)
		BEGIN
		        IF (MUX_MOD_RST = '1') THEN
							MY_5MHZ <= '1';
							COUNTER_5MHZ <=(others => '0');
							MY_5MHZ_DELAY <= '0';
				ELSIF RISING_EDGE(MUX_GLOBAL_CLK) then

								if (START_CLOCK_5MHZ = '1') then 
								   IF (COUNTER_5MHZ > x"14") then--x"64") THEN--	-- 5 n sec => 1 count cycle  
								   	   MY_5MHZ <= NOT MY_5MHZ;						-- 200 n sec(5 Mhz) => "X" count cycle => 40		  
								   	   COUNTER_5MHZ <=(others => '0');  			-- 50% Duty cycle = 20 counts => ("14") HEX.								   								
																
								   ELSE
								   	   COUNTER_5MHZ <= COUNTER_5MHZ + '1';
								   END IF;
								end if;
								
								if (START_CLOCK_5MHZ = '1') then
									MY_5MHZ_DELAY <= MY_5MHZ;
								else
									MY_5MHZ_DELAY <= '0';
								end if;
			END IF;
	END PROCESS;

FAL_EDGE_5MHZ <= MY_5MHZ_DELAY AND NOT MY_5MHZ;
		
	
	

	PROCESS(MUX_GLOBAL_CLK,MUX_MOD_RST)
		begin
		IF (MUX_MOD_RST = '1') THEN
				DYNAMIC_DELAYED_SIG <= '0';
      ELSIF RISING_EDGE(MUX_GLOBAL_CLK) then					
				DYNAMIC_DELAYED_SIG <= MUX_DYNAMIC_CONFIG;
		END IF;
    END PROCESS;
	 
    RISING_DYNAMIC_CONTROL <= (not DYNAMIC_DELAYED_SIG) and MUX_DYNAMIC_CONFIG; 
		
												

END MUX_MODULE_BEHAV;

