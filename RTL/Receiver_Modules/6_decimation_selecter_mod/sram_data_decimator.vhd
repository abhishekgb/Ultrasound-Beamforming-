----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:40 07/31/2013 
-- Design Name: 
-- Module Name:    sram_data_decimator - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sram_data_decimator is
    Port ( clk_in : in  STD_LOGIC;
           rst_in : in  STD_LOGIC;
			  sram_data_valid : in STD_LOGIC;
			  decimation_factor : in  STD_LOGIC_VECTOR (1 downto 0);
           sram_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           decimated_data_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  decimated_data_valid : out std_logic
			  );
end sram_data_decimator;

architecture Behavioral of sram_data_decimator is

signal deci_cnt : std_logic_vector (1 downto 0);
signal sram_data_valid_d : std_logic;

begin

decimated_data_valid <= '0' when rst_in = '1' else
								sram_data_valid_d when decimation_factor = "00" else
								deci_cnt(0) when decimation_factor = "01" else
								(sram_data_valid and (not (sram_data_valid_d))) when decimation_factor = "10" else
								'0';

process (clk_in,rst_in)
begin
	if (rst_in = '1') then 
		
		deci_cnt <= (others => '0');
		sram_data_valid_d <= '0';
		decimated_data_out <= (others => '0');
		
	elsif (rising_edge (clk_in)) then 
	
		sram_data_valid_d <= sram_data_valid;
		decimated_data_out <= sram_data_in;
	
		if (decimation_factor = "01") then 
			if (sram_data_valid = '1') then 
				deci_cnt <= deci_cnt + '1';
			else
				deci_cnt <= (others => '0');
			end if;
		end if;
		
	end if;
end process;

end Behavioral;

