----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:44:59 06/03/2013 
-- Design Name: 
-- Module Name:    top_module_sample - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sram_interface is
 Port (   clk_in          : in  std_logic; -- Global 200 MHz clock input --
			 rst_in			  : in  std_logic; -- Global Active High POR reset input --	
			-- SRAM Interface --
 			 --sram_clk_out    : out std_logic; -- SRAM 200 MHz clock out --
          mode            : out std_logic;
          addr            : out std_logic_vector(18 downto 0); 
          adv_n           : out std_logic;			 
          adsp_n          : out std_logic;                                
          adsc_n          : out std_logic;                                
          ce_n            : out std_logic;                                
          ce2             : out std_logic;                                
          ce2_n           : out std_logic;                                
          bwa_n           : out std_logic;                                
          bwb_n           : out std_logic;  
          bwc_n           : out std_logic;                                
          bwd_n           : out std_logic;			 
          oe_n            : out std_logic;                                
          global_wr_n     : out std_logic;                                
          bwe_n           : out std_logic;                                
          zz              : out std_logic; 
			 DQ              : inout std_logic_vector(17 downto 0);
			 
			-- Schedular Interface --
			 wr_en				 : in  std_logic;			 
			 rd_en				 : in  std_logic;
			 wr_done				 : out std_logic;
			 rd_done				 : out std_logic;
			 sram_addrs_in     : in  std_logic_vector(18 downto 0);
			 sram_wr_data_in   : in  std_logic_vector(15 downto 0);
			 sram_rd_data_out  : out std_logic_vector(17 downto 0);
			 sram_rd_data_valid: out std_logic
			);
end sram_interface;

architecture Behavioral of sram_interface is

signal oe_n1_sig :std_logic;
signal sram_wr_data : std_logic_vector (17 downto 0);
signal sram_addrs_out  : std_logic_vector(18 downto 0);

component sram_cntlr
port(
         s_fifo_clk      : in  std_logic;
         s_fifo_rst      : in  std_logic;
         
			-- Schedular Interface --
			wr_en           : in std_logic;
		   rd_en           : in std_logic;
		   wr_done	       : out std_logic;
		   rd_done	       : out std_logic;
			rd_data_valid   : out std_logic;
			sram_addrs_in   : in  std_logic_vector(18 downto 0);
			sram_wr_data_in : in  std_logic_vector(15 downto 0);
			
			-- SRAM interface --
         adv_n           : out std_logic;			 
         adsp_n          : out std_logic;                                
         adsc_n          : out std_logic;                                
         ce_n            : out std_logic;                                
         ce2             : out std_logic;                                
         ce2_n           : out std_logic;                                
         bwa_n           : out std_logic;                                
         bwb_n           : out std_logic; 
         bwc_n           : out std_logic;                                
         bwd_n           : out std_logic;			 
         oe_n            : out std_logic;                                
         global_wr_n     : out std_logic;                                
         bwe_n           : out std_logic;                                
         zz              : out std_logic;                                
         mode            : out std_logic;
			sram_addrs_out  : out std_logic_vector(18 downto 0);
			sram_wr_data    : out std_logic_vector(17 downto 0)
	  ); 
  end component;


  begin 
  
 oe_n <= oe_n1_sig;
 
 DQ <= sram_wr_data when oe_n1_sig = '1' else (others => 'Z'); -- For Write
 sram_rd_data_out <= DQ when oe_n1_sig = '0' else (others => 'Z'); -- For Read
 --sram_wr_data_out <= sram_wr_data;
 addr <= sram_addrs_out;
 


i1 :sram_cntlr

port map(
	 s_fifo_clk => clk_in,     
	 s_fifo_rst => rst_in,      
	 -- Schedular Interface --
	 wr_en => wr_en,           
	 rd_en => rd_en,          
	 wr_done	=> wr_done,       
	 rd_done	=> rd_done,       
	 rd_data_valid  => sram_rd_data_valid, 
	 sram_addrs_in  => sram_addrs_in, -- Need to  check the delay in integrated code n remove -- 
	 sram_wr_data_in => sram_wr_data_in, -- Need to  check the delay in integrated code n remove --
	 
	 -- SRAM interface --
	 adv_n            => adv_n,         
	 adsp_n           => adsp_n,        
	 adsc_n           => adsc_n,       
	 ce_n             => ce_n,          
	 ce2              => ce2,           
	 ce2_n            => ce2_n,         
	 bwa_n            => bwa_n,         
	 bwb_n            => bwb_n,         
    bwc_n            => bwc_n,         
    bwd_n            => bwd_n,         
    oe_n             => oe_n1_sig,
    global_wr_n      => global_wr_n,   
    bwe_n            => bwe_n,                           
    zz               => zz,            
    mode             => mode,          
    sram_addrs_out   => sram_addrs_out,
    sram_wr_data     => sram_wr_data  
	 );
	 
 end Behavioral;