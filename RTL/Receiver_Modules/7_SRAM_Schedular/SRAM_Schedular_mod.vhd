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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SRAM_Schedular_mod is
				Port ( 
							glb_clk                		: in std_logic;
							g_reset                 	: in std_logic;
							ADC_ready						: in std_logic;
							Wr_done							: in std_logic;
							Rd_done							: in std_logic;
							sram_wr_data_rd_en			: out std_logic;
							Wr_en								: out std_logic;
							Rd_en								: out std_logic;
							USB_data_tick					: in std_logic;
							SRAM_full						: out std_logic;
							SRAM_empty						: out std_logic;
							SRAM_Addr_R_W					: out std_logic_vector(18 downto 0)
						);
end SRAM_Schedular_mod;

architecture Behavioral of SRAM_Schedular_mod is

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
signal USB_data_tick_latch_clr	: std_logic := '0';
signal ADC_ready_latch	 	: std_logic := '0';
signal USB_data_tick_latch	 	: std_logic := '0';
signal write_addr				: std_logic_vector(18 downto 0):=(others => '0');
signal read_addr				: std_logic_vector(18 downto 0):=(others => '0');
signal Diff_counter			: std_logic_vector(18 downto 0):=(others => '0');
signal init_counter			: std_logic_vector(1 downto 0);

TYPE FSM_state IS (
                     Idle_state, 
							Writing_state,
							Reading_state
					    );
SIGNAL schedular_states : FSM_state;				

begin


Wr_en	<= wr_flag;
Rd_en <= rd_flag;
SRAM_full	<= SR_full;
SRAM_empty	<= SR_empty;

PROCESS (glb_clk)
		BEGIN
			IF RISING_EDGE(glb_clk) then
					IF (g_reset = '1') THEN
						SRAM_Addr_R_W <= (others => '0');						
					ELSE
						if( wr_flag = '1') then
							SRAM_Addr_R_W	<= write_addr;
						end if;
						
						if(rd_flag = '1') then	
							SRAM_Addr_R_W	<= read_addr;
						end if;
					end if;
				end if;
end process;					

	PROCESS (glb_clk)
		BEGIN
			IF FALLING_EDGE(glb_clk) then -- i think it should be in falling edge as SRAM is working in falling edge --
					IF (g_reset = '1') THEN
						init <= '0';
						wr_flag	 			<= '0';
						rd_flag	 			<= '0';
						sram_wr_data_rd_en <= '0';
						ADC_ready_latch_clr <= '0';
						init_counter <= (others => '0');
						schedular_states  <= Idle_state;
							
					ELSE
							CASE schedular_states is

											WHEN Idle_state	 =>
																
														wr_flag <= '0';	 			
														rd_flag <= '0';
														sram_wr_data_rd_en <= '0';
														
														-- When SRAM is not full, perform SRAM Write --
														if (ADC_ready_latch = '1') then -- Write detection --
															ADC_ready_latch_clr <= '1'; -- clearing the input data latch
															
															-- When SRAM is full, perform only SRAM read on USB buffer avail --
															if (SR_full = '1') then
																if (USB_data_tick_latch = '1') then 
																 rd_flag <= '1';
																 schedular_states <= Reading_state;
																else -- when SRAM and USB FIFO is full, be idle 
																 schedular_states <= Idle_state;
																end if;	
														   else
															   wr_flag <= '1';
																schedular_states <= Writing_state;
															end if;	
														else 		
															schedular_states <= Idle_state;
														end if;	
											
										
											WHEN Writing_state =>
														
														wr_flag <= '0';
														ADC_ready_latch_clr <= '0';
														sram_wr_data_rd_en <= '1';
														
														-- When 4Words are written into SRAM, check for SRAM read --
														if (wr_done = '1') then 
														-- Allows SRAM read for first 2 cycles of Schedular Cycles --
														  if (init = '0') then 
														   rd_flag <= '1';
															sram_wr_data_rd_en <= '0';
															schedular_states <= Reading_state;
														-- When USB has read 4 words and SRAM is not empty, perfrom SRAM Read --
														  elsif (USB_data_tick_latch = '1' and SR_empty = '0') then 
															rd_flag <= '1';
															USB_data_tick_latch_clr <= '1';
															sram_wr_data_rd_en <= '0';
															schedular_states <= Reading_state;
														-- When USB FIFO is not empty, return to idle --
														  else
															rd_flag <= '0';
															sram_wr_data_rd_en <= '0';
															schedular_states <= Idle_state;
														  end if;	
														end if;

											WHEN Reading_state =>
														
														USB_data_tick_latch_clr <= '0';
														rd_flag <= '0';
														
														if (rd_done = '1') then 
														 -- First two read cycles are done, block SRAM read till USB ready latch --
															if (init_counter = "01") then 
																init <= '1';
															else
																init_counter <= init_counter + '1';
															end if;
															schedular_states <= Idle_state;
														end if;
											when others => 	schedular_states <= Idle_state;					
							END CASE	;
					END IF;
			END IF;
	END PROCESS;
	
