----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:39 07/25/2013 
-- Design Name: 
-- Module Name:    SRAM_Schedular_mod - Behavioral 
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
library ieee;                                                                   
use ieee.std_logic_1164.all;                                                    
use ieee.std_logic_arith.all;                                                   
use ieee.std_logic_unsigned.all;

entity SRAM_Schedular is
				Port ( 
							glb_clk                		: in std_logic;
							g_reset                 	: in std_logic;
							ADC_ready						: in std_logic;
							Wr_done							: in std_logic;
							Rd_done							: in std_logic;
							usb_fifo_full					: in std_logic;
							--usb_fifo_empty             : in std_logic;
							--sram_fifo_empty				: in std_logic;
							write_int						: in std_logic;
							sram_fifo_full					: in std_logic;
							decimation_factor				: in std_logic_vector (1 downto 0);
							sram_wr_data_rd_en			: out std_logic;
							Wr_en								: out std_logic;
							Rd_en								: out std_logic;
							SRAM_full						: out std_logic;
							SRAM_empty						: out std_logic;
							footer_tick						: out std_logic;
							SRAM_Addr_R_W					: out std_logic_vector(18 downto 0)
						);
end SRAM_Schedular;

architecture Behavioral of SRAM_Schedular is

signal init 					: std_logic := '0';
signal delayed_ADC_ready 	: std_logic := '0';
signal delayed_USB_data_tick 	: std_logic := '0';
signal wr_flag	 				: std_logic := '0';-- WR_EN
signal rd_flag	 				: std_logic := '0';--RD_EN
signal Ping_A	 				: std_logic := '0';
signal Pong_B	 				: std_logic := '0';
signal SR_empty	 			: std_logic := '0';
signal SR_full	 				: std_logic := '0';
signal ADC_ready_latch_clr	: std_logic := '0';
signal ADC_ready_latch	 	: std_logic := '0';
signal write_addr				: std_logic_vector(18 downto 0):=(others => '0');
signal read_addr				: std_logic_vector(18 downto 0):= "000"& x"0000";--(others => '0');
signal Diff_counter			: std_logic_vector(18 downto 0):=(others => '0');
signal footer_cnt          : std_logic_vector(11 downto 0):=(others => '0');
signal footer_end				: std_logic_vector(11 downto 0):=(others => '0');
signal sram_wr_cnt			: std_logic_vector(2 downto 0):=(others => '0');
signal data_rd_en_s			: std_logic;
signal usb_fifo_empty_tik  : std_logic;
signal 	write_stop         :std_logic:= '0';
signal   read_stop         :std_logic:= '1';
signal 	read_sig         :std_logic:= '0';
signal 	emerg_write          :std_logic;
signal   flag_writeread_sram         :std_logic:= '0';
signal   flag_readwrite_sram         :std_logic:= '0';
signal read_cnt   :std_logic_vector(1 downto 0):= "00";
signal write_cnt   :std_logic_vector(1 downto 0):= "00";
					
--signal sram_wr_data_rd_en1 : std_logic;
signal rd_skip : std_logic := '0';
signal rd_cnt : std_logic_vector (1 downto 0):=(others => '0');

TYPE FSM_state IS (
                     Idle_state,
							dummy_state_1,
							dummy_state_2,
							wr_wait,
							Writing_state,
							Reading_state
					    );
SIGNAL schedular_states : FSM_state;				

begin


Wr_en	<= write_int;-- wr_flag;
Rd_en <= rd_flag;
SRAM_full	<= SR_full;
SRAM_empty	<= SR_empty;
--sram_wr_data_rd_en <= data_rd_en_s;

--PROCESS (glb_clk)
--		BEGIN
--			IF RISING_EDGE(glb_clk) then
--					IF (g_reset = '1') THEN
--						SRAM_Addr_R_W <= (others => '0');						
--					ELSE
--						if( wr_flag = '1') then
--							SRAM_Addr_R_W	<= write_addr;
--						end if;
--						
--						if(rd_flag = '1') then	
--							SRAM_Addr_R_W	<= read_addr;
--						end if;
--					end if;
--				end if;
--end process;					

	PROCESS (glb_clk)
		BEGIN
			IF rising_edge(glb_clk) then 
				IF (g_reset = '1') THEN
					init <= '0';
					wr_flag	 			<= '0';
					rd_flag	 			<= '0';
					data_rd_en_s <= '0';
					ADC_ready_latch_clr <= '0';
					SRAM_Addr_R_W <= (others => '0');
					sram_wr_cnt <= (others => '0');
					rd_cnt <= (others => '0');
					rd_skip <= '0';
					schedular_states  <= Idle_state;
				
				ELSE
					CASE schedular_states is
		
						WHEN Idle_state	 =>
											
							wr_flag <= '0';	 			
							rd_flag <= '0';
							data_rd_en_s <= '0';
							emerg_write <= '0';
						--if (sram_fifo_full = '1') then 	
							-- When SRAM is full or no ADC start acquisition, perform only SRAM read --
							if ((write_stop = '1' and read_stop = '0' and SR_empty = '0' and   sram_fifo_full = '0')or  (SR_full  = '1' ))  then
							
							if(usb_fifo_full = '0' ) then
							   rd_flag <= '1';
								SRAM_Addr_R_W	<= read_addr;
								schedular_states <= Reading_state;
							elsif(SR_full  = '0' and ADC_ready = '1') then
								emerg_write <= '1';
								wr_flag <= '1';	
								ADC_ready_latch_clr <= '1'; -- clearing the input data latch
