----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:29 09/29/2008 
-- Design Name: 
-- Module Name:    adc_interface - Behavioral 
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


----------------------------------------------------------------------------------
  library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
  use IEEE.STD_LOGIC_SIGNED.ALL;
  
  ---- Uncomment the following library declaration if instantiating
  ---- any Xilinx primitives in this code.
  library UNISIM;
  use UNISIM.VComponents.all;
  
  entity lvds_adc_interface is      
  generic (
					         BIT_WIDTH_ADC : integer := 12 
					);  
    Port (                                        
           global_clk             : in  std_logic;
           reset                : in  std_logic;
                                                  
           ADC_FCO                : in  std_logic;
           ADC_DCO                : in  std_logic;
           ADC_OUT_CH1            : in  std_logic;
           ADC_OUT_CH2            : in  std_logic;
           ADC_OUT_CH3            : in  std_logic;
			  ADC_OUT_CH4            : in  std_logic;
           ADC_OUT_CH5            : in  std_logic;
           ADC_OUT_CH6            : in  std_logic;
           ADC_OUT_CH7            : in  std_logic;
           ADC_OUT_CH8            : in  std_logic;
			  
           adc_datavalid          : out std_logic;
           ADC_DATA_CH1           : out std_logic_vector(BIT_WIDTH_ADC-1 downto 0);
           ADC_DATA_CH2           : out std_logic_vector(BIT_WIDTH_ADC-1 downto 0);
           ADC_DATA_CH3           : out std_logic_vector(BIT_WIDTH_ADC-1 downto 0);
           ADC_DATA_CH4           : out std_logic_vector(BIT_WIDTH_ADC-1 downto 0);
           ADC_DATA_CH5           : out std_logic_vector(BIT_WIDTH_ADC-1 downto 0);
           ADC_DATA_CH6           : out std_logic_vector(BIT_WIDTH_ADC-1 downto 0);
           ADC_DATA_CH7           : out std_logic_vector(BIT_WIDTH_ADC-1 downto 0);
           ADC_DATA_CH8           : out std_logic_vector(BIT_WIDTH_ADC-1 downto 0)                                       
                                                  
          );                                      
                           
  end lvds_adc_interface;
  
  architecture Behavioral of lvds_adc_interface is
        
  signal data_temp1_ch1        :     std_logic_vector(1 downto 0);
  signal data_temp_ch1         :     std_logic_vector(1 downto 0);
  signal data_temp1_ch2        :     std_logic_vector(1 downto 0);
  signal data_temp_ch2         :     std_logic_vector(1 downto 0);
  signal data_temp1_ch3        :     std_logic_vector(1 downto 0);
  signal data_temp_ch3         :     std_logic_vector(1 downto 0);
  signal data_temp1_ch4        :     std_logic_vector(1 downto 0);
  signal data_temp_ch4         :     std_logic_vector(1 downto 0);
  signal data_temp1_ch5        :     std_logic_vector(1 downto 0);
  signal data_temp_ch5         :     std_logic_vector(1 downto 0);
  signal data_temp1_ch6        :     std_logic_vector(1 downto 0);
  signal data_temp_ch6         :     std_logic_vector(1 downto 0);
  signal data_temp1_ch7        :     std_logic_vector(1 downto 0);
  signal data_temp_ch7         :     std_logic_vector(1 downto 0);
  signal data_temp1_ch8        :     std_logic_vector(1 downto 0);
  signal data_temp_ch8         :     std_logic_vector(1 downto 0);
  
  signal data_latch_ch1        :     std_logic_vector(BIT_WIDTH_ADC-1  downto 0);
  signal data_latch_ch2        :     std_logic_vector(BIT_WIDTH_ADC-1  downto 0);
  signal data_latch_ch3        :     std_logic_vector(BIT_WIDTH_ADC-1  downto 0);
  signal data_latch_ch4        :     std_logic_vector(BIT_WIDTH_ADC-1  downto 0);
  signal data_latch_ch5        :     std_logic_vector(BIT_WIDTH_ADC-1  downto 0);
  signal data_latch_ch6        :     std_logic_vector(BIT_WIDTH_ADC-1  downto 0);
  signal data_latch_ch7        :     std_logic_vector(BIT_WIDTH_ADC-1  downto 0);
  signal data_latch_ch8        :     std_logic_vector(BIT_WIDTH_ADC-1  downto 0);
  
  signal start_latch           :     std_logic := '0';
  signal capture_data_reg      :     std_logic;
  signal capture_data_reg1     :     std_logic;
