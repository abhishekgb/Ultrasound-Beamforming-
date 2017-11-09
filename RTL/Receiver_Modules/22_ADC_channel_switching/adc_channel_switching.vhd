library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity ADC_CHANNEL_SWITCH is
	generic(
	BIT_WIDTH         : integer     := 12
	--BEAM_NUMBER_WIDTH : integer     := 8
		);
	Port (  
			-- INPUTS
			--------------------------------------------
		CLK           : in  std_logic; 
		RESET_SYNC   : in  std_logic;
		VALID_IN      : in  std_logic;
		ADC_IN_CH1    : in  std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_IN_CH2    : in  std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_IN_CH3    : in  std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_IN_CH4    : in  std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_IN_CH5    : in  std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_IN_CH6    : in  std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_IN_CH7    : in  std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_IN_CH8    : in  std_logic_vector(BIT_WIDTH-1 downto 0);
		BEAM_NUMBER   : in  std_logic_vector(7 downto 0) ;
--		fifo_empty_ch1: in  std_logic;
			-- OUTPUTS
			--------------------------------------------
		VALID_OUT  : out std_logic;
		FIFO_RD_enable1	: out STD_LOGIC := '0';
		FIFO_RD_enable2	: out STD_LOGIC := '0';-- to remove fan out extra signal added
		FIFO_RD_enable3		: out STD_LOGIC;
		FIFO_RD_enable4      : out STD_LOGIC;
		FIFO_RD_enable5		: out STD_LOGIC;
		FIFO_RD_enable6      : out STD_LOGIC;
		FIFO_RD_enable7      : out STD_LOGIC;
		FIFO_RD_enable8      : out STD_LOGIC;
		ADC_OUT_CH1    : out std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_OUT_CH2    : out std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_OUT_CH3    : out std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_OUT_CH4    : out std_logic_vector(BIT_WIDTH-1 downto 0); 
		ADC_OUT_CH5    : out std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_OUT_CH6    : out std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_OUT_CH7    : out std_logic_vector(BIT_WIDTH-1 downto 0);
		ADC_OUT_CH8    : out std_logic_vector(BIT_WIDTH-1 downto 0)
			);     
end ADC_CHANNEL_SWITCH; 

architecture RTL of ADC_CHANNEL_SWITCH is
type CHANNEL_ARRAY is array (0 to 7) of std_logic_vector(BIT_WIDTH-1 downto 0); 
signal VALID_OUT_REG      	: std_logic := '0';
signal VALID_OUT_REG1					: std_logic := '0';
signal VALID_OUT_REG2      			: std_logic := '0';
signal ADC_IN_CH_REG      : CHANNEL_ARRAY := (others => (others => '0'));
signal ADC_OUT_CH_REG     : CHANNEL_ARRAY := (others => (others => '0'));
signal sig_FIFO_RD_enable1     : std_logic := '0';
signal sig_FIFO_RD_enable2     : std_logic := '0';
signal sig_FIFO_RD_enable3     : std_logic := '0';
signal sig_FIFO_RD_enable4     : std_logic := '0';
signal sig_FIFO_RD_enable5     : std_logic := '0';
signal sig_FIFO_RD_enable6     : std_logic := '0';
signal sig_FIFO_RD_enable7     : std_logic := '0';
signal sig_FIFO_RD_enable8     : std_logic := '0';


begin

--process (CLK)
--begin
--	if RISING_EDGE(CLK) then
--		if  FIFO_empty_ch1 ='1' then
--			sig_FIFO_RD_enable1 	<= '0';
--			sig_FIFO_RD_enable2 	<= '0';
--			sig_FIFO_RD_enable3	<= '0';
--			sig_FIFO_RD_enable4  <= '0';
--			sig_FIFO_RD_enable5	<= '0';
--			sig_FIFO_RD_enable6  <= '0';
--			sig_FIFO_RD_enable7  <= '0';
--         sig_FIFO_RD_enable8  <= '0';
----			FIFO_RD_enable1 	<= '0';
----			FIFO_RD_enable2 	<= '0';
----			FIFO_RD_enable3	<= '0';
----			FIFO_RD_enable4   <= '0';
----			FIFO_RD_enable5	<= '0';
----			FIFO_RD_enable6   <= '0';
----			FIFO_RD_enable7   <= '0';
----         FIFO_RD_enable8   <= '0';
--			
--		else	
--			sig_FIFO_RD_enable1 	<= '1';
--			sig_FIFO_RD_enable2 	<= '1';
--			sig_FIFO_RD_enable3	<= '1';
--			sig_FIFO_RD_enable4  <= '1';
--			sig_FIFO_RD_enable5	<= '1';
--			sig_FIFO_RD_enable6  <= '1';
--			sig_FIFO_RD_enable7  <= '1';
--         sig_FIFO_RD_enable8  <= '1';
--		
--		end if;
--	end if;
--end process;

