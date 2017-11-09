--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:47:20 07/31/2013
-- Design Name:   
-- Module Name:   D:/Ultrasound_Beamformer/Sayed/26_July/Process_Block_Mod_30_July/process_blk/decimator_tb.vhd
-- Project Name:  process_blk
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sram_data_decimator
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decimator_tb IS
END decimator_tb;
 
ARCHITECTURE behavior OF decimator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sram_data_decimator
    PORT(
         clk_in : IN  std_logic;
         rst_in : IN  std_logic;
         sram_data_valid : IN  std_logic;
         decimation_factor : IN  std_logic_vector(1 downto 0);
         sram_data_in : IN  std_logic_vector(15 downto 0);
         decimated_data_out : OUT  std_logic_vector(15 downto 0);
         decimated_data_valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal rst_in : std_logic := '0';
   signal sram_data_valid : std_logic := '0';
   signal decimation_factor : std_logic_vector(1 downto 0) := (others => '0');
   signal sram_data_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal decimated_data_out : std_logic_vector(15 downto 0);
   signal decimated_data_valid : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 2.5 ns;
	
	signal cnt : std_logic_vector (2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sram_data_decimator PORT MAP (
          clk_in => clk_in,
          rst_in => rst_in,
          sram_data_valid => sram_data_valid,
          decimation_factor => decimation_factor,
          sram_data_in => sram_data_in,
          decimated_data_out => decimated_data_out,
          decimated_data_valid => decimated_data_valid
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 
decimation_factor <= "00", "01" after 1000 ns, "10" after 2000 ns;

   -- Stimulus process
   stim_proc: process
   begin		
      rst_in <= '1';
      wait for 100 ns;	
		rst_in <= '0';
      wait for clk_in_period*10;
      -- insert stimulus here 
		
		wait;
   end process;
	
	sram_data_valid <= cnt(2);
	
	process(clk_in,rst_in)
	begin
		if (rst_in = '1') then 
			sram_data_in <= (others => '0');
			cnt <= (others => '0');
		elsif (rising_edge(clk_in)) then 
			cnt <= cnt + '1';

			if (cnt(2) = '1') then 
				sram_data_in <= sram_data_in + '1';
			end if;
			
		end if;
	end process;

END;