--  signal ADC_DATA1             :     std_logic_vector (11 downto 0);
--  signal ADC_DATA2             :     std_logic_vector (11 downto 0);
--  signal ADC_DATA3             :     std_logic_vector (11 downto 0);
  signal ADC_FCO_reg0          :     std_logic;
  signal ADC_FCO_reg1          :     std_logic;
--  signal ADC_FCO_reg2          :     std_logic;
 
  signal adc_datavalid_reg     :     std_logic := '0';

  begin
  
  adc_datavalid <= start_latch; --adc_datavalid_reg;
          
  process(ADC_DCO,reset)
  begin
      if (reset = '1') then 
        ADC_FCO_reg0 <= '0';
        ADC_FCO_reg1 <= '0';
--        ADC_FCO_reg2 <= '0';
      elsif falling_edge (ADC_DCO) then 
        ADC_FCO_reg0 <= ADC_FCO;
        ADC_FCO_reg1 <= ADC_FCO_reg0;
		  if(ADC_FCO_reg0 = '1' and ADC_FCO_reg1 = '0')then
				start_latch <= '1';
			else
				start_latch <= '0'; 
--        ADC_FCO_reg2 <= ADC_FCO_reg1; 
			end if;
      end if;
  end process;
  
--  start_latch <= '1' when ADC_FCO_reg0 = '1' and ADC_FCO_reg1 = '0'
--                     else '0';
--           
            
  process(ADC_DCO,reset)
  begin
      if (reset = '1') then 
        data_temp_ch1(1) <= '0';
        data_temp_ch2(1) <= '0';
        data_temp_ch3(1) <= '0';
        data_temp_ch4(1) <= '0';
        data_temp_ch5(1) <= '0';
        data_temp_ch6(1) <= '0';
        data_temp_ch7(1) <= '0';
        data_temp_ch8(1) <= '0';
      elsif rising_edge (ADC_DCO) then
        data_temp_ch1(1) <= ADC_OUT_CH1;
        data_temp_ch2(1) <= ADC_OUT_CH2;
        data_temp_ch3(1) <= ADC_OUT_CH3;
        data_temp_ch4(1) <= ADC_OUT_CH4;
        data_temp_ch5(1) <= ADC_OUT_CH5;
        data_temp_ch6(1) <= ADC_OUT_CH6;
        data_temp_ch7(1) <= ADC_OUT_CH7;
        data_temp_ch8(1) <= ADC_OUT_CH8;
      end if;
  end process;
    
   process(ADC_DCO,reset)
      begin
          if (reset = '1') then 
            data_temp_ch1(0) <= '0';
            data_temp_ch2(0) <= '0';
            data_temp_ch3(0) <= '0';
            data_temp_ch4(0) <= '0';
            data_temp_ch5(0) <= '0';
            data_temp_ch6(0) <= '0';
            data_temp_ch7(0) <= '0';
            data_temp_ch8(0) <= '0';
        elsif falling_edge (ADC_DCO) then
            data_temp_ch1(0) <=ADC_OUT_CH1;
            data_temp_ch2(0) <= ADC_OUT_CH2;
            data_temp_ch3(0) <= ADC_OUT_CH3;
            data_temp_ch4(0) <= ADC_OUT_CH4;
            data_temp_ch5(0) <= ADC_OUT_CH5;
            data_temp_ch6(0) <= ADC_OUT_CH6;
            data_temp_ch7(0) <= ADC_OUT_CH7;
            data_temp_ch8(0) <= ADC_OUT_CH8;
        end if;
      end process;
    
   process(ADC_DCO,reset)
      begin
            if(reset = '1')then
              data_temp1_ch1(1) <= '0';
              data_temp1_ch2(1) <= '0';
              data_temp1_ch3(1) <= '0';
              data_temp1_ch4(1) <= '0';
              data_temp1_ch5(1) <= '0';
              data_temp1_ch6(1) <= '0';
              data_temp1_ch7(1) <= '0';
              data_temp1_ch8(1) <= '0';
            elsif falling_edge (ADC_DCO) then
              data_temp1_ch1(1) <= data_temp_ch1(1);
              data_temp1_ch2(1) <= data_temp_ch2(1);
              data_temp1_ch3(1) <= data_temp_ch3(1);
              data_temp1_ch4(1) <= data_temp_ch4(1);
              data_temp1_ch5(1) <= data_temp_ch5(1);
              data_temp1_ch6(1) <= data_temp_ch6(1);
              data_temp1_ch7(1) <= data_temp_ch7(1);
              data_temp1_ch8(1) <= data_temp_ch8(1);
            end if;
      end process;
   
    process(ADC_DCO,reset)
      begin
            if(reset = '1')then
              data_temp1_ch1(0) <= '0';
              data_temp1_ch2(0) <= '0';
              data_temp1_ch3(0) <= '0';
              data_temp1_ch4(0) <= '0';
              data_temp1_ch5(0) <= '0';
              data_temp1_ch6(0) <= '0';
              data_temp1_ch7(0) <= '0';
              data_temp1_ch8(0) <= '0';
            elsif falling_edge (ADC_DCO) then
              data_temp1_ch1(0) <= data_temp_ch1(0);
              data_temp1_ch2(0) <= data_temp_ch2(0);
              data_temp1_ch3(0) <= data_temp_ch3(0);
              data_temp1_ch4(0) <= data_temp_ch4(0);
              data_temp1_ch5(0) <= data_temp_ch5(0);
              data_temp1_ch6(0) <= data_temp_ch6(0);
              data_temp1_ch7(0) <= data_temp_ch7(0);
              data_temp1_ch8(0) <= data_temp_ch8(0);
            end if;
        end process;
  
   process(ADC_DCO,reset)
      begin
          if (reset = '1') then 
            data_latch_ch1 <= (others => '0');
            data_latch_ch2 <= (others => '0');
            data_latch_ch3 <= (others => '0');
            data_latch_ch4 <= (others => '0');
            data_latch_ch5 <= (others => '0');
            data_latch_ch6 <= (others => '0');
            data_latch_ch7 <= (others => '0');
            data_latch_ch8 <= (others => '0');
        elsif falling_edge (ADC_DCO) then
		      data_latch_ch1 <= data_temp1_ch1 & data_latch_ch1(11 downto 2);  
            data_latch_ch2 <= data_temp1_ch2 & data_latch_ch2(11 downto 2);
            data_latch_ch3 <= data_temp1_ch3 & data_latch_ch3(11 downto 2);
            data_latch_ch4 <= data_temp1_ch4 & data_latch_ch4(11 downto 2);
            data_latch_ch5 <= data_temp1_ch5 & data_latch_ch5(11 downto 2);
            data_latch_ch6 <= data_temp1_ch6 & data_latch_ch6(11 downto 2);
            data_latch_ch7 <= data_temp1_ch7 & data_latch_ch7(11 downto 2);
            data_latch_ch8 <= data_temp1_ch8 & data_latch_ch8(11 downto 2);
        end if;
      end process; 
  
    process(ADC_DCO,reset)
       begin
         if (reset = '1') then 
           ADC_DATA_CH1      <= (others => '0');
           ADC_DATA_CH2      <= (others => '0');
           ADC_DATA_CH3      <= (others => '0');
           ADC_DATA_CH4      <= (others => '0');
           ADC_DATA_CH5      <= (others => '0');
           ADC_DATA_CH6      <= (others => '0');
           ADC_DATA_CH7      <= (others => '0');
           ADC_DATA_CH8      <= (others => '0');
           adc_datavalid_reg  <= '0';
		  elsif falling_edge (ADC_DCO) then	  
			if(start_latch = '1') then
				adc_datavalid_reg  <= '1';

				ADC_DATA_CH1(11) 	<= data_latch_ch1(0);
				ADC_DATA_CH1(10) 	<= data_latch_ch1(1);
				ADC_DATA_CH1(9) 	<= data_latch_ch1(2);
				ADC_DATA_CH1(8) 	<= data_latch_ch1(3);
				ADC_DATA_CH1(7) 	<= data_latch_ch1(4);
				ADC_DATA_CH1(6) 	<= data_latch_ch1(5);
				ADC_DATA_CH1(5) 	<= data_latch_ch1(6);
				ADC_DATA_CH1(4) 	<= data_latch_ch1(7);
				ADC_DATA_CH1(3) 	<= data_latch_ch1(8);
				ADC_DATA_CH1(2) 	<= data_latch_ch1(9);
				ADC_DATA_CH1(1) 	<= data_latch_ch1(10);
				ADC_DATA_CH1(0) 	<= data_latch_ch1(11);

