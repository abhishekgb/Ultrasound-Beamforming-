----------------------------------------------------------------------------------
-- Engineer: 			Abhishek Gubbi Basavaraj/Sayed Faizan Aliakbar
-- 
-- Create Date:    	14:25:31 02/12/2013
-- Design Name: 		Power Supply Enable Sequence 
-- Module Name:    	Powersupply_seq - Behavioral 
-- Project Name: 		Ultrasound Beam Former
-- Target Devices: 	XC5VLX50-1FF676
-- Tool versions: 	ISE 14.4
-- Description: 
--
-- Dependencies: 
--
-- Revision: 			
-- Revision 0.01 - File Created 14:25:31 02/12/2013
-- Revision 0.02 - File Modified 10:25:31 02/15/2013 
-- Revision 0.03 - File Modified 15:15:00 04/03/2014 
-- Additional Comments: counter  increment/decrement condition for both changed after simulation results
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


ENTITY POWER_SEQUENCE IS
	
	PORT(
			P_OTP1			: IN STD_LOGIC;
			P_RESET			: IN STD_LOGIC;
--			P_RCI				: IN STD_LOGIC;
			P_GLOBAL_CLK	: IN STD_LOGIC;
			P_ENABLE1_1		: OUT STD_LOGIC;
			P_ENABLE1_2		: OUT STD_LOGIC;
			P_ENABLE1_3		: OUT STD_LOGIC;
			P_ENABLE1_4		: OUT STD_LOGIC;
			P_ENABLE1_5		: OUT STD_LOGIC;
			P_ENABLE1_6		: OUT STD_LOGIC;
			P_SYNC			: OUT STD_LOGIC
		);
END POWER_SEQUENCE;

ARCHITECTURE POWER_BEHAVIORAL OF POWER_SEQUENCE IS

SIGNAL P_EN1				:	STD_LOGIC:= '0';
SIGNAL P_EN2				:	STD_LOGIC:= '0';
SIGNAL P_EN3				:	STD_LOGIC:= '0';
SIGNAL P_EN4				:	STD_LOGIC:= '0';
SIGNAL P_EN5				:	STD_LOGIC:= '0';
SIGNAL P_EN6				:	STD_LOGIC:= '0';
SIGNAL P_500KHZ			:	STD_LOGIC := '0';
SIGNAL P_500KHZ_COUNTER :  STD_LOGIC_VECTOR (7 downto 0) := (OTHERS =>'0');
SIGNAL SEQ_COUNTER		:  STD_LOGIC_VECTOR (35 downto 0):= (OTHERS =>'0');
SIGNAL delayed_P_OTP1	:	STD_LOGIC;
SIGNAL RISING_POWER		:	STD_LOGIC;


TYPE state_type is (
								OFF_STATE, 
								POWER_ON_STATE,
								RUNNING_STATE,
								POWER_OFF_STATE					 
                    );
SIGNAL FSM_states  : state_type;
BEGIN

----------------------------------------------------------------------------------------
-- Generation of 500Khz clock from 200Mhz
----------------------------------------------------------------------------------------
GENERATE_500KHZ :PROCESS(P_GLOBAL_CLK,P_RESET) is
BEGIN
	IF(P_RESET = '1') THEN 
		P_500KHZ_COUNTER <=(others => '0'); 
		P_500KHZ <= '0';
	ELSIF RISING_EDGE(P_GLOBAL_CLK) then
		IF (P_500KHZ_COUNTER > x"C8") THEN				-- 5 n sec => 1 count cycle  
			P_500KHZ <= NOT P_500KHZ;							-- 2 micro sec(500Khz) => "X" count cycle => 400		  
			P_500KHZ_COUNTER <=(others => '0');  			-- 50% Duty cycle = 200 counts => ("C8") HEX.
		ELSE
			P_500KHZ_COUNTER <= P_500KHZ_COUNTER + '1';
		END IF;
	END IF;
END PROCESS GENERATE_500KHZ;