--process (CLK)
--begin
--	if RISING_EDGE(CLK) then
--	      FIFO_RD_enable1 	<= sig_FIFO_RD_enable1 ;	
--			FIFO_RD_enable2	<= sig_FIFO_RD_enable2 ;
--			FIFO_RD_enable3	<= sig_FIFO_RD_enable3 ;	
--			FIFO_RD_enable4   <= sig_FIFO_RD_enable4 ;
--			FIFO_RD_enable5	<= sig_FIFO_RD_enable5 ;	
--			FIFO_RD_enable6   <= sig_FIFO_RD_enable6 ;
--			FIFO_RD_enable7   <= sig_FIFO_RD_enable7 ;
--			FIFO_RD_enable8   <= sig_FIFO_RD_enable8 ;
--end if;
--end process;
			
process (CLK)
begin
if RESET_SYNC = '1' then 
	ADC_in_CH_REG   <=  (others => (others => '0'));
elsif RISING_EDGE(CLK) then
ADC_IN_CH_REG(0)    <=   ADC_IN_CH1  ;
ADC_IN_CH_REG(1)    <=   ADC_IN_CH2  ;
ADC_IN_CH_REG(2)    <=   ADC_IN_CH3  ;
ADC_IN_CH_REG(3)    <=   ADC_IN_CH4  ;
ADC_IN_CH_REG(4)    <=   ADC_IN_CH5  ;
ADC_IN_CH_REG(5)    <=   ADC_IN_CH6  ;
ADC_IN_CH_REG(6)    <=   ADC_IN_CH7  ;
ADC_IN_CH_REG(7)    <=   ADC_IN_CH8  ;
end if;
end process;

CHANNEL_SWITCH     : process (CLK, RESET_SYNC)
begin
	if RESET_SYNC = '1' then 
		VALID_OUT_REG <= '0';
