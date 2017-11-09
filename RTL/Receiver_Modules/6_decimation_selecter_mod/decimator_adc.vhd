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
use IEEE.STD_LOGIC_SIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adc_data_decimator is
    generic(
	              ADC_BIT_WIDTH         : integer     := 12;
	              OUTPUT_BIT_WIDTH        : integer     := 32
		        );
    Port ( clk_in : in  STD_LOGIC;
           rst_in : in  STD_LOGIC;
			  pb_data_tick : in STD_LOGIC;
			  decimation_factor : in  STD_LOGIC_VECTOR (1 downto 0);
           pb_data_in : in  std_logic_vector (ADC_BIT_WIDTH-1 downto 0);
           decimated_data_out : out  std_logic_vector (ADC_BIT_WIDTH-1 downto 0);
			  decimated_data_valid : out std_logic
			  );
end adc_data_decimator;

architecture Behavioral of adc_data_decimator is

signal deci_cnt : std_logic_vector (1 downto 0);
signal pb_data_tick_d : std_logic := '0';
signal deci_t : std_logic := '0';
signal decimated_data_valid_reg : std_logic := '0';

begin

process (clk_in,rst_in)
begin
if (rst_in = '1') then 
		decimated_data_valid_reg <= '0';
elsif rising_edge (clk_in) then	
		case decimation_factor is
		
			when "00" => decimated_data_valid_reg <= pb_data_tick_d;
			when "01" => decimated_data_valid_reg <= (deci_t and pb_data_tick_d);
			when "10" => if(deci_cnt = "00")then
								decimated_data_valid_reg <= pb_data_tick_d;
							 else 
								decimated_data_valid_reg <= '0';
							 end if;
			when others => decimated_data_valid_reg <= '0';
		end case;
	end if;
end process;	

process (clk_in,rst_in)
begin
	if (rst_in = '1') then 
		
		deci_cnt <= (others => '1');
		pb_data_tick_d <= '0';
		deci_t <= '0';
		decimated_data_out <= (others => '0');
		decimated_data_valid <= '0';
	elsif (rising_edge (clk_in)) then 
	
		pb_data_tick_d <= pb_data_tick;
		decimated_data_out <= pb_data_in;
	   decimated_data_valid <= decimated_data_valid_reg ;
		if (decimation_factor = "01") then 
			if (pb_data_tick = '1') then 
				deci_t <= not deci_t;
			end if;
		elsif (decimation_factor = "10") then  	
			if (pb_data_tick = '1') then
				deci_cnt <= deci_cnt + '1';
			end if;
		end if;		
	end if;
end process; 

end Behavioral;

