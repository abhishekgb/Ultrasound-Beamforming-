library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.ALL;
use work.Receiver_constants.all;
use IEEE.NUMERIC_STD.ALL;

entity DELAY_Read is
	 		       generic(
	                 INPUT_BIT_WIDTH_DELAY         : integer     := 16;
	                 OUTPUT_BIT_WIDTH_DELAY        : integer     := 32
		            );
					Port ( 
								PR_DELAY_Global_clk : IN  STD_LOGIC;
								PR_DELAY_Module_rst : IN  STD_LOGIC;
								PR_DELAY_data_ready : IN  STD_LOGIC;
								PR_DELAY_FOCUL_PT   : IN  STD_LOGIC_VECTOR(7 downto 0);
								PR_CH_NO            : IN  STD_LOGIC_VECTOR(2 downto 0);
								PR_DELAY_Data_sine  : OUT std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0);	
								PR_DELAY_Data_cosine: OUT std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0)
							);
end DELAY_Read;

Architecture Behav of DELAY_Read is

signal PR_DELAY_Data_sine_CH18  : std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');	
signal PR_DELAY_Data_cosine_CH18: std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');
signal PR_DELAY_Data_sine_CH27  : std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');
signal PR_DELAY_Data_cosine_CH27: std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');
signal PR_DELAY_Data_sine_CH36  : std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');
signal PR_DELAY_Data_cosine_CH36: std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');
signal PR_DELAY_Data_sine_CH45  : std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');
signal PR_DELAY_Data_cosine_CH45: std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');
signal PR_DELAY_Data_sine_reg   : std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');
signal PR_DELAY_Data_cosine_reg : std_logic_vector(INPUT_BIT_WIDTH_DELAY-1 DOWNTO 0) := (others => '0');  

begin

------------- PROCESS FOR CHANNEL 1 AND 8 -----------------
   process (pr_delay_global_clk,pr_delay_module_rst)
  begin 
	if ( pr_delay_module_rst = '1') then		
		PR_DELAY_Data_sine_CH18	<= (others => '0');
		PR_DELAY_Data_cosine_CH18 <= (others => '0');		
	elsif (rising_edge(pr_delay_global_clk)) then
	   if PR_CH_NO = "000" or PR_CH_NO = "111" then 
		   	PR_DELAY_Data_sine_CH18   <= CH1_SINE;
				PR_DELAY_Data_cosine_CH18 <= CH1_COSINE;
		end if;
	end if;	
end process;

------------- PROCESS FOR CHANNEL 2 AND 7 -----------------
 process (pr_delay_global_clk,pr_delay_module_rst)
 begin 
	if ( pr_delay_module_rst = '1') then		
		PR_DELAY_Data_sine_CH27	<= (others => '0');
		PR_DELAY_Data_cosine_CH27 <= (others => '0');		
	elsif (rising_edge(pr_delay_global_clk)) then
	   if PR_CH_NO = "001" or PR_CH_NO = "110" then 
		   	case PR_DELAY_FOCUL_PT(3 downto 0) is
					
					when "0000" => -- FP 1 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP1_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP1_COSINE;
					when "0001" => -- FP 2 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP2_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP2_COSINE;
					when "0010" => -- FP 3 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP3_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP3_COSINE;
					when "0011" => -- FP 4 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP4_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP4_COSINE;
					when "0100" => -- FP 5 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP5_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP5_COSINE;
					when "0101" => -- FP 6 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP6_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP6_COSINE;
					when "0110" => -- FP 7 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP7_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP7_COSINE;
					when "0111" => -- FP 8 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP8_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP8_COSINE;
					when "1000" => -- FP 9 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP9_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP9_COSINE;
					when "1001" => -- FP 10 --
								PR_DELAY_Data_sine_CH27   <= CH2_FP10_SINE;
								PR_DELAY_Data_cosine_CH27 <= CH2_FP10_COSINE;					
					when others => Null;	
				end case;
		end if;
	end if;	
end process;