--		VALID_OUT_REG1 <= '0';
--		VALID_OUT_REG2 <= '0';
		ADC_OUT_CH_REG   <=  (others => (others => '0'));  --  8 | 16 | 24 | 32 | 40 | 48 | 56 | 64 | 72 | 80 | 88 | 96 | 104 | 112 | 120
	elsif rising_edge (CLK) then 
		if VALID_IN = '1' then 
		VALID_OUT_REG <= '1';   
			case BEAM_NUMBER is  -- SHIFTING RIGHT AT EVERY CLOCK CYCLE
				when  x"01" | x"09" | x"11" | x"19" | x"21" | x"29" | x"31" | x"39" | x"41" | x"49" | x"51" | x"59" | x"61" | x"69" | x"71" | x"79" | x"81" 	=>  	ADC_OUT_CH_REG          <=  ADC_IN_CH_REG ;  -- 1ST CHANNEL 
			
			   when  x"02" | x"0A" | x"12" | x"1A" |  x"22" |  x"2A" |  x"32" |  x"3A" |  x"42" | x"4A" |  x"52" |  x"5A" |  x"62" |  x"6A" |  x"72"   		=> 	ADC_OUT_CH_REG(0)       <=  ADC_IN_CH_REG(7) ; -- FOR  2ND CHANNEL 1 SHIFT
																																																					ADC_OUT_CH_REG(1 to 7 ) <=  ADC_IN_CH_REG(0 to 6) ;
																																																					
				when x"03" | x"0B" | x"13" | x"1B" |  x"23" |  x"2B" |  x"33" |  x"3B" |  x"43" | x"4B" |  x"53" |  x"5B" |  x"63" |  x"6B" |  x"73" 			=> 	ADC_OUT_CH_REG(0 to 1 ) <=  ADC_IN_CH_REG(6 to 7 ) ;    -- FOR 3RD CHANNEL 2 SHIFT
																																																					ADC_OUT_CH_REG(2 to 7 ) <=  ADC_IN_CH_REG(0 to 5) ;
																																																					
				when  x"04" | x"0C" | x"14" | x"1C" |  x"24" |  x"2C" |  x"34" |  x"3C" |  x"44" | x"4C" |  x"54" |  x"5C" |  x"64" |  x"6C" |  x"74"      	=>    ADC_OUT_CH_REG(0 to 2 ) <=  ADC_IN_CH_REG(5 to 7 ) ; -- FOR 4TH CHANNEL 3 SHIFT
																																																					ADC_OUT_CH_REG(3 to 7 ) <=  ADC_IN_CH_REG(0 to 4) ;
																																																					
				when  x"05" | x"0D" | x"15" | x"1D" |  x"25" |  x"2D" |  x"35" |  x"3D" |  x"45" | x"4D" |  x"55" |  x"5D" |  x"65" |  x"6D" |  x"75"      	=>   	ADC_OUT_CH_REG(0 to 3 ) <=  ADC_IN_CH_REG(4 to 7 ) ; -- FOR 5TH CHANNEL 4 SHIFT
																																																					ADC_OUT_CH_REG(4 to 7 ) <=  ADC_IN_CH_REG(0 to 3) ;
																																																					
				when  x"06" | x"0E" | x"16" | x"1E" |  x"26" |  x"2E" |  x"36" |  x"3E" |  x"46" | x"4E" |  x"56" |  x"5E" |  x"66" |  x"6E" |  x"76"        =>   	ADC_OUT_CH_REG(0 to 4 ) <=  ADC_IN_CH_REG(3 to 7) ; -- FOR 6TH CHANNEL 5 SHIFT
																																																					ADC_OUT_CH_REG(5 to 7 ) <=  ADC_IN_CH_REG(0 to 2) ;
																																																					
				when  x"07" | x"0F" | x"17" | x"1F" |  x"27" |  x"2F" |  x"37" |  x"3F" |  x"47" | x"4F" |  x"57" |  x"5F" |  x"67" |  x"6F" |  x"77"        =>  	ADC_OUT_CH_REG(0 to 5 ) <=  ADC_IN_CH_REG(2 to 7 ) ; -- FOR 7TH CHANNEL 7 SHIFT
																																																					ADC_OUT_CH_REG(6 to 7 ) <=  ADC_IN_CH_REG(0 to 1) ;
																																																					
				when  x"08" | x"10" | x"18" | x"20" |  x"28" |  x"30" |  x"38" |  x"40" |  x"48" | x"50" |  x"58" |  x"60" |  x"68" |  x"70" |  x"78"       	=>   	ADC_OUT_CH_REG(0 to 6 ) <=  ADC_IN_CH_REG(1 to 7 ) ; -- FOR 8TH CHANNEL 7 SHIFT
																																																					ADC_OUT_CH_REG(7)       <=  ADC_IN_CH_REG(0) ;   
				when others => null ;
			end case;
		else 
			VALID_OUT_REG <= '0';
		end if;   
	end if;
end process;
 
process (CLK)
begin
		if RESET_SYNC = '1' then 
			VALID_OUT_REG1 <= '0';
			VALID_OUT_REG2 <= '0';
		elsif RISING_EDGE(CLK) then
			VALID_OUT_REG1 <= 	VALID_OUT_REG;
			VALID_OUT_REG2	<= 	VALID_OUT_REG1;
			VALID_OUT      <=    VALID_OUT_REG ; 
			ADC_OUT_CH1    <=    ADC_OUT_CH_REG(0) ;
			ADC_OUT_CH2    <=    ADC_OUT_CH_REG(1) ;
			ADC_OUT_CH3    <=    ADC_OUT_CH_REG(2) ;
			ADC_OUT_CH4    <=    ADC_OUT_CH_REG(3) ;
			ADC_OUT_CH5    <=    ADC_OUT_CH_REG(4) ;
			ADC_OUT_CH6    <=    ADC_OUT_CH_REG(5) ;
			ADC_OUT_CH7    <=    ADC_OUT_CH_REG(6) ;
			ADC_OUT_CH8    <=    ADC_OUT_CH_REG(7) ;
		end if;
end process;
end RTL;