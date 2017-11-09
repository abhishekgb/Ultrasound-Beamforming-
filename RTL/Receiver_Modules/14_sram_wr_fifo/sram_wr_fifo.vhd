library ieee;                                                                   
use ieee.std_logic_1164.all;                                                    
use ieee.std_logic_arith.all;                                                   
use ieee.std_logic_unsigned.all;
Library UNISIM;
use UNISIM.vcomponents.all;

entity sram_wr_fifo is                                                            
  port ( glb_clk1               	   : in std_logic; -- 400 Mhz
			glb_clk2               	   : in std_logic; -- 200 Mhz 180 PS (FE)
         g_reset                 	: in std_logic;
			data_available					: in std_logic;
			rd_en								: in std_logic;
         data_in              		: in  std_logic_vector(15 downto 0);
			data_out							: out std_logic_vector(15 downto 0);
			adc_data_tick					: out std_logic;
         data_valid						: out std_logic;
			sram_fifo_full					: out std_logic;
			sram_fifo_empty				: out std_logic
       );  
end sram_wr_fifo; 


architecture behav of sram_wr_fifo is

signal adc_data_wr_cnt : std_logic_vector (1 downto 0) := "00";
--signal rd_en_d : std_logic := '0';
signal sram_fifo_full_s : std_logic := '0';
--signal init : std_logic := '0';
--signal wr_cnt,rd_cnt : std_logic_vector (11 downto 0);


TYPE state IS (
                     idle, 
							wr_wait,
							rd_wait
					    );
SIGNAL sm : state;

COMPONENT Sram_wr_data_fifo
   PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
	 --almost_full:OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC;
	 prog_empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC
  );
END COMPONENT;

signal adc_data_tick_s : std_logic;
signal adc_data_tick_d : std_logic;

begin

--adc_data_tick <= sram_fifo_full;-- <= adc_data_tick;

--adc_data_tick <= adc_data_tick_s and not(adc_data_tick_d);
  adc_data_tick <=  not(adc_data_tick_d);


i_fifo : Sram_wr_data_fifo
  PORT MAP (
    rst => g_reset,
    wr_clk => glb_clk1, -- RE 400 MHz --
    rd_clk => glb_clk2, -- FE 200 MHz or RE 200 MHz with PS 180 --
    din => data_in,
    wr_en => data_available,
    rd_en => rd_en,
    dout => data_out,
    full => open,--ram_fifo_full,
	  --almost_full => open,--sram_fifo_full,
    empty =>  sram_fifo_empty,
    valid => data_valid,
	 prog_empty=> adc_data_tick_d,
	 prog_full=> sram_fifo_full --adc_data_tick
	 
  );
  
--  process (glb_clk1,g_reset)
--  begin
--	if (g_reset = '1') then 
--		adc_data_wr_cnt <= (others => '0');
--		--wr_cnt <= (others => '0');
--		sm <= idle;
--	elsif (rising_edge(glb_clk1)) then 
--		case sm is
--		when idle => 
--				 
--				 if (data_available = '1') then 
--					sm <= wr_wait;
--				 end if;
--				 
--		 when wr_wait => 
--		 
--				 if (data_available = '1') then 
--					adc_data_wr_cnt <= adc_data_wr_cnt + '1';
--					--wr_cnt <= wr_cnt + '1';
--				 end if;
--				 
--				 if (sram_fifo_full_s = '1') then 
--					sm <= idle;
--				 end if;	
--				 
--		 when others => sm <= idle;
--		 end case;
--				 
--		end if;
--  end process; 	
  
--  process (glb_clk2,g_reset)
--  begin
--	if (g_reset = '1') then 
--		adc_data_tick_s <= '0';
--		adc_data_tick_d <= '0';
--	elsif (rising_edge(glb_clk2)) then 
--		
--		adc_data_tick_d <= adc_data_tick_s;
				
--		if (adc_data_wr_cnt = "11") then
--			adc_data_tick_s <= '1';
--		else
--			adc_data_tick_s <= '0';	
--		end if;

--	end if;
--  end process; 	
--    

    
  
  
end behav;