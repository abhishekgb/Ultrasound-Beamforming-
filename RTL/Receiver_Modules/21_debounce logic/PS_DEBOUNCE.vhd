----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:38 06/04/2013 
-- Design Name: 
-- Module Name:    PS_DEBOUNCE - PS_DEB_Behavioral 
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
--------------------------------------------------------------------------------
--   Debounce logic 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY PS_DEBOUNCE IS
   PORT(
			 clk     		: IN  STD_LOGIC;  --button clock
			 button  		: IN  STD_LOGIC;  --button signal to be debounced
			 tig_mod_rst	: IN  STD_LOGIC;	 
			 result  		: OUT STD_LOGIC); --debounced signal
END PS_DEBOUNCE;

ARCHITECTURE PS_DEB_Behavioral OF PS_DEBOUNCE IS
signal debounce_cnt               : std_logic_vector(11 downto 0):= (others => '0');
signal debounce_cnt_low           : std_logic_vector(11 downto 0):= (others => '0'); 
constant debounce_per      		 : std_logic_vector(11 downto 0):= x"FA0";--x"00F";-- -- "10" & x"58";  
BEGIN

 process (clk) 
	begin
		 if(rising_edge(clk))then
			if(tig_mod_rst = '1') then 
					  result <= button; 
					  debounce_cnt  <= (others => '0');
					  debounce_cnt_low <= (others => '0');
			  
			elsif(button = '1')then  
					  if(debounce_cnt = debounce_per)then  -- DEBOUNCE_PERIOD = count for 20 microsecond.
							 debounce_cnt       <= debounce_cnt;
							 result  	<= button; 
					  else 
							debounce_cnt       <= debounce_cnt + '1';
					  end if;
					 debounce_cnt_low <= (others => '0');
			else
						 result  <= '0';
					  if(debounce_cnt_low = debounce_per)then  -- DEBOUNCE_PERIOD = count for 20 microsecond.
							 debounce_cnt_low	<= debounce_cnt_low;
							 result  <= '0';--button; 
					  else 
							 debounce_cnt_low  <= debounce_cnt_low + '1';
					  end if;
						debounce_cnt      <= (others => '0');    
			end if;
		 end if; 

  END PROCESS;

end PS_DEB_Behavioral;

