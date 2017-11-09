----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:11:34 02/06/2014 
-- Design Name: 
-- Module Name:    header_footer_module - Behavioral 
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


entity header_footer_module is
port(  -- inputs --
	clk_200MHZ         :   in std_logic;
	reset_hf           :   in std_logic ;
	HF_usb_start       :   in std_logic;
	fifo_full_hf       :   in std_logic;
	valid_data         :   in std_logic;
	--HF_sig_acq         :   in std_logic;
	sram_wr_en_hfm     :   in std_logic;
	adc_data_tick_in   :   in std_logic;   
	data_in            :   in std_logic_vector(15 downto 0);   
	-- outputs 
	data_out           :   out std_logic_vector(15 downto 0);
	wr_en1             :   out std_logic;   
	sram_wr_en_out     :   out std_logic;  
	adc_data_tick_out  :   out std_logic	

	  );
end header_footer_module;

architecture Behavioral of header_footer_module is

constant header_sig        :   std_logic_vector(15 downto 0) :=x"a0a0";
constant footer_sig1       :   std_logic_vector(15 downto 0) :=x"5051";
constant footer_sig2       :   std_logic_vector(15 downto 0) :=x"5052";
constant footer_sig3       :   std_logic_vector(15 downto 0) :=x"5053";
constant footer_sig4       :   std_logic_vector(15 downto 0) :=x"5054";
constant footer_sig5       :   std_logic_vector(15 downto 0) :=x"5055";
constant data_limit        :   std_logic_vector(15 downto 0) :=x"1b58";

signal data_counter        :   std_logic_vector(15 downto 0) := (others => '0');                               
signal ftr_cnt             :   std_logic_vector (2 downto 0) := (others => '0');
signal sram_wr_en_out_sig  :   std_logic                     := '0';
signal valid_data_dly      :   std_logic                     := '0';
signal sram_wr_en_hfm_dly  :   std_logic                     := '0';                               
signal beam_cnt            :   std_logic_vector(15 downto 0) := x"0001";
signal data_in_sig         :   std_logic_vector(15 downto 0) := x"0000";
signal data_out_sig        :   std_logic_vector(15 downto 0) := x"0000";                               
signal flag_out            :   std_logic                     := '0';
signal flag                :   std_logic                     := '0';

type HF_states is (
                   idle_state,
					    header_state,
						 data_state,
						 footer_state
						 );
signal module_states :HF_states;

begin 

wr_en1 <= '0';   -- HARD CODED TO '0' , CAN BE CHANGED AS PER REQUIREMENT
sram_wr_en_out <= sram_wr_en_hfm_dly  when flag = '1' else '0' ;  -- flag signal to identify data state,  and enables sram_wr_en_out which a read enable for sram 
							
process(clk_200MHZ, reset_hf) 
BEGIN
    IF (reset_hf = '1') THEN                  -- Registering input outputs and creating delays whr required
    	data_out           <=  (others => '0');
		data_in_sig        <=  (others => '0');
		valid_data_dly     <=  '0';
		adc_data_tick_out  <=  '0';
		sram_wr_en_hfm_dly <=  '0';	
    elsIF rising_EDGE(clk_200MHZ) then
    	data_out           <= data_out_sig;
    	data_in_sig        <= data_in;
    	valid_data_dly     <= valid_data ;
    	adc_data_tick_out  <= adc_data_tick_in; 
    	sram_wr_en_hfm_dly <= sram_wr_en_hfm ;
    end if;	
end process;

process(clk_200MHZ , reset_hf) 
BEGIN
   IF (reset_hf = '1') THEN
      module_states  <= idle_state;
      flag_out <= '0' ;
   elsIF rising_EDGE(clk_200MHZ) then 
--       if HF_sig_acq = '1'  and module_states = idle_state  then --
-- 		    flag_out <= '1' ;		 	 
--	   end if;
       if flag_out = '1' then 
		  CASE module_states is 
          when idle_state =>		    
			  ftr_cnt <= "000";
			  data_out_sig <= header_sig;    -- Header Added and state  changed to header state
			  module_states <= header_state;
          when header_state =>
			  if (beam_cnt = X"0079") then				-- beam no is 121
			  	 beam_cnt <= X"0001";
			  else
			  	 beam_cnt <= beam_cnt + '1';
			  end if;
			  data_out_sig <= beam_cnt;     -- beam number Added and state  changed to data state 
			  module_states <= data_state;	
			  flag <= '1';				
		  when data_state =>
		     if(valid_data_dly = '1') then   -- data counter increments on when valid data comes from sram
                if(data_counter < (data_limit))then			   
         	       data_counter <= data_counter+'1';   
                   data_out_sig <= data_in_sig;
			       module_states <= data_state;         
			    end if;
		     end if;	
			 if(data_counter = data_limit - 1 ) then	 -- data limit 7000 , but data limit -1 ( 0 to 6999) will be 7000 data and the flag must be low so that the data from fifo should stop and footer can be added
				flag <= '0';
			 elsif(data_counter = data_limit) then   -- 1st footer is added when data counter is 7000 i.e. just after 7000 data and then state is  changed to footer state
				data_out_sig <= footer_sig1;
				module_states <= footer_state;	
			 end if;		
		  when footer_state =>
		     data_counter <= (others => '0');
		     flag <= '0';		 
			 case ftr_cnt is
			 when "000" => data_out_sig <= footer_sig2;ftr_cnt <= ftr_cnt + '1';--  -- footer is added one by one
			 when "001" => data_out_sig <= footer_sig3;ftr_cnt <= ftr_cnt + '1';
			 when "010" => data_out_sig <= footer_sig4;ftr_cnt <= ftr_cnt + '1';
			 when "011" => data_out_sig <= footer_sig5;ftr_cnt <= ftr_cnt + '1';
 			 when "100" => data_out_sig <= header_sig;
							 module_states <= header_state;                        -- once footer is adder again header is added and state changed to header state
							 ftr_cnt <= "000";	
             when others => null;		
			 end case;
		  when others => null;	
          end case;
       end if;	
   end if;					
end process;
end Behavioral;