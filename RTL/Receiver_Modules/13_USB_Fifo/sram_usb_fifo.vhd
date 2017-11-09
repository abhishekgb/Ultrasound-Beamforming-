library ieee;                                                                   
use ieee.std_logic_1164.all;                                                    
use ieee.std_logic_arith.all;                                                   
use ieee.std_logic_unsigned.all;
Library UNISIM;
use UNISIM.vcomponents.all;

entity sram_usb_fifo is                                                            
  port ( wr_clk               	   : in std_logic; -- 200 Mhz
			rd_clk               	   : in std_logic; -- 48 Mhz
         g_reset                 	: in std_logic;
			fifo_wr_en						: in std_logic;
         fifo_data_in           		: in  std_logic_vector(15 downto 0);
			fifo_rd_en						: in std_logic;
			usb_fifo_full					: out std_logic;
			usb_fifo_empty					: out std_logic;
			fifo_data_out					: out std_logic_vector(15 downto 0);
			fifo_data_valid				: out std_logic	
       );  
end sram_usb_fifo;      
               
architecture behav of sram_usb_fifo is


COMPONENT usb_fifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
	 prog_full : OUT STD_LOGIC;
    valid : OUT STD_LOGIC
  );
END COMPONENT;
--signal usb_fifo_empty : std_logic;

Begin

-- USB FIFO to store the SRAM read data at 200 MHz --
-- USB FIFO will be read by USB controller at 48 MHz --
-- FIFO size : 1024x16 --
-- FIFO wr time = 24.32 us --
-- FIFO rd time = 21.33 us --

fifo_i : usb_fifo
  PORT MAP (
    rst => g_reset,
    wr_clk => wr_clk,
    rd_clk => rd_clk,
    din => fifo_data_in,
    wr_en => fifo_wr_en,
    rd_en => fifo_rd_en,
    dout => fifo_data_out,
    full => open,--usb_fifo_full,
	 prog_full => usb_fifo_full,
    valid => fifo_data_valid,
    empty => usb_fifo_empty

  );
end behav;