--								wr_flag <= '1';
								data_rd_en_s <= '1';
								SRAM_Addr_R_W	<= write_addr;
--								data_rd_en_s <= '1';
								schedular_states <= wr_wait;
							else
								schedular_states <= Idle_state;
								end if;
								
							-- When SRAM is not full & SRAM FIFO is not empty, perform SRAM Write --
							elsif ((ADC_ready = '1' and write_stop = '0'   and  SR_full  = '0')or sram_fifo_full = '1')  then -- Write Data available --
--								if(write_int = '1') then
--						
									wr_flag <= '1';	
								ADC_ready_latch_clr <= '1'; -- clearing the input data latch
--								wr_flag <= '1';
								data_rd_en_s <= '1';
								SRAM_Addr_R_W	<= write_addr;
--								data_rd_en_s <= '1';
								schedular_states <= wr_wait;
--						
								
							else 		
								schedular_states <= Idle_state;
							end if;
						--else
						--	schedular_states <= Idle_state;
						--end if;	
						
						when wr_wait =>
						
--							data_rd_en_s <= '1';
							wr_flag <= '0';
							
							ADC_ready_latch_clr <= '0';
							schedular_states <= Writing_state;
							--schedular_states <= Writing_state;
							
--							if (rd_cnt = "10") then 
--								rd_skip <= '0';
--							end if;	
						when dummy_state_1 =>
--						if(write_int = '1') then
--						
----							wr_flag <= '1';	
							schedular_states <= dummy_state_2;
--						else 
--							schedular_states <= dummy_state_1;
--						end if;	
						when dummy_state_2 =>
							wr_flag <= '0';	
							
							schedular_states <= Writing_state;		

						
						WHEN Writing_state =>
--									
							if (sram_wr_cnt = "010") then 
							 data_rd_en_s <= '0';
							elsif (data_rd_en_s = '1') then 
							 sram_wr_cnt <= sram_wr_cnt + '1';
							end if; 
							
							-- When 4Words are written into SRAM, check for SRAM read --
							if (wr_done = '1') then 
								sram_wr_cnt <= (others => '0');
									
							
									rd_flag <= '0';
									emerg_write <= '0';
									schedular_states <= Idle_state;
--					
							end if;
			
						WHEN Reading_state =>
									
							rd_flag <= '0';


							if (rd_done = '1') then
								rd_cnt <= rd_cnt + '1';
							
									schedular_states <= Idle_state;
--								end if;
							end if;	
						
						WHEN others =>
							schedular_states <= Idle_state;					
							
					END CASE	;
				END IF;
			END IF;
	END PROCESS;
	
-------------------------------------------------------------------------------
--Read and Write Process 
------------------------------------------------------------------------------
	PROCESS(glb_clk)
		begin
         IF rising_edge(glb_clk) then
				IF (g_reset = '1') THEN
					write_addr 			<= (others => '0');
					read_addr 			<= "000"& x"0000";--(others => '0');
					Ping_A	 			<= '0';
					Pong_B	 			<= '0';
					SR_empty	 			<= '0';
					SR_full	 			<= '0';
					Diff_counter      <= (others => '0');	
					write_stop        <=         '0';
					read_stop        <=         '1';
					write_cnt        <= "00";
					read_cnt        <= "00";
					flag_readwrite_sram <= '0';
					flag_writeread_sram <= '0';
				ELSE
-------------------------------------------------------------------------------
--checking the conditons for Empty and Full
------------------------------------------------------------------------------
				-- free running counter addressing until 3FFF location of B bank 	
					--if( write_addr <= ("00"& '1' & x"ffff"))then
						if (wr_flag = '1')then	
							Diff_counter <= Diff_counter + "100";
						elsif(rd_flag = '1') then
							Diff_counter <= Diff_counter - "100";
						end if;	
				--	end if;
					
				-- comparison logic for checking empty and full --	
				if (write_addr - read_addr > "000"& x"0004" )then	
					flag_writeread_sram <= '0';
				else
					flag_writeread_sram <= '1';
				end if;	
				
				if (read_addr - write_addr > "000"& x"0004" )then	
					flag_readwrite_sram <= '0';
				else
					flag_readwrite_sram <= '1';
				end if;
				
				if(flag_readwrite_sram = '1' AND flag_writeread_sram = '1') then
					if (Diff_counter = "000"& x"0000") then
							SR_empty <= '1';
							SR_full <= '0';
					elsif (Diff_counter > "110"& x"FFFC") then		
							SR_empty <= '0';
							SR_full <= '1';
					else
							SR_empty <= '0';
							SR_full <= '0';
					end if;
				end if;	
					