POWER_SEQ_STATE : PROCESS (P_GLOBAL_CLK,P_RESET)
BEGIN
	IF (P_RESET = '1') THEN
		P_EN1 	<= '0';
		P_EN2 	<= '0';
		P_EN3 	<= '0';
		P_EN4 	<= '0';
		P_EN5 	<= '0';
		P_EN6 	<= '0';
		FSM_states  <= OFF_STATE;
	ELSIF RISING_EDGE(P_GLOBAL_CLK) then
		CASE FSM_states is
				WHEN OFF_STATE =>
							P_EN1 	<= '0';
							P_EN2 	<= '0';
							P_EN3 	<= '0';
							P_EN4 	<= '0';
							P_EN5 	<= '0';
							P_EN6 	<= '0';
							SEQ_COUNTER <= (others=> '0');
							IF (P_OTP1 = '0') THEN--IF (P_RCI ='1') THEN
								FSM_states  <= POWER_ON_STATE;
							ELSE
								FSM_states  <= OFF_STATE;
							END IF;

				WHEN POWER_ON_STATE =>
							case SEQ_COUNTER is 
								when x"0003D0900"     => P_EN1 <= '1';	-- 20ms
								when x"004C4B400"     => P_EN2 <= '1'; -- 400ms
								when x"009896800"     => P_EN3 <= '1'; -- 800ms
								when x"00E4E1C00"     => P_EN4 <= '1'; -- 1200ms
								when x"01312D000"     => P_EN5 <= '1'; -- 1600ms
								when x"017D78400"     => P_EN6 <= '1'; -- 2s
																 FSM_states  <= RUNNING_STATE;                               
								when others => FSM_states  <= POWER_ON_STATE;                  
							end case;                                                       
								
								IF(SEQ_COUNTER < x"17D78401") THEN                              
									SEQ_COUNTER <= SEQ_COUNTER + '1';                             
								END IF;											  
										
				WHEN RUNNING_STATE =>
				
								P_EN1 	<= '1';
								P_EN2 	<= '1';
								P_EN3 	<= '1';
								P_EN4 	<= '1';
								P_EN5 	<= '1';
								P_EN6 	<= '1';
								SEQ_COUNTER <= (others=> '0');
								IF (RISING_POWER = '1') THEN --P_OTP1 = '1' OR 
									FSM_states  <= POWER_OFF_STATE;
								ELSE
									FSM_states  <= RUNNING_STATE;
								END IF;
					
				WHEN POWER_OFF_STATE =>
							case SEQ_COUNTER is 
								when x"0003D0900" => P_EN6 <='0'; -- 20ms
								when x"07997EE00" => P_EN5 <='0'; -- 10.02 sec
								when x"0EEA83100" => P_EN4 <='0'; -- 20.02 sec
								when x"165DDC500" => P_EN3 <='0'; -- 30.02 sec 
								when x"1DD135900" => P_EN2 <='0'; -- 40.02 sec 
								when x"25448ED00" => P_EN1 <='0'; -- 50.02 sec 
															FSM_states      <= OFF_STATE;
								when others  		=> FSM_states  <= POWER_OFF_STATE;             
							end case;

							IF(SEQ_COUNTER < x"25448ED01" ) THEN	-- 50.0201 SEC 
								  SEQ_COUNTER <= SEQ_COUNTER + '1';
							END IF;														
				END CASE;
		END IF;
END PROCESS;

PROCESS(P_GLOBAL_CLK,P_RESET)
	begin
      IF (P_RESET = '1') THEN
			delayed_P_OTP1 <= '0';							
		ELSIF RISING_EDGE(P_GLOBAL_CLK) then			
			delayed_P_OTP1 <= P_OTP1;
		END IF;
END PROCESS;
RISING_POWER <= (not delayed_P_OTP1) and P_OTP1; 												

--------------------------------------------------------------------
--Signal assaignmets
--------------------------------------------------------------------

P_ENABLE1_1 <= P_EN1;
P_ENABLE1_2	<= P_EN2;
P_ENABLE1_3 <= P_EN3;
P_ENABLE1_4 <= P_EN4;
P_ENABLE1_5 <= P_EN5;
P_ENABLE1_6	<= P_EN6;
P_SYNC 		<= P_500KHZ;
	
END POWER_BEHAVIORAL;