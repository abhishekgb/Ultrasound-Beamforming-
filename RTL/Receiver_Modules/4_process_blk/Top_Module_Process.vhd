----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:04 05/22/2013 
-- Design Name: 
-- Module Name:    Top_Module_Process - Process_Behav 
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
use IEEE.std_logic_signed.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with std_logic_vector or Unstd_logic_vector values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity Module_Process_Block_CH is

	generic(
	INPUT_BIT_WIDTH         : integer     := 16;
	OUTPUT_BIT_WIDTH        : integer     := 32
		);
		
			 Port (	
							CLK_400MHZ 				: IN  STD_LOGIC;
							Module_RST				: IN  STD_LOGIC;
							Data_present 			: IN  STD_LOGIC;
--							FIFO_RD_enable1		: out STD_LOGIC;
--							FIFO_empty_ch1			: in  std_logic;
							FP_IN						: IN  STD_LOGIC_VECTOR(7 downto 0);
							PR_CH_NO                :   in std_logic_vector(2 downto 0);
							PB_DATA_IN				: IN  std_logic_vector(11 DOWNTO 0);
							PB_DATA_OUT				: OUT  std_logic_vector(OUTPUT_BIT_WIDTH-1 DOWNTO 0);
							PB_data_tick_out 		: OUT  STD_LOGIC

						);
end Module_Process_Block_CH;

architecture Process_Behav of Module_Process_Block_CH is

SIGNAL SINA_TERM       :    std_logic_vector(INPUT_BIT_WIDTH-1 downto 0);
SIGNAL SINB_TERM       :    std_logic_vector(INPUT_BIT_WIDTH-1 downto 0);
SIGNAL COSA_TERM       :    std_logic_vector(INPUT_BIT_WIDTH-1 downto 0);
SIGNAL COSB_TERM       :    std_logic_vector(INPUT_BIT_WIDTH-1 downto 0);
SIGNAL SINACOSB       :    std_logic_vector(OUTPUT_BIT_WIDTH-1 downto 0);
SIGNAL COSASINB       :    std_logic_vector(OUTPUT_BIT_WIDTH-1 downto 0);
SIGNAL DATA_READY      :    STD_LOGIC:= '0';

COMPONENT multiplier_block
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

BEGIN

--process (CLK_400MHZ,Module_RST)
--
--begin
	
--	if(Module_RST = '1' OR FIFO_empty_ch1 ='1') then
--			FIFO_RD_enable1 <= '0';
--	elsif RISING_EDGE(CLK_400MHZ) then
--			FIFO_RD_enable1 <= '1';
--	end if;
--end process;


--	Multiplier_Process : entity work.Muliplier_Block 
--	    generic map (
--		             INPUT_BIT_WIDTH_MULT    => INPUT_BIT_WIDTH ,
--		             OUTPUT_BIT_WIDTH_MULT   => OUTPUT_BIT_WIDTH
--					)
--		PORT MAP (	
--						mul_global_clk 			=> CLK_400MHZ,
--						mul_module_rst			=> Module_RST,
--						mul_Data_present 		=> DATA_READY,
--						mul_sinA_term 			=> SINA_TERM,							
--						mul_cosB_term			=> COSB_TERM,
--						mul_cosA_term 			=> COSA_TERM,
--						mul_sinB_term 			=> SINB_TERM,
--						mul_data_out  	  		=> PB_DATA_OUT,
--						mul_data_tick_out		=> PB_data_tick_out
--													
--						);

	 parallel_shift_Process : entity work.Module_parallel_shift
	    generic map (
		             INPUT_BIT_WIDTH_SHIFT    => INPUT_BIT_WIDTH,
		             OUTPUT_BIT_WIDTH_SHIFT   => OUTPUT_BIT_WIDTH
					)	 
		PORT MAP(	
						shift_global_clk 		=> CLK_400MHZ,
						shift_module_rst		=> Module_RST,	
						shift_data_ready 		=> Data_present,
						shift_data_registers	=> DATA_READY,
						shift_data_in			=> PB_DATA_IN,
						shift_data_cosA_out		=> COSA_TERM,
						shift_data_sinA_out		=> SINA_TERM
						);
						
	DELAY_RD : entity work.DELAY_Read 
		    generic map (
		             INPUT_BIT_WIDTH_DELAY    => INPUT_BIT_WIDTH ,
		             OUTPUT_BIT_WIDTH_DELAY   => OUTPUT_BIT_WIDTH
					)	
		PORT MAP(	
		
						PR_DELAY_Global_clk		=> CLK_400MHZ,
						PR_DELAY_Module_rst		=> Module_RST,
						PR_DELAY_data_ready		=> Data_present,
						PR_DELAY_FOCUL_PT		=> FP_IN,
						PR_CH_NO				=> PR_CH_NO,
						PR_DELAY_Data_sine   	=> SINB_TERM,
						PR_DELAY_Data_cosine 	=> COSB_TERM
		
					);			

multiplier_processA : multiplier_block
  PORT MAP (
    clk => CLK_400MHZ,
    a => SINA_TERM,
    b => COSB_TERM,
    p => SINACOSB
  );	

multiplier_processB : multiplier_block
  PORT MAP (
    clk => CLK_400MHZ,
    a => COSA_TERM,
    b => SINB_TERM,
    p => COSASINB
  );  
  
  PB_DATA_OUT <= SINACOSB + COSASINB;
  PB_data_tick_out <= DATA_READY;

end Process_Behav;

