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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity usb_controller is
    port(
     gclk 	     : in std_logic;
	  usb_48_MHZ  : in std_logic; 
	  data_tick_1 :in std_logic;
	  usb_reset   :in std_logic; 
	  reg_addr    :out std_logic_vector(3 downto 0);
	  sloe_i      :out std_logic;  
	  slrd_i       :out std_logic;
	  read_done    :out std_logic;
	  flagb        :in std_logic;
	  flagc        :in std_logic;
	  fddr_i         :out std_logic_vector(1 downto 0);
	  usb_data_out      :out std_logic_vector(15 downto 0);
	  usb_data_in   :in std_logic_vector(15 downto 0);
	  header_footer_tick  :in std_logic;
	  slwr_i       :out std_logic
	  );

end usb_controller;


architecture Behavioral of usb_controller is
type states is (
       idle_state,
		 write_state
		 );
signal usb_state :states;

--signal int_cnt          :std_logic_vector(1 downto 0):= "00";
signal delay_usb_48_MHZ :std_logic;
signal  RIS_usb_48_MHZ :std_logic;
signal add_cnt          :std_logic_vector(3 downto 0):= "0000";
signal data_cnt       :std_logic_vector(2 downto 0):= "000";
signal read_done_temp  :std_logic:= '0';
signal tick             :std_logic:= '0'; 
signal temp_data_in   :std_logic_vector(15 downto 0);
signal temp_data_out  :std_logic_vector(15 downto 0);
signal header_tick    :std_logic;
signal latch :std_logic;
constant header_sig :std_logic_vector(15 downto 0):= X"A000";
constant footer_sig :std_logic_vector(15 downto 0):= X"5000";


begin

tick <= data_tick_1;
reg_addr    <= add_cnt;
read_done <= read_done_temp ;
fddr_i  <= "10";                -------select EP2
usb_data_out <= temp_data_out;
temp_data_in <= usb_data_in;

--PROCESS( gclk )
--		begin
--         IF RISING_EDGE( gclk ) then
--			IF (usb_reset = '1') THEN
--			   temp_data_out <= header_sig;
--				else
--				
--            if(RIS_usb_48_MHZ = '1')then
--				   if(header_tick  ='1') then
--					 temp_data_out <= footer_sig;
					 
 
PROCESS( gclk )
		begin
         IF RISING_EDGE( gclk ) then
					IF (usb_reset = '1') THEN
							delay_usb_48_MHZ   <= '0';
--							RIS_CLOCK_122_88 <= '0';
						ELSE
			
							delay_usb_48_MHZ   <= usb_48_MHZ  ;
					END IF;
			END IF;

    END PROCESS;

	RIS_usb_48_MHZ <= (not delay_usb_48_MHZ ) and usb_48_MHZ; 
	
	
PROCESS( gclk )

begin 
 if RISING_EDGE( gclk ) then
					IF (usb_reset = '1') THEN
--					  faddr_i <= "10"; 
	              sloe_i <= '1';
					  slrd_i <='1';
					  slwr_i <= '1';
					  add_cnt<="0000";
--					  int_cnt <="00";
					  temp_data_out <= header_sig;
					  else
					  
					  if(RIS_usb_48_MHZ = '1')then
					  
					 case usb_state is 
					  -----------idle state-----------
					   when idle_state =>
--					  faddr_i <= "10"; 
					  sloe_i <= '1';
					  slrd_i <='1';
					  slwr_i <= '1';
--					  int_cnt <="00";
					  
						if(tick ='1') then -------check whether data is available in register 
						
						usb_state <= write_state; ----------if yes go to write state 
						
						else
						
						usb_state <= idle_state; -----------else stay in the idle state 
						
						end if;
					
         
                 when write_state =>
                  
--						faddr_i <= "10"; 
						slrd_i <= '1';            
						sloe_i <= '1';
 
						if (flagb = '0') then        ----------check whether the fifo in the usb controller is not full 
						
						 slwr_i <= '0';             ------assert the write signal
	--/////////////////////////////////////////////////////////////////////////////////////////					
	-----------to check the signal for the footer addition
	--/////////////////////////////////////////////////////////////////////////////////////////	
						 if(header_tick <= '1')then 
                   temp_data_out <= footer_sig;-------add footer
						 latch <= '1';
						 else if(latch <= '1') then 
						  temp_data_out <= header_sig; ----send the header aftr footer 
						  latch <= '0';
						  else 
						   temp_data_out <= temp_data_in; --after additon of header and footer continue with normal data
                     add_cnt <= add_cnt + '1'; ---increment the adress counter 
						   data_cnt <= data_cnt +'1';  -- To check number of words read							
							end if;
	--/////////////////////////////////////////////////////////////////////////////////////////					
	-----------to check the signal for the footer addition
	--/////////////////////////////////////////////////////////////////////////////////////////					
               	 
						 usb_state <= write_state; ----------stay in write state
						 if(data_cnt = "011")then       --check whether four words are read from the register 
						 data_cnt <= "000";          
						 read_done_temp <='1';   ---when 4 words are read indicate to the scheduler  
						 usb_state <= idle_state;
						 end if;
					    
						 end if;
						 end if;
		
						 end case; 
					  
					  end if;
					  end if;
		           end if;
 	
    END PROCESS;
    
  	 
--PROCESS( gclk )
--
--begin 
-- if RISING_EDGE( gclk ) then
--  if(RIS_usb_48_MHZ = '1')then
--  if( header_footer_tick = '1')then
--  temp_data_out <= he
 
 
end Behavioral;

