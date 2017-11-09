----------------------------------------------------------------------------------
-- Engineer:Sayed Faizan Aliakbar. 
-- 
-- Design Name:  USB Controller -FPGA interface.
-- Module Name:  
-- Project Name: Ultrasound Beamformer.
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
library UNISIM;
use UNISIM.vcomponents.all;

entity USB_FX2LP_Controller is
  Port (  
			--FX2LP Interface
 		 	 clk_48mhz      	: in  STD_LOGIC;                        --Interface Clock
			 reset     			: in STD_LOGIC;                         --Global reset
			 fdata     			: inout  STD_LOGIC_VECTOR(15 downto 0); --  FIFO data lines.
			 faddr     			: out STD_LOGIC_VECTOR(1 downto 0);     --  FIFO select lines
			 slrd      			: out STD_LOGIC;                        -- Read control line
			 slwr      			: out STD_LOGIC;                        -- Write control line
			 flagb     			: in  STD_LOGIC;                        --EP6 full flag
			 usb_start 			: in std_logic;								 -- START/STOP of streaming
		--	 flagc     			: in  STD_LOGIC;                        --EP2 empty flag
			 sloe      			: out STD_LOGIC;                        --Slave Output Enable control
			 test_count			: out STD_LOGIC_VECTOR(15 downto 0);
			 -- FIFO interface
			 data_in   			: in  STD_LOGIC_VECTOR(15 downto 0);	-- Data input from the fifo
			 data_valid			: in  STD_LOGIC;								-- data valid from the fifo
			 fifo_empty			: in STD_LOGIC;								-- fifo empty condition for starting reading		
			 fifo_read_en		: out STD_LOGIC								-- Read Enable control for incrementing FIFO
		);
end USB_FX2LP_Controller;

architecture USB_FX2LP_Controller_arch of USB_FX2LP_Controller is

--streamIN fsm signal
type stream_in_state is (stram_in_idle, stream_in_write);
signal current_stream_in_state, next_stream_in_state : stream_in_state;
signal slwr_n: std_logic;
signal data_out : std_logic_vector(15 downto 0);
signal write_counter : std_logic_vector(15 downto 0):= (others => '0');
signal ref_count : std_logic_vector(15 downto 0):= (others => '0');
signal fifo_read_en_sig : std_logic;
begin --architecture begining

--output signal asignment
slwr <= slwr_n;	
slwr_n  <= '0' when ((current_stream_in_state = stream_in_write) and flagb = '0' and usb_start = '1' and fifo_empty = '0' and fifo_read_en_sig = '1')
				else '1';
slrd  <= '1';
sloe  <= '1';
faddr <= "10";
fdata <= data_out;
test_count <= write_counter;
fifo_read_en <= fifo_read_en_sig;
--write control signal generation
--process(current_stream_in_state, flagb,usb_start)
-- begin
--	if((current_stream_in_state = stream_in_write) and (flagb = '0')and (usb_start = '1') and(data_valid = '1'))then
--		slwr_n <= '0';
--		--write_counter <= write_counter + '1';
--	else
--		slwr_n <= '1';
--	end if;
--end process;

--streamIN mode state machine 
streamIN_mode_fsm_f : process(clk_48mhz, reset)
 begin
	if(reset = '1')then
      		current_stream_in_state <= stram_in_idle;
        elsif(clk_48mhz'event and clk_48mhz = '1')then
                current_stream_in_state <= next_stream_in_state;
        end if;
end process;

--StreamIN mode state machine combo
streamIN_mode_fsm : process(flagb, current_stream_in_state,usb_start) 
begin
	next_stream_in_state <= current_stream_in_state;
	case current_stream_in_state is
		when stram_in_idle =>
			if(flagb = '0') then
				next_stream_in_state <= stream_in_write;
			else
				next_stream_in_state <= stram_in_idle;
			end if;

		when stream_in_write => 
			if(flagb = '1' and (usb_start = '1'))then
				next_stream_in_state <= stram_in_idle;
			else
				next_stream_in_state <= stream_in_write;
			end if;
				
		when others =>
			next_stream_in_state <= stram_in_idle;
		end case;
end process;

--read enable generator  
process(clk_48mhz, reset,ref_count) begin
	if(reset = '1')then
      		fifo_read_en_sig <= '0';
   --elsif(clk_48mhz'event and clk_48mhz = '1')then
	elsif(rising_edge (clk_48mhz))then
		if(usb_start = '1') then
			if(flagb = '0' and ref_count < x"1FF" and fifo_empty = '0')then--slwr_n = '0' and 
				fifo_read_en_sig <= '1';
			else
				fifo_read_en_sig <= '0';
			end if;	
		end if;
	end if;	
end process;

-- Data valid detection and placement on the bus
process(clk_48mhz, reset) begin
	if(reset = '1')then
      		data_out <= (others=> 'Z');
	elsif(falling_edge(clk_48mhz))then
				if(slwr_n = '0')then
					ref_count <= ref_count + 1;
					data_out <= data_in;
					
				else
					--data_out <= (others=> 'Z');
					if(ref_count = x"1FF") then
						ref_count <= (others=> '0');
					end if;
				end if;	
   end if;
end process;

end architecture;