------------- PROCESS FOR CHANNEL 3 AND 6 -----------------
 process (pr_delay_global_clk,pr_delay_module_rst)
 begin 
	if ( pr_delay_module_rst = '1') then
		
		PR_DELAY_Data_sine_CH36	<= (others => '0');
		PR_DELAY_Data_cosine_CH36 <= (others => '0');
		
	elsif (rising_edge(pr_delay_global_clk)) then
	   if PR_CH_NO = "010" or PR_CH_NO = "101" then 
         case PR_DELAY_FOCUL_PT(3 downto 0) is
					
					when "0000" => -- FP 1 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP1_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP1_COSINE;
					when "0001" => -- FP 2 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP2_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP2_COSINE;
					when "0010" => -- FP 3 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP3_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP3_COSINE;
					when "0011" => -- FP 4 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP4_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP4_COSINE;
					when "0100" => -- FP 5 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP5_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP5_COSINE;
					when "0101" => -- FP 6 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP6_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP6_COSINE;
					when "0110" => -- FP 7 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP7_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP7_COSINE;
					when "0111" => -- FP 8 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP8_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP8_COSINE;
					when "1000" => -- FP 9 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP9_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP9_COSINE;
					when "1001" => -- FP 10 --
								PR_DELAY_Data_sine_CH36   <= CH3_FP10_SINE;
								PR_DELAY_Data_cosine_CH36 <= CH3_FP10_COSINE;					
					when others => Null;	
				end case;
		end if;
	end if;	
end process;

------------- PROCESS FOR CHANNEL 4 AND 5 -----------------
 process (pr_delay_global_clk,pr_delay_module_rst)
 begin 
	if ( pr_delay_module_rst = '1') then
		
		PR_DELAY_Data_sine_CH45	<= (others => '0');
		PR_DELAY_Data_cosine_CH45 <= (others => '0');
		
	elsif (rising_edge(pr_delay_global_clk)) then
	   if PR_CH_NO = "011" or PR_CH_NO = "100" then 
	       case PR_DELAY_FOCUL_PT(3 downto 0) is
					
					when "0000" => -- FP 1 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP1_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP1_COSINE;
					when "0001" => -- FP 2 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP2_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP2_COSINE;
					when "0010" => -- FP 3 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP3_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP3_COSINE;
					when "0011" => -- FP 4 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP4_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP4_COSINE;
					when "0100" => -- FP 5 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP5_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP5_COSINE;
					when "0101" => -- FP 6 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP6_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP6_COSINE;
					when "0110" => -- FP 7 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP7_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP7_COSINE;
					when "0111" => -- FP 8 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP8_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP8_COSINE;
					when "1000" => -- FP 9 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP9_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP9_COSINE;
					when "1001" => -- FP 10 --
								PR_DELAY_Data_sine_CH45   <= CH4_FP10_SINE;
								PR_DELAY_Data_cosine_CH45 <= CH4_FP10_COSINE;					
					when others => Null;	
				end case;
		end if;
	end if;	
end process;


 process (pr_delay_global_clk,pr_delay_module_rst)
 begin 
	if ( pr_delay_module_rst = '1') then
		
		PR_DELAY_Data_sine_reg	<= (others => '0');
		PR_DELAY_Data_cosine_reg <= (others => '0');
		
	elsif (rising_edge(pr_delay_global_clk)) then
	 case  PR_CH_NO is
	   when  "000" | "111" => 
	     PR_DELAY_Data_sine_reg   <=  PR_DELAY_Data_sine_CH18   ;
	     PR_DELAY_Data_cosine_reg <=  PR_DELAY_Data_cosine_CH18 ;
	  when  "001" | "110" => 
	     PR_DELAY_Data_sine_reg   <=  PR_DELAY_Data_sine_CH27   ;
	     PR_DELAY_Data_cosine_reg <=  PR_DELAY_Data_cosine_CH27 ;
	  when  "010" | "101" => 
	     PR_DELAY_Data_sine_reg   <=  PR_DELAY_Data_sine_CH36   ;
	     PR_DELAY_Data_cosine_reg <=  PR_DELAY_Data_cosine_CH36 ;
	  when  "011" | "100" => 
	     PR_DELAY_Data_sine_reg   <=  PR_DELAY_Data_sine_CH45   ;
	     PR_DELAY_Data_cosine_reg <=  PR_DELAY_Data_cosine_CH45	 ; 
	  when others => null ;
	end case;
	end if;
 end process;
	
PR_DELAY_Data_sine   <= 	PR_DELAY_Data_sine_reg   ;
PR_DELAY_Data_cosine <= 	PR_DELAY_Data_cosine_reg ; 	 

end Behav;