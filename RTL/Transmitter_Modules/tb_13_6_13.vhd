--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:17:37 06/13/2013
-- Design Name:   
-- Module Name:   E:/xilinx working folder/ubf/ultrabeamformer/tb_13_6_13.vhd
-- Project Name:  ultrabeamformer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Beamformer_TOP
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_13_6_13 IS
END tb_13_6_13;
 
ARCHITECTURE behavior OF tb_13_6_13 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Beamformer_TOP
    PORT(
         CLK_100Mhz : IN  std_logic;
        -- SYSTEM_RST : IN  std_logic;
         ENABLE1_1 : OUT  std_logic;
         ENABLE1_2 : OUT  std_logic;
         ENABLE1_3 : OUT  std_logic;
         ENABLE1_4 : OUT  std_logic;
         ENABLE1_5 : OUT  std_logic;
         ENABLE1_6 : OUT  std_logic;
         SYNC : OUT  std_logic;
         FPGA_sWR : OUT  std_logic;
         FPGA_sLE : OUT  std_logic;
         FPGA_sCLK : OUT  std_logic;
         FPGA_sRD : OUT  std_logic;
         TX_EN : OUT  std_logic;
  --       FOCUL_POINT_IN : IN  std_logic;
--         DYANAMIC_SIG : IN  std_logic;
--         POWER_OFF_SEQ : IN  std_logic;
         CLEAR_ALL : OUT  std_logic;
         CLK_5MHZ : OUT  std_logic;
         Dout_IC_1 : IN  std_logic;
         Dout_IC_2 : IN  std_logic;
         Dout_IC_3 : IN  std_logic;
         Dout_IC_4 : IN  std_logic;
         LE_IC_1 : OUT  std_logic;
         LE_IC_2 : OUT  std_logic;
         LE_IC_3 : OUT  std_logic;
         LE_IC_4 : OUT  std_logic;
         Din_IC_1 : OUT  std_logic;
         Din_IC_2 : OUT  std_logic;
         Din_IC_3 : OUT  std_logic;
         Din_IC_4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_100Mhz : std_logic := '0';
   signal SYSTEM_RST : std_logic := '0';
   signal FOCUL_POINT_IN : std_logic := '0';
   signal DYANAMIC_SIG : std_logic := '0';
   signal POWER_OFF_SEQ : std_logic := '0';
   signal Dout_IC_1 : std_logic := '0';
   signal Dout_IC_2 : std_logic := '0';
   signal Dout_IC_3 : std_logic := '0';
   signal Dout_IC_4 : std_logic := '0';

 	--Outputs
   signal ENABLE1_1 : std_logic;
   signal ENABLE1_2 : std_logic;
   signal ENABLE1_3 : std_logic;
   signal ENABLE1_4 : std_logic;
   signal ENABLE1_5 : std_logic;
   signal ENABLE1_6 : std_logic;
   signal SYNC : std_logic;
   signal FPGA_sWR : std_logic;
   signal FPGA_sLE : std_logic;
   signal FPGA_sCLK : std_logic;
   signal FPGA_sRD : std_logic;
   signal TX_EN : std_logic;
   signal CLEAR_ALL : std_logic;
   signal CLK_5MHZ : std_logic;
   signal LE_IC_1 : std_logic;
   signal LE_IC_2 : std_logic;
   signal LE_IC_3 : std_logic;
   signal LE_IC_4 : std_logic;
   signal Din_IC_1 : std_logic;
   signal Din_IC_2 : std_logic;
   signal Din_IC_3 : std_logic;
   signal Din_IC_4 : std_logic;

   -- Clock period definitions
   constant CLK_100Mhz_period : time := 10 ns;
   constant FPGA_sCLK_period : time := 10 ns;
   constant CLK_5MHZ_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Beamformer_TOP PORT MAP (
          CLK_100Mhz => CLK_100Mhz,
--          SYSTEM_RST => SYSTEM_RST,
          ENABLE1_1 => ENABLE1_1,
          ENABLE1_2 => ENABLE1_2,
          ENABLE1_3 => ENABLE1_3,
          ENABLE1_4 => ENABLE1_4,
          ENABLE1_5 => ENABLE1_5,
          ENABLE1_6 => ENABLE1_6,
          SYNC => SYNC,
          FPGA_sWR => FPGA_sWR,
          FPGA_sLE => FPGA_sLE,
          FPGA_sCLK => FPGA_sCLK,
          FPGA_sRD => FPGA_sRD,
          TX_EN => TX_EN,
 --         FOCUL_POINT_IN => FOCUL_POINT_IN,
   --       DYANAMIC_SIG => DYANAMIC_SIG,
       --   POWER_OFF_SEQ => POWER_OFF_SEQ,
          CLEAR_ALL => CLEAR_ALL,
          CLK_5MHZ => CLK_5MHZ,
          Dout_IC_1 => Dout_IC_1,
          Dout_IC_2 => Dout_IC_2,
          Dout_IC_3 => Dout_IC_3,
          Dout_IC_4 => Dout_IC_4,
          LE_IC_1 => LE_IC_1,
          LE_IC_2 => LE_IC_2,
          LE_IC_3 => LE_IC_3,
          LE_IC_4 => LE_IC_4,
          Din_IC_1 => Din_IC_1,
          Din_IC_2 => Din_IC_2,
          Din_IC_3 => Din_IC_3,
          Din_IC_4 => Din_IC_4
        );

   -- Clock process definitions
   CLK_100Mhz_process :process
   begin
		CLK_100Mhz <= '0';
		wait for CLK_100Mhz_period/2;
		CLK_100Mhz <= '1';
		wait for CLK_100Mhz_period/2;
   end process;
-- 
--   FPGA_sCLK_process :process
--   begin
--		FPGA_sCLK <= '0';
--		wait for FPGA_sCLK_period/2;
--		FPGA_sCLK <= '1';
--		wait for FPGA_sCLK_period/2;
--   end process;
-- 
--   CLK_5MHZ_process :process
--   begin
--		CLK_5MHZ <= '0';
--		wait for CLK_5MHZ_period/2;
--		CLK_5MHZ <= '1';
--		wait for CLK_5MHZ_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
--		SYSTEM_RST <= '1';
--		wait for 500 ns;
--		SYSTEM_RST <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 900 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		

--------------------------------------------

		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 320 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 320 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 330 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 320 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 320 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 320 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 320 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 320 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 320 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';		

--------------------------------------------

wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
--------------------------------------------

wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 500 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
		wait for 20 us;
		DYANAMIC_SIG <= '1';
		wait for 5000 ns;
		DYANAMIC_SIG <= '0';
		
      wait for 20 us ;
		POWER_OFF_SEQ <= '1';
		wait for 500 ns;
		POWER_OFF_SEQ <= '0';
		wait for 20 ms;
   end process;
END;