--				ADC_DATA_CH1      <=	X"100";	
				ADC_DATA_CH2(11) 	<= data_latch_ch2(0);
				ADC_DATA_CH2(10) 	<= data_latch_ch2(1);
				ADC_DATA_CH2(9) 	<= data_latch_ch2(2);
				ADC_DATA_CH2(8) 	<= data_latch_ch2(3);
				ADC_DATA_CH2(7) 	<= data_latch_ch2(4);
				ADC_DATA_CH2(6) 	<= data_latch_ch2(5);
				ADC_DATA_CH2(5) 	<= data_latch_ch2(6);
				ADC_DATA_CH2(4) 	<= data_latch_ch2(7);
				ADC_DATA_CH2(3) 	<= data_latch_ch2(8);
				ADC_DATA_CH2(2) 	<= data_latch_ch2(9);
				ADC_DATA_CH2(1) 	<= data_latch_ch2(10);
				ADC_DATA_CH2(0) 	<= data_latch_ch2(11);

				ADC_DATA_CH3(11) 	<= data_latch_ch3(0);
				ADC_DATA_CH3(10) 	<= data_latch_ch3(1);
				ADC_DATA_CH3(9) 	<= data_latch_ch3(2);
				ADC_DATA_CH3(8) 	<= data_latch_ch3(3);
				ADC_DATA_CH3(7) 	<= data_latch_ch3(4);
				ADC_DATA_CH3(6) 	<= data_latch_ch3(5);
				ADC_DATA_CH3(5) 	<= data_latch_ch3(6);
				ADC_DATA_CH3(4) 	<= data_latch_ch3(7);
				ADC_DATA_CH3(3) 	<= data_latch_ch3(8);
				ADC_DATA_CH3(2) 	<= data_latch_ch3(9);
				ADC_DATA_CH3(1) 	<= data_latch_ch3(10);
				ADC_DATA_CH3(0) 	<= data_latch_ch3(11);

				ADC_DATA_CH4(11) 	<= data_latch_ch4(0);
				ADC_DATA_CH4(10) 	<= data_latch_ch4(1);
				ADC_DATA_CH4(9) 	<= data_latch_ch4(2);
				ADC_DATA_CH4(8) 	<= data_latch_ch4(3);
				ADC_DATA_CH4(7) 	<= data_latch_ch4(4);
				ADC_DATA_CH4(6) 	<= data_latch_ch4(5);
				ADC_DATA_CH4(5) 	<= data_latch_ch4(6);
				ADC_DATA_CH4(4) 	<= data_latch_ch4(7);
				ADC_DATA_CH4(3) 	<= data_latch_ch4(8);
				ADC_DATA_CH4(2) 	<= data_latch_ch4(9);
				ADC_DATA_CH4(1) 	<= data_latch_ch4(10);
				ADC_DATA_CH4(0) 	<= data_latch_ch4(11);

				ADC_DATA_CH5(11) 	<= data_latch_ch5(0);
				ADC_DATA_CH5(10) 	<= data_latch_ch5(1);
				ADC_DATA_CH5(9) 	<= data_latch_ch5(2);
				ADC_DATA_CH5(8) 	<= data_latch_ch5(3);
				ADC_DATA_CH5(7) 	<= data_latch_ch5(4);
				ADC_DATA_CH5(6) 	<= data_latch_ch5(5);
				ADC_DATA_CH5(5) 	<= data_latch_ch5(6);
				ADC_DATA_CH5(4) 	<= data_latch_ch5(7);
				ADC_DATA_CH5(3) 	<= data_latch_ch5(8);
				ADC_DATA_CH5(2) 	<= data_latch_ch5(9);
				ADC_DATA_CH5(1) 	<= data_latch_ch5(10);
				ADC_DATA_CH5(0) 	<= data_latch_ch5(11);

				ADC_DATA_CH6(11) 	<= data_latch_ch6(0);
				ADC_DATA_CH6(10) 	<= data_latch_ch6(1);
				ADC_DATA_CH6(9) 	<= data_latch_ch6(2);
				ADC_DATA_CH6(8) 	<= data_latch_ch6(3);
				ADC_DATA_CH6(7) 	<= data_latch_ch6(4);
				ADC_DATA_CH6(6) 	<= data_latch_ch6(5);
				ADC_DATA_CH6(5) 	<= data_latch_ch6(6);
				ADC_DATA_CH6(4) 	<= data_latch_ch6(7);
				ADC_DATA_CH6(3) 	<= data_latch_ch6(8);
				ADC_DATA_CH6(2) 	<= data_latch_ch6(9);
				ADC_DATA_CH6(1) 	<= data_latch_ch6(10);
				ADC_DATA_CH6(0) 	<= data_latch_ch6(11);

				ADC_DATA_CH7(11) 	<= data_latch_ch7(0);
				ADC_DATA_CH7(10) 	<= data_latch_ch7(1);
				ADC_DATA_CH7(9) 	<= data_latch_ch7(2);
				ADC_DATA_CH7(8) 	<= data_latch_ch7(3);
				ADC_DATA_CH7(7) 	<= data_latch_ch7(4);
				ADC_DATA_CH7(6) 	<= data_latch_ch7(5);
				ADC_DATA_CH7(5) 	<= data_latch_ch7(6);
				ADC_DATA_CH7(4) 	<= data_latch_ch7(7);
				ADC_DATA_CH7(3) 	<= data_latch_ch7(8);
				ADC_DATA_CH7(2) 	<= data_latch_ch7(9);
				ADC_DATA_CH7(1) 	<= data_latch_ch7(10);
				ADC_DATA_CH7(0) 	<= data_latch_ch7(11);

				ADC_DATA_CH8(11) 	<= data_latch_ch8(0);
				ADC_DATA_CH8(10) 	<= data_latch_ch8(1);
				ADC_DATA_CH8(9) 	<= data_latch_ch8(2);
				ADC_DATA_CH8(8) 	<= data_latch_ch8(3);
				ADC_DATA_CH8(7) 	<= data_latch_ch8(4);
				ADC_DATA_CH8(6) 	<= data_latch_ch8(5);
				ADC_DATA_CH8(5) 	<= data_latch_ch8(6);
				ADC_DATA_CH8(4) 	<= data_latch_ch8(7);
				ADC_DATA_CH8(3) 	<= data_latch_ch8(8);
				ADC_DATA_CH8(2) 	<= data_latch_ch8(9);
				ADC_DATA_CH8(1) 	<= data_latch_ch8(10);
				ADC_DATA_CH8(0) 	<= data_latch_ch8(11);				
          
			else
			  adc_datavalid_reg  <= '0';	
			end if;			
       end if;  
       end process;
  
 
    
  end Behavioral;
  
  