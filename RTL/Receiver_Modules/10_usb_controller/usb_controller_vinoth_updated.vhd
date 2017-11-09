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
								usb_data_out     		: out std_logic_vector(15 downto 0)
					);

end usb_controller;


architecture Behavioral of usb_controller is
type states is (
--       flagb_wait,
--		 flagb_wait1,
		 idle_state,
		 wait_state,
--		 header_state,
		 write_state
--		 footer_state
		 );
signal usb_state :states;

signal hf_tick_latch : std_logic;
signal hf_tick_latch_clr : std_logic;
signal ins_header : std_logic:='0';
signal usb_fifo_data_valid_d : std_logic;
signal beam_cnt : std_logic_vector (6 downto 0);
signal fr_cnt : std_logic_vector ( 2 downto 0);
signal cnt : std_logic_vector (15 downto 0);
signal cnt2 : std_logic_vector (15 downto 0);
signal flagb1 : std_logic;
signal flagb2 : std_logic;
signal usb_fifo_rd_en_s : std_logic;
signal usb_fifo_rd_en_d:std_logic;
signal config_done : std_logic;
signal usb_start_d1 : std_logic;
signal usb_start_d2 : std_logic;
signal usb_start_d3 : std_logic;
signal up_dn : std_logic;
signal sig_slwr_i : std_logic;
signal start_flag : std_logic;
signal count : std_logic_vector (15 downto 0);
signal usb_data_out_s : std_logic_vector(15 downto 0):=(others => '0');
signal end_pt_cnt : std_logic_vector (11 downto 0):= (others => '0'); 
constant HEADER_SIG : std_logic_vector(15 downto 0):= X"A0A0";
constant FOOTER_SIG1 : std_logic_vector(15 downto 0):= X"5051";
constant FOOTER_SIG2 : std_logic_vector(15 downto 0):= X"5052";
constant FOOTER_SIG3 : std_logic_vector(15 downto 0):= X"5053";
constant FOOTER_SIG4 : std_logic_vector(15 downto 0):= X"5054";
constant FOOTER_SIG5 : std_logic_vector(15 downto 0):= X"5055";


begin

fddr_i <= "10";
--slwr_i <= sig_slwr_i;


usb_fifo_rd_en <= usb_fifo_rd_en_s AND (not flagb); -- For Simulation
--usb_fifo_rd_en <= usb_fifo_rd_en_s and (not usb_fifo_rd_en_d);-- and (not flagb); -- For Board Testing
--usb_data_outt <= usb_data_out;
--usb_data_outt_1<= usb_data_out;
process(usb_48_MHZ,g_reset)
 begin 
	IF (g_reset = '1') THEN
		config_done <= '0';
		usb_start_d1 <= '0';
		usb_start_d2 <= '0';
		usb_start_d3 <= '0';
	elsif (RISING_EDGE(usb_48_MHZ)) then
		
		usb_start_d1 <= usb_start;
		usb_start_d2 <= usb_start_d1;
		usb_start_d3 <= usb_start_d2;
		--if (usb_start_d2 = '1' and usb_start_d3 = '0') then 
			config_done <= usb_start_d2; --'1';
		--end if;
	end if;
end process;
	
process(usb_48_MHZ,g_reset)
--variable count : std_logic_vector (15 downto 0);
 begin 
	IF (g_reset = '1') THEN
	
		sloe_i <= '1';
		slrd_i <='1';
		slwr_i <= '1';
		ins_header <= '0';
		usb_data_out <= (others => '0'); --X"A2A2"; --
		usb_data_out_1 <= (others => '0'); --X"A2A2"; --
		beam_cnt <= "0000000";
		hf_tick_latch_clr <= '0';
		usb_fifo_rd_en_s <= '0';
		fr_cnt <= (others => '0');
		cnt <= (others => '0');
		cnt2 <= (others => '0');
		count <= (others => '0');
		up_dn <= '0';
		start_flag <= '0';
		usb_data_out_s <= (others => 'Z');
		usb_state <=   idle_state; -- flagb_wait; --
---------preserve it-----------------------------		
	elsif (falling_EDGE(usb_48_MHZ)) then