--					if (Diff_counter < x"1F") then
--							SR_empty <= '0';
--							SR_full  <= '1';
--					elsif	(Diff_counter > x"3FFB") then
--							SR_empty <= '1';
--							SR_full  <= '0';
--					else
--							SR_empty <= '0';
--							SR_full  <= '0';
--					end if;		
				
-------------------------------------------------------------------------------
--Writing 
------------------------------------------------------------------------------
	
					-- When 1 Burst Wr is done, inc the address for next Burst Wr --
					if (wr_flag = '1' )  then --and read_stop = '1') or (wr_done = '1' and emerg_write = '1')
						-- Check for address roll over and inc addess --
						if(write_cnt = "11") then
						   
                    write_cnt <= "00";
						  write_stop <= '1';
							read_stop <= '0';
						else
                     write_cnt <= write_cnt + 1;
                  end if;
						
						if (write_addr = ("110" & x"fffc")) then 
   						write_addr <= (others => '0');
--                     write_stop <= '1';
--							read_stop <= '0';

						-- No address roll over and SRAM is not full --	
						else 
						
--						    write_stop <= '0';
							write_addr <= write_addr + "0100";
						end if;	
					end if;
					
--					if( write_addr > "000" & x"7FB") then
--							Ping_A <= '0';
--							Pong_B <= '1';
--					else
--							Ping_A <= '1';
--							Pong_B <= '0';
--					end if;
				 
								
-------------------------------------------------------------------------------
--Reading 
------------------------------------------------------------------------------

					-- When 1 Burst Rd is done, inc the address for next Burst Rd --
					
					if (rd_flag = '1' ) then --and  write_stop = '1' and read_stop = '0'
						-- Check for address roll over and inc addess --
						if(read_cnt = "01") then
						 read_stop <= '1';
 						 write_stop <= '0';
						 read_cnt <= "00";
						else
                     read_cnt <= read_cnt + 1;
                  end if;
						
						
						if (read_addr = ("110" & x"fffc")) then 
						        
							read_addr <= "000"& x"0000";
--							read_stop <= '1';
--							write_stop <= '0';
						-- No address roll over and SRAM is not empty --	
						else --if (SR_empty = '0') then 
							read_addr <= read_addr + "0100";
						end if;	
					end if; 
						
--						if( read_addr > "000" & x"1FFF") then
--								Ping_A <= '0';
--								Pong_B <= '1';
--						else
--								Ping_A <= '1';
--								Pong_B <= '0';
--						end if;		
						
				
				END IF;	
			END IF;
	END PROCESS;
	
-------------------------------------------------------------------------------
-- Footer Tick generation --
------------------------------------------------------------------------------
PROCESS(glb_clk)
	begin
		IF rising_edge(glb_clk) then
			sram_wr_data_rd_en <= data_rd_en_s;
			--Wr_en	<= wr_flag;
			IF (g_reset = '1') THEN
				footer_tick <= '0';
				footer_cnt <= (others => '0');
			elsif (footer_cnt = footer_end) then 
				footer_tick <= '1';
				footer_cnt <= (others => '0');
			elsif (rd_done = '1') then 
				footer_cnt <= footer_cnt + '1';
			else
				footer_tick <= '0';
			end if;
		end if;
end process;

footer_end <= X"776" when g_reset = '1' else -- POR Default to Dec by 2 --changed from X"905" to X"776"
				  X"3BB" when decimation_factor = "01" else --Dec By 2 --changed from X"905" to X"776"
				  X"3BB"; --Dec By 4 --changed from X"482" to X"388"
				  

	
-------------------------------------------------------------------------------
--Edge detection Processes
------------------------------------------------------------------------------
PROCESS(glb_clk)
		begin
         IF rising_edge(glb_clk) then
				
				IF (g_reset = '1') THEN
					ADC_ready_latch <= '0';
					delayed_ADC_ready<= '0';
					--sram_wr_data_rd_en1 <= '0';
					--sram_wr_data_rd_en <= '0';
				else
					delayed_ADC_ready <= ADC_ready;
					--sram_wr_data_rd_en1 <= data_rd_en_s;	
					--sram_wr_data_rd_en <= sram_wr_data_rd_en1;
					
					
					if (ADC_ready_latch_clr = '1') then 
					  ADC_ready_latch <= '0';
					elsif (ADC_ready = '1') then -- and delayed_ADC_ready = '0') then 
						ADC_ready_latch <= '1';  
					end if;
					
				END IF;	
			END IF;
	END PROCESS;

--Process (glb_clk)
--     begin
--         IF rising_edge(glb_clk) then
--			IF (g_reset = '1') THEN
--			usb_fifo_empty_tik <= '1';
--			--usb_full_tick <= '0';
--			else
--			if(usb_fifo_empty = '1') then
--			usb_fifo_empty_tik <= '1';
--			elsif(usb_fifo_full= '1') then
--			usb_fifo_empty_tik <= '0';
--			end if;
--			end if;
--			end if;
--end process;			
--			

end Behavioral;