-------------------------------------------------------------------------------
--Read and Write Process 
------------------------------------------------------------------------------
	PROCESS(glb_clk)
		begin
         IF RISING_EDGE(glb_clk) then
				IF (g_reset = '1') THEN
					write_addr 			<= (others => '0');
					read_addr 			<= (others => '0');
					Ping_A	 			<= '0';
					Pong_B	 			<= '0';
					SR_empty	 			<= '0';
					SR_full	 			<= '0';
					Diff_counter      <= (others => '0');	
					
				ELSE
-------------------------------------------------------------------------------
--checking the conditons for Empty and Full
------------------------------------------------------------------------------
				-- free running counter addressing until 3FFF location of B bank 	
					if( write_addr < "000"& x"4000")then
						if (wr_done = '1')then	
							Diff_counter <= Diff_counter + "100";
						elsif(rd_done = '1') then
							Diff_counter <= Diff_counter - "100";
						end if;	
					end if;		
				-- comparison logic for checking empty and full --	
					if (Diff_counter = x"00") then
							SR_empty <= '1';
							SR_full <= '0';
					elsif (Diff_counter > x"3FFB") then		
							SR_empty <= '0';
							SR_full <= '1';
					else
							SR_empty <= '0';
							SR_full <= '0';
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
					if (wr_done = '1') then 
						-- Check for address roll over and inc addess --
						if (write_addr = ("000" & X"4000")) then 
							write_addr <= (others => '0');
						-- No address roll over and SRAM is not full --	
						elsif (SR_full = '0') then 
							write_addr <= write_addr + "0100";
						end if;	
					end if;
					
					if( write_addr > "000" & x"1FFF") then
							Ping_A <= '0';
							Pong_B <= '1';
					else
							Ping_A <= '1';
							Pong_B <= '0';
					end if;
				 
								
-------------------------------------------------------------------------------
--Reading 
------------------------------------------------------------------------------

					-- When 1 Burst Rd is done, inc the address for next Burst Rd --
					if (rd_done = '1') then 
						-- Check for address roll over and inc addess --
						if (read_addr = ("000" & X"4000")) then 
							read_addr <= (others => '0');
						-- No address roll over and SRAM is not empty --	
						elsif (SR_empty = '0') then 
							read_addr <= read_addr + "0100";
						end if;	
					end if; 
						
						if( read_addr > "000" & x"1FFF") then
								Ping_A <= '0';
								Pong_B <= '1';
						else
								Ping_A <= '1';
								Pong_B <= '0';
						end if;		
				
				END IF;	
			END IF;
	END PROCESS;
	
-------------------------------------------------------------------------------
--Edge detection Processes
------------------------------------------------------------------------------
PROCESS(glb_clk)
		begin
         IF RISING_EDGE(glb_clk) then
				
				IF (g_reset = '1') THEN
					ADC_ready_latch <= '0';
					delayed_ADC_ready<= '0';
				else
					delayed_ADC_ready <= ADC_ready;
							
					if (ADC_ready = '1' and delayed_ADC_ready = '0') then 
						ADC_ready_latch <= '1';
					elsif (ADC_ready_latch_clr = '1') then 
					  ADC_ready_latch <= '0';
					end if;
				END IF;	
			END IF;
	END PROCESS;



	PROCESS(glb_clk)
		begin
         IF RISING_EDGE(glb_clk) then
			  
				IF (g_reset = '1') THEN
					USB_data_tick_latch <= '0';
					delayed_USB_data_tick <= '0';
				else
					delayed_USB_data_tick <= USB_data_tick;
					if ( USB_data_tick = '1' and delayed_USB_data_tick = '0') then 
							USB_data_tick_latch <= '1';
					elsif (USB_data_tick_latch_clr = '1') then 
							USB_data_tick_latch <= '0';
					end if;
				END IF;
			END IF;
	END PROCESS;


end Behavioral;