--	
--
--		case usb_state is 
--			
----			when flagb_wait =>
--			
----				
----				if (usb_fifo_empty = '0' and flagb = '0') then 
----				 sig_slwr_i <= '0';
----				 usb_fifo_rd_en_s <= '1';
----				else
----				 usb_fifo_rd_en_s <= '0';
----				 sig_slwr_i <= '1';
----				end if;
----				usb_data_out <= usb_data_in;
----				usb_state <=   flagb_wait;
----				
----			when flagb_wait1 => 
----			
----				if (usb_start = '1' and flagb = '0') then 
----					sig_slwr_i <= '0';
----					usb_data_out <= count;
----					count <= count - X"2E";					
----					if (count = X"0000") then 
----					 count <= X"0000";
----					 usb_state <= flagb_wait; 
----					end if;
----				else
----				 sig_slwr_i <= '1';
----				end if;
----				
--			
--			when idle_state =>
--				
--				sloe_i <= '1';
--				slrd_i <= '1';
--				sig_slwr_i <= '1';
--				usb_data_out <= (others => 'Z');
--				usb_data_out_1 <= (others => 'Z');
--				if (usb_fifo_empty = '0' and flagb = '0') then 
--					usb_fifo_rd_en_s <= '1';
--					if (ins_header = '0') then
--					 sig_slwr_i <= '0'; 
--					 usb_data_out <= HEADER_SIG;
--					 usb_data_out_1 <= HEADER_SIG;
--					 usb_state <= header_state;
--					
--					else
--					 usb_state <= write_state;					
--					end if;	
--				end if;
--          
--			when header_state =>
--				-- Insert the Beam count --
--				ins_header <= '1';
--				
--				-- Roll over beam count once in 120d --
--				if (beam_cnt = X"79") then				-- beam no is 121
--					beam_cnt <= "0000001";
--				else
--					beam_cnt <= beam_cnt + '1';
--				end if;	
--				sig_slwr_i <= '1';
--				usb_state <= write_state;
--				
--			when write_state =>
--				
--				
--				-- When USB Slave FIFO is not Full and SRAM/USB FIFO is not empty -- 
--				--if (flagb = '0' and usb_fifo_empty = '0') then -- for Simulation --
--				if (flagb = '0' and usb_fifo_empty = '0') then -- for Board testing --
--					
--					
--					if (hf_tick_latch = '1') then 
--						usb_fifo_rd_en_s <= '0';
--					else
--						usb_fifo_rd_en_s <= '1';
--					end if;	
--					
--					if( hf_tick_latch = '1')then -- Insert Footer, at the end of 1 Beam data --
--						usb_data_out <= FOOTER_SIG1;
--						usb_data_out_1 <= FOOTER_SIG1;
--						hf_tick_latch_clr <= '1';
--						usb_state <= footer_state;
--				   -- Write SRAM Sample Data, till USB slave FIFO is full --		
--					elsif (usb_fifo_data_valid = '1') then 
--						sig_slwr_i <= '0';
--						usb_data_out <= usb_data_in;
--						usb_data_out_1 <= usb_data_in;
--					end if;
--				else -- Slave FIFO is Full or SRAM/USB FIFO is empty --
--					--sig_slwr_i <= '1';
--					usb_data_out <= usb_data_in;
--					usb_data_out_1 <= usb_data_in;
----					sig_slwr_i <= '1';
--					usb_fifo_rd_en_s <= '0';
--					usb_state <= idle_state;
--				end if;	
--				
--			when footer_state =>
--				
--				-- Insert the remaining 4 footer data --
--				fr_cnt <= fr_cnt + '1';
--				hf_tick_latch_clr <= '0';
--				
--				case fr_cnt is
--					when "000" =>usb_data_out <= X"00" & ('0' & beam_cnt);-- usb_Beam_no_in;
--					            
--					when "001" => usb_data_out <= FOOTER_SIG3;
--								   
--					when "010" => usb_data_out <= FOOTER_SIG4;
--					           
--					when "011" => usb_data_out <= FOOTER_SIG5;
--					            
--					when "100" => fr_cnt <= (others => '0');
--									 sig_slwr_i <= '1';
--									 ins_header <= '0';
--									 usb_state <= idle_state;
--					when others => sig_slwr_i <= '1';
--										usb_state <= idle_state;
--				end case;
--				
--				case fr_cnt is
--					when "000" =>usb_data_out_1 <= X"00" & ('0' & beam_cnt);-- usb_Beam_no_in;
--					            
--					when "001" => usb_data_out_1 <= FOOTER_SIG3;
--								   
--					when "010" => usb_data_out_1 <= FOOTER_SIG4;
--					           
--					when "011" => usb_data_out_1 <= FOOTER_SIG5;
--					            
--					when "100" => fr_cnt <= (others => '0');
--					              sig_slwr_i <= '1';
--									 ins_header <= '0';
--									 usb_state <= idle_state;
--					when others => sig_slwr_i <= '1';
--										usb_state <= idle_state;
--				end case;
--				
--			when others => usb_state <= idle_state;
--		end case;
-- 	end if;
--end process;
--
--process(usb_48_MHZ,g_reset)
-- begin 
--	if (g_reset = '1') THEN
--		usb_fifo_data_valid_d <= '0';
--		flagb1 <= '0';
--		flagb2 <= '0';
--	elsif (RISING_EDGE(usb_48_MHZ)) then
--		usb_fifo_data_valid_d <= usb_fifo_data_valid;
--		flagb1 <= flagb;
--		flagb2 <= flagb1;
--	end if;
--end process;
--
--process (gclk,g_reset,hf_tick_latch_clr)
--begin
--	if (g_reset = '1' or hf_tick_latch_clr = '1') then 
--		hf_tick_latch <= '0';
--	elsif (falling_edge(gclk)) then 
--		
--		if (header_footer_tick = '1') then 
--			hf_tick_latch <= '1';
--		end if;
--		
--	end if;
--end process;
--


