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

entity Muliplier_Block is 
	 	            generic(
	                 INPUT_BIT_WIDTH_MULT         : integer     := 16;
	                 OUTPUT_BIT_WIDTH_MULT        : integer     := 32
		            );
				Port (	
						mul_global_clk 		    : IN  STD_LOGIC;
						mul_module_rst			: IN  STD_LOGIC;
						mul_Data_present 		: IN  STD_LOGIC;
						mul_sinA_term 			: in std_logic_vector(INPUT_BIT_WIDTH_MULT-1 DOWNTO 0);						
				 		mul_cosB_term			: in std_logic_vector(INPUT_BIT_WIDTH_MULT-1 DOWNTO 0);
						mul_cosA_term 			: in std_logic_vector(INPUT_BIT_WIDTH_MULT-1 DOWNTO 0);
						mul_sinB_term 			: in std_logic_vector(INPUT_BIT_WIDTH_MULT-1 DOWNTO 0);
						mul_data_out  	  		: out std_logic_vector(OUTPUT_BIT_WIDTH_MULT-1 DOWNTO 0);
						mul_data_tick_out		: out std_logic
													
						);	

end Muliplier_Block;


architecture Behavioral of Muliplier_Block is


TYPE state_type is (
							IDLE_STATE,
							MULTIPLICATION_STATE
							);	

SIGNAL PROCESS_BLK_STATES  : state_type;

SIGNAL pi_temp : std_logic_vector(31 DOWNTO 0) := (others=>'0');
SIGNAL mult_sineA_cosB : std_logic_vector(31 DOWNTO 0) := (others=>'0');
SIGNAL mult_sineB_cosA : std_logic_vector(31 DOWNTO 0) := (others=>'0');
SIGNAL RISING_present_clr 		: STD_LOGIC;
SIGNAL RISING_present 		: STD_LOGIC;

BEGIN
-- Multiplication Data Assignment --
--mul_data_out <= pi_temp(31 downto 16);
mul_data_out <= pi_temp(OUTPUT_BIT_WIDTH_MULT-1 downto 0);
							
PROCESS (mul_global_clk)
BEGIN
     IF RISING_EDGE(mul_global_clk) then
		IF ( mul_module_rst = '1') THEN
			mult_sineA_cosB <= (others => '0');
       else
		    mult_sineA_cosB <= (mul_sinA_term * mul_cosB_term);
       end if;
	 end if;				
end process;

PROCESS (mul_global_clk)
BEGIN
     IF RISING_EDGE(mul_global_clk) then
		IF ( mul_module_rst = '1') THEN
			mult_sineB_cosA <= (others => '0');
       else
		    mult_sineB_cosA <= (mul_cosA_term * mul_sinB_term);
       end if;
	 end if;				
end process;							
							
PROCESS (mul_global_clk)
BEGIN

      IF RISING_EDGE(mul_global_clk) then
				IF ( mul_module_rst = '1') THEN

					RISING_present_clr <= '0';
					pi_temp <= (others => '0');
					mul_data_tick_out <= '0';
					PROCESS_BLK_STATES  <= IDLE_STATE;

				ELSE

					CASE PROCESS_BLK_STATES is
					 
						WHEN IDLE_STATE =>
						
						   mul_data_tick_out <= '0';
							
							IF(RISING_present = '1') THEN
							   RISING_present_clr <= '1';
								mul_data_tick_out <= '1';
								PROCESS_BLK_STATES  <= MULTIPLICATION_STATE;
							END IF;	
						
						WHEN MULTIPLICATION_STATE 	=>
						   
							RISING_present_clr <= '0';
							pi_temp <= mult_sineA_cosB + mult_sineB_cosA;
							mul_data_tick_out <= '1';
							PROCESS_BLK_STATES  <= IDLE_STATE;

						WHEN OTHERS => Null;						
					END CASE;
				END IF;
      END IF;
END PROCESS;

process (mul_global_clk,mul_module_rst)
begin
	if (mul_module_rst = '1') then 
	  RISING_present <= '0';
	  
	elsif (rising_edge(mul_global_clk)) then 
	   
		if (RISING_present_clr = '1') then 
		   RISING_present <= '0';
		elsif (mul_Data_present = '1') then 
			RISING_present <= '1';
		end if;
   end if;
end process;	



end Behavioral;