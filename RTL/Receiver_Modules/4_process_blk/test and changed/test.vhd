----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:24:59 05/30/2013 
-- Design Name: 
-- Module Name:    module_parallel_shift - Parrel_shift_Behav 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with std_logic_vector or Unstd_logic_vector values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Module_parallel_shift is

	      generic(
	                 INPUT_BIT_WIDTH_SHIFT         : integer     := 16;
	                 OUTPUT_BIT_WIDTH_SHIFT        : integer     := 32
		            );
					Port (	
								shift_global_clk 		: IN  STD_LOGIC;
								shift_module_rst		: IN  STD_LOGIC;
								shift_data_ready 		: IN  STD_LOGIC;
								shift_data_registers	: OUT STD_LOGIC;
								shift_data_in			: IN  std_logic_vector(11 DOWNTO 0);
								shift_data_cosA_out	  	: OUT std_logic_vector(INPUT_BIT_WIDTH_SHIFT-1 DOWNTO 0);	
								shift_data_sinA_out	  	: OUT std_logic_vector(INPUT_BIT_WIDTH_SHIFT-1 DOWNTO 0)
							);		
end Module_parallel_shift;

architecture Parallel_shift_Behav of Module_parallel_shift is

 SIGNAL REG_A_00_DEG : std_logic_vector(INPUT_BIT_WIDTH_SHIFT-1 DOWNTO 0);
 SIGNAL REG_B_45_DEG : std_logic_vector(INPUT_BIT_WIDTH_SHIFT-1 DOWNTO 0);
 SIGNAL REG_C_90_DEG : std_logic_vector(INPUT_BIT_WIDTH_SHIFT-1 DOWNTO 0);
 SIGNAL Data_present : STD_LOGIC := '0';
 SIGNAL shift_cnt : std_logic_vector (1 downto 0);
 SIGNAL sine_cnt : std_logic_vector (1 downto 0);


BEGIN

-- process to latching the data on to the outputs--
PROCESS (shift_global_clk,shift_module_rst)
	BEGIN
		IF	rising_edge(shift_global_clk) then	
			IF ( shift_module_rst = '1') THEN
				shift_data_cosA_out <=  (others => '0');
				shift_data_sinA_out <=  (others => '0');
				shift_data_registers <= '0';
			else
				if (shift_cnt = "11") then 
					shift_data_cosA_out <= REG_C_90_DEG; --cosine data out
					shift_data_registers <= Data_present;--data available for next block	 
				end if;
				shift_data_sinA_out <= REG_A_00_DEG; -- sine data out
			end if;
		end if;	
end process;



-- process for shifting the data wrt to data ready from prev block--
PROCESS (shift_global_clk,shift_module_rst)

BEGIN
		IF	rising_edge(shift_global_clk) then		
	 IF ( shift_module_rst = '1') THEN
			
			REG_A_00_DEG <= (others => '0');
			REG_B_45_DEG <= (others => '0');
			REG_C_90_DEG <= (others => '0');
			Data_present <= '0';
										
	 else	
			if (shift_data_ready = '1')  then 
			    			
				 REG_A_00_DEG <= ("0000" & shift_data_in) ; -- & "0000") ;	        				 
				 REG_B_45_DEG <= REG_A_00_DEG;				
			    REG_C_90_DEG <= REG_B_45_DEG;
             Data_present <= '1';				 
         else
			   Data_present <= '0';
	      end if;
				
	 end if;
end process;	 




process(shift_global_clk,shift_module_rst)
 begin
  if (shift_module_rst = '1') then
   shift_cnt <= (others => '0');
   sine_cnt <= (others => '0');
  elsif (rising_edge (shift_global_clk)) then
     if (shift_data_ready = '1')  then 
	     if shift_cnt = "11" then 
		    shift_cnt <= "11";
		 else
          shift_cnt <= shift_cnt + 1;
			
		 end if;
		 if sine_cnt = "11" then 
		    sine_cnt <= "00";
		  else
          sine_cnt <= sine_cnt + 1;
		 end if;
--		  if sine_cnt = "10" then 
--		    Data_present <= '1';
--		  else
--          Data_present <= '0';
--		 end if;		  
	  end if;
  end if;
end process;  
			


end Parallel_shift_Behav;	 