--
--end Behavioral;

---------------------------------------------------------------------------------------------------------------------
--to checking only incremental data
-------------------------------------------------------------------------------------------------------------------------
case usb_state is 
			
			when idle_state =>
				
				sloe_i <= '1';-- not changing always out
				slrd_i <= '1';-- always out no read
				slwr_i <= '1';
				
				if (usb_fifo_empty = '0' and flagb = '0')then-- and end_pt_cnt = x"000" ) then 
					usb_state <= write_state;

					start_flag <= '1';
					
				end if;	
		
			when wait_state =>
			
--					sig_slwr_i <= '0';
					
					usb_state <= write_state;
					
			when write_state =>

				-- When USB Slave FIFO is not Full and SRAM/USB FIFO is not empty -- 
				if ( flagb = '0' and end_pt_cnt < x"201" and usb_fifo_data_valid = '1' ) then -- 
				      usb_data_out <= usb_data_in;
						slwr_i <= '0';
				else -- Slave FIFO is Full or SRAM/USB FIFO is empty --
						usb_state <= idle_state;
				end if;
				if ( flagb = '0' and end_pt_cnt < x"201" and usb_fifo_empty = '0') then
						usb_fifo_rd_en_s <= '1';
				else 
					usb_fifo_rd_en_s <= '0';
				end if;	
			when others => usb_state <= idle_state;
		end case;
 	end if;
end process;

--process (gclk,g_reset,usb_fifo_rd_en_s)
--begin
--if (g_reset = '1') then 
---- usb_fifo_rd_en_s <= '0';
--usb_fifo_rd_en_d <= '0';
--elsif (rising_edge(gclk)) then 
--usb_fifo_rd_en_d <= usb_fifo_rd_en_s;
--end if;
--end process;

process(usb_48_MHZ,g_reset)
	begin
		IF rising_EDGE(usb_48_MHZ) then
			if(g_reset = '1') THEN
				end_pt_cnt <= x"001";
--				sig_slwr_i <= '1';
			else
----				usb_data_out <= usb_data_out_s;
				if (usb_fifo_empty = '0' and end_pt_cnt = x"200" and flagb = '0') then
--					sig_slwr_i <= '1';
					end_pt_cnt<= (others => '0');
				elsif	(start_flag = '1' and end_pt_cnt < x"201" and flagb = '0') then
--					sig_slwr_i <= '0';
					end_pt_cnt <= end_pt_cnt + '1';
--				else
--					sig_slwr_i <= '1';
				end if;	
			end if;
		end if;
end process;	

end Behavioral;
