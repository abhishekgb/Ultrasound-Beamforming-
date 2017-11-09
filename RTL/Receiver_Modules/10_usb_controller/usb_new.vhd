----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:13 07/30/2013 
-- Design Name: 
-- Module Name:    usb_controller - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity usb_controller is
			port(
							   gclk 	     					: in std_logic;
								usb_48_MHZ 					: in std_logic; 
								g_reset  					: in std_logic; 
					
								-- Scheduler interface --
								header_footer_tick  		: in std_logic;
								usb_fifo_empty		  		: in std_logic;
								usb_fifo_data_valid		: in std_logic;
								usb_data_in   				: in std_logic_vector(15 downto 0);
								usb_fifo_rd_en				: out std_logic;
								usb_Beam_no_in				: in std_logic_vector(7 downto 0);
								-- USB Controller Interface --
								usb_start					: in std_logic;
								flagb        				: in std_logic;
								flagc        				: in std_logic;
								sloe_i      				: out std_logic;  
								slrd_i       				: out std_logic;
								slwr_i       				: out std_logic;
								fddr_i         			: out std_logic_vector(1 downto 0);
								usb_data_out_1    		: out std_logic_vector(15 downto 0);
								usb_data_out     			: out std_logic_vector(15 downto 0);
								end_point_data_end		: in std_logic 
					);

end usb_controller;


architecture Behavioral of usb_controller is
type states is (
					 idle_state,
					 wait_state,
					 write_state
		 );
signal usb_state :states;

signal end_pt_cnt : std_logic_vector (11 downto 0):= (others => '0'); 
signal usb_data_out_s : std_logic_vector(15 downto 0);
signal usb_fifo_rd_en_s : std_logic;
signal sig_slwr_i : std_logic;

begin

fddr_i <= "10";
slwr_i <= sig_slwr_i;
sloe_i <= '1';
slrd_i <='1';

usb_fifo_rd_en <= usb_fifo_rd_en_s;-- AND (not flagb); -- For Simulation

process(usb_48_MHZ,usb_data_out_s,g_reset, usb_data_out_s)
	begin
		IF rising_EDGE(usb_48_MHZ) then
			if(g_reset = '1') THEN
				end_pt_cnt <= (others => '0');
				sig_slwr_i <= '1';
			else
				usb_data_out <= usb_data_out_s;
				if (end_pt_cnt < x"1FF" and flagb = '0') then
					sig_slwr_i <= '0';
					end_pt_cnt <= end_pt_cnt + '1'; 
				else	
					sig_slwr_i <= '1';
					end_pt_cnt<= (others => '0');
				end if;	
			end if;
		end if;
end process;		
	

	
process(gclk,g_reset)
 begin 
	IF Rising_EDGE(gclk) then
		if(g_reset = '1') THEN
		
--			sloe_i <= '1';
--			slrd_i <='1';
--			sig_slwr_i <= '1';
			usb_fifo_rd_en_s <= '0';
			
			usb_state <=   idle_state;
---------preserve it-----------------------------		
		else 
			case usb_state is 
			
			when idle_state =>
				
--				sloe_i <= '1';-- not changing always out
--				slrd_i <= '1';-- always out no read
--				sig_slwr_i <= '1';
				if (usb_fifo_empty = '0' and flagb = '0') then 
					usb_state <= write_state;
					usb_fifo_rd_en_s <= '1';
				end if;	
		
			when wait_state =>
			
					usb_state <= write_state;
					
			when write_state =>
			

				-- When USB Slave FIFO is not Full and SRAM/USB FIFO is not empty -- 
				if (flagb = '0' and usb_fifo_empty = '0') then 
				      usb_data_out_s <= usb_data_in;
--						sig_slwr_i <= '0';
				else -- Slave FIFO is Full or SRAM/USB FIFO is empty --
					usb_fifo_rd_en_s <= '0';
					usb_state <= idle_state;
				end if;
			
			when others => usb_state <= idle_state;
		end case;
		end if;
end if;	
	
end process;

end Behavioral;
