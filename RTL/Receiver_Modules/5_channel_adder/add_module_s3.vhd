----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:35:51 03/10/2014 
-- Design Name: 
-- Module Name:    add_module - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_module_stage3 is
    Port ( 
				clk_in		: in std_logic; 
				reset_in		: in std_logic;
				input1 		: in  STD_LOGIC_VECTOR (33 downto 0);
				input2 		: in  STD_LOGIC_VECTOR (33 downto 0);
				output_sum 	: out STD_LOGIC_VECTOR (34 downto 0);
				valid_in		: in std_logic;
				valid_out	: out std_logic;
				carry_in 	: in std_logic;
				carry_out 	: out std_logic
	 );
end add_module_stage3;

architecture Behavioral of add_module_stage3 is

signal temp_value : STD_LOGIC_VECTOR(34 downto 0);
signal valid_out_d : STD_LOGIC;
signal valid_out_d1 : STD_LOGIC;

COMPONENT adder3_core
  PORT (
    a : IN STD_LOGIC_VECTOR(33 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(33 DOWNTO 0);
    clk : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    ce : IN STD_LOGIC;
	 sclr : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(34 DOWNTO 0)
  );
END COMPONENT;


begin

Adder_instance : adder3_core
  PORT MAP (
					 a 	=> input1,
					 b 	=> input2,
					 clk 	=> clk_in,
					 c_in => carry_in,
					 ce 	=> valid_in,
					 sclr => reset_in,
					 s 	=> temp_value
					 );

valid_out <= valid_out_d1;
output_sum <= temp_value;   
carry_out  <= temp_value(34);

process (clk_in,reset_in)
	begin
		if rising_edge(clk_in) then
			if(reset_in = '1') then
				valid_out_d <= '0';
				valid_out_d1 <= '0';
			else
				valid_out_d <= valid_in;
				valid_out_d1 <= valid_out_d;
			end if;	
		end if;
end process;
		

--process(clk_in,reset_in)
--	begin
--		if rising_edge(clk_in) then
--			if(reset_in = '1') then
--				temp_value <= (others => '0');
--				valid_out <= '0';
--			else
--				if(valid_in = '1') then
--					temp_value <= input1 + input2 + carry_in; 
--					output_sum <= temp_value;   
--					carry_out  <= temp_value(16);
--					valid_out  <= '1';
--				else
--					valid_out <= '0';
--				end if;	
--			end if;
--		end if;
--end process;		
end Behavioral;

