----------------------------------------------------------------------------------
-- Engineer:Rahul Kumar 
-- 
-- Design Name:  FX2LP-FPGA interface (loopback)
-- Module Name:  
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
library UNISIM;
use UNISIM.vcomponents.all;


	 fdata     : inout  STD_LOGIC_VECTOR(15 downto 0);  --  FIFO data lines.
	 faddr     : out STD_LOGIC_VECTOR(1 downto 0);     --  FIFO select lines
	 slrd      : out STD_LOGIC;                        -- Read control line
	 slwr      : out STD_LOGIC;                        -- Write control line
    
	 flagd     : in  STD_LOGIC;                        --EP6 full flag
	 flaga     : in  STD_LOGIC;                        --EP2 empty flag
	 clk       : in  STD_LOGIC;                        --Interface Clock
	 sloe      : out STD_LOGIC;                        --Slave Output Enable control
  	 done      : out STD_LOGIC;
         clk_out   : out STD_LOGIC;
  	 pkt_end   : out STD_LOGIC
	  
  );
end fx2lp_slaveFIFO2b_streamOUT_fpga_top;

entity usb_controller is
			port(
							   gclk 	     					: in std_logic;
								usb_48_MHZ 					: in std_logic; --Interface Clock
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
								flagb        				: in std_logic;--EP6 full flag
								flagc        				: in std_logic;	--EP2 empty flag
								sloe_i      				: out std_logic;   --Slave Output Enable control
								slrd_i       				: out std_logic; -- Read control line
								slwr_i       				: out std_logic;  -- Write control line
								fddr_i         			: out std_logic_vector(1 downto 0);--  FIFO select lines
								usb_data_out     		: out std_logic_vector(15 downto 0) FIFO data lines.
					);





architecture fx2lp_slaveFIFO2b_streamOUT_fpga_top_arch of fx2lp_slaveFIFO2b_streamOUT_fpga_top is

component clk_wiz_v3_6
port(	
		CLK_IN1           : in     std_logic;			
		CLK_OUT1          : out    std_logic;
		CLK_OUT2          : out    std_logic;
		CLK_OUT3          : out    std_logic;
		CLK_OUT4          : out    std_logic;
		RESET             : in     std_logic;
		LOCKED            : out    std_logic
	);
end component;


--streamOUT fsm signal
type stream_out_states is (stream_out_idle, stream_out_read);
signal current_stream_out_state, next_stream_out_state : stream_out_states;

signal slrd_n,slwr_n, sloe_n : std_logic;
signal data_out : std_logic_vector(15 downto 0);

signal CLK_OUT_0, clk_out_90, clk_out_180, CLK_OUT_270 : std_logic;
signal reset_n : std_logic;
signal done_d  : std_logic;
signal wait_s  : std_logic_vector(3 downto 0);

begin                   --archetecture begining

oddr_y : ODDR2 	                                           -- clk out buffer
port map
(
 D0 	=> '1',
 D1 	=> '0',
 CE 	=> '1',
 C0	=> clk_out_270,  
 C1	=> (not clk_out_270), 
 R  	=> '0',
 S  	=> '0',
 Q  	=> clk_out
);
	
		
pll : clk_wiz_v3_6  	                                   -- PLL
port map(
 CLK_IN1         => clk,
 clk_out1        => clk_out_0,		
 clk_out2        => clk_out_90,
 clk_out3        => clk_out_180,
 CLK_OUT4	 => clk_out_270,
 RESET           => '0',
 LOCKED          => reset_n
);


--for TB
reset_n_out <= reset_n;

--output signal asignment

slrd  <= slrd_n;
sloe  <= sloe_n;
faddr <= "00";
data_out <= fdata;
pkt_end <= '1';
slwr <= slwr_n;
done <= done_d;

process(clk_out_0, reset_n) begin
	if(reset_n = '0')then
		done_d <= '0';
        elsif(clk_out_0'event and clk_out_0 = '1')then
		if(wait_s = "1010")then
                	done_d <= '1';
		end if;	
        end if;
end process;

process(clk_out_0, reset_n) begin
	if(reset_n = '0')then
      		wait_s <= "0000";
        elsif(clk_out_0'event and clk_out_0 = '1')then
		if(wait_s < "1010")then
                	wait_s <= wait_s + '1';
		end if;	
        end if;
end process;


--read control signal generation
process(current_stream_out_state, flaga)begin
	if((current_stream_out_state = stream_out_read) and (flaga = '1'))then
		slrd_n <= '0';
		sloe_n <= '0';
	else
		slrd_n <= '1';
		sloe_n <= '1';
	end if;
end process;



--streamOUT mode state machine 
streamOUT_mode_fsm_f : process(clk_out_0, reset_n) begin
	if(reset_n = '0')then
      		current_stream_out_state <= stream_out_idle;
        elsif(clk_out_0'event and clk_out_0 = '1')then
                current_stream_out_state <= next_stream_out_state;
        end if;
end process;

--streamOUT mode state machine combo
streamOUT_mode_fsm : process(flaga, current_stream_out_state) begin
	next_stream_out_state <= current_stream_out_state;
	case current_stream_out_state is
		when stream_out_idle =>
			if(flaga = '1')then
				next_stream_out_state <= stream_out_read;
			else
				next_stream_out_state <= stream_out_idle;
			end if;

		when stream_out_read => 
			if(flaga = '0')then
				next_stream_out_state <= stream_out_idle;
			else
				next_stream_out_state <= stream_out_read;
			end if;
		
		when others =>
			next_stream_out_state <= stream_out_idle;
		end case;
end process;

end architecture;
		
