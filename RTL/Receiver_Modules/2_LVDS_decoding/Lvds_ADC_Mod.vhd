----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:59:06 10/04/2008 
-- Design Name: 
-- Module Name:    adc_module - Behavioral 
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

  library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.std_logic_ARITH.ALL;
  use IEEE.std_logic_UNSIGNED.ALL;
  
  ---- Uncomment the following library declaration if instantiating
  ---- any Xilinx primitives in this code.
  library UNISIM;
  use UNISIM.VComponents.all;

  entity lvds_adc_mod is
    Port (    
          global_clk              : in  std_logic;
          reset_n                 : in  std_logic;
          ADC_FCO_P               : in  std_logic;
          ADC_FCO_N               : in  std_logic;
          ADC_DCO_P               : in  std_logic;
          ADC_DCO_N               : in  std_logic;
          ADC_OUT_CH1_P           : in  std_logic;
          ADC_OUT_CH1_N           : in  std_logic;
          ADC_OUT_CH2_P           : in  std_logic;
          ADC_OUT_CH2_N           : in  std_logic;
          ADC_OUT_CH3_P           : in  std_logic;
          ADC_OUT_CH3_N           : in  std_logic;  
          ADC_OUT_CH4_P           : in  std_logic;
          ADC_OUT_CH4_N           : in  std_logic;  
          ADC_OUT_CH5_P           : in  std_logic;
          ADC_OUT_CH5_N           : in  std_logic;  
          ADC_OUT_CH6_P           : in  std_logic;
          ADC_OUT_CH6_N           : in  std_logic;  
          ADC_OUT_CH7_P           : in  std_logic;
          ADC_OUT_CH7_N           : in  std_logic;  
          ADC_OUT_CH8_P           : in  std_logic;
          ADC_OUT_CH8_N           : in  std_logic;  
          
          Adc_reset               : out std_logic;
          adc_cs                  : out std_logic;
          ADC_DATA_CH1            : out std_logic_vector(11 downto 0);
          ADC_DATA_CH2            : out std_logic_vector(11 downto 0);
          ADC_DATA_CH3            : out std_logic_vector(11 downto 0);
          ADC_DATA_CH4            : out std_logic_vector(11 downto 0);
          ADC_DATA_CH5            : out std_logic_vector(11 downto 0);
          ADC_DATA_CH6            : out std_logic_vector(11 downto 0);
          ADC_DATA_CH7            : out std_logic_vector(11 downto 0);
          ADC_DATA_CH8            : out std_logic_vector(11 downto 0);
          
          adc_datavalid           : out std_logic
         );
  end lvds_adc_mod; 

  
  architecture Behavioral of lvds_adc_mod is
  
  signal ADC_FCO     :  std_logic;
  signal ADC_DCO     :  std_logic;
  signal ADC_OUT_CH1 :  std_logic;
  signal ADC_OUT_CH2 :  std_logic;
  signal ADC_OUT_CH3 :  std_logic;
  signal ADC_OUT_CH4 :  std_logic;
  signal ADC_OUT_CH5 :  std_logic;
  signal ADC_OUT_CH6 :  std_logic;
  signal ADC_OUT_CH7 :  std_logic;
  signal ADC_OUT_CH8 :  std_logic;
  
  component lvds_adc_interface is
    Port ( 
           global_clk             : in  std_logic;
           reset_n                : in  std_logic;
                                                  
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
           ADC_DATA_CH1           : out std_logic_vector(11 downto 0);
           ADC_DATA_CH2           : out std_logic_vector(11 downto 0);
           ADC_DATA_CH3           : out std_logic_vector(11 downto 0);
           ADC_DATA_CH4           : out std_logic_vector(11 downto 0);
           ADC_DATA_CH5           : out std_logic_vector(11 downto 0);
           ADC_DATA_CH6           : out std_logic_vector(11 downto 0);
           ADC_DATA_CH7           : out std_logic_vector(11 downto 0);
           ADC_DATA_CH8           : out std_logic_vector(11 downto 0)             


          );
  end component;
  
  begin  
  
    IBUFDS_inst0 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_FCO,  -- Clock buffer output
        I => ADC_FCO_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_FCO_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
    
  
     IBUFDS_inst1 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O  => ADC_DCO,  -- Clock buffer output
        I  => ADC_DCO_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_DCO_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
    
    --Differential Data line1 
     IBUFDS_inst2 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_OUT_CH1,  -- Clock buffer output
        I => ADC_OUT_CH1_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_OUT_CH1_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line2 
     IBUFDS_inst3 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_OUT_CH2,  -- Clock buffer output
        I => ADC_OUT_CH2_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_OUT_CH2_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line3 
     IBUFDS_inst4 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_OUT_CH3,  -- Clock buffer output
        I => ADC_OUT_CH3_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_OUT_CH3_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
  
  --Differential Data line4 
     IBUFDS_inst5 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_OUT_CH4,  -- Clock buffer output
        I => ADC_OUT_CH4_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_OUT_CH4_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line5 
     IBUFDS_inst6 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_OUT_CH5,  -- Clock buffer output
        I => ADC_OUT_CH5_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_OUT_CH5_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line6 
     IBUFDS_inst7 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_OUT_CH6,  -- Clock buffer output
        I => ADC_OUT_CH6_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_OUT_CH6_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line7 
     IBUFDS_inst8 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_OUT_CH7,  -- Clock buffer output
        I => ADC_OUT_CH7_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_OUT_CH7_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  --Differential Data line8 
     IBUFDS_inst9 : IBUFDS
     generic map (
        CAPACITANCE => "DONT_CARE", -- "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
        DIFF_TERM => FALSE, -- Differential Termination (Virtex-4/5, Spartan-3E/3A)
        IOSTANDARD => "LVDS_25")
     port map (
        O => ADC_OUT_CH8,  -- Clock buffer output
        I => ADC_OUT_CH8_P,  -- Diff_p clock buffer input (connect directly to top-level port)
        IB => ADC_OUT_CH8_N -- Diff_n clock buffer input (connect directly to top-level port)
     ); 
     
  lvds_adc_interface_1: lvds_adc_interface
    Port map( 
           global_clk             => global_clk,
           reset_n                => reset_n,
 
           ADC_FCO                => ADC_FCO,
           ADC_DCO                => ADC_DCO,
           ADC_OUT_CH1            => ADC_OUT_CH1,
           ADC_OUT_CH2            => ADC_OUT_CH2,
           ADC_OUT_CH3            => ADC_OUT_CH3,
           ADC_OUT_CH4            => ADC_OUT_CH4,
           ADC_OUT_CH5            => ADC_OUT_CH5,
           ADC_OUT_CH6            => ADC_OUT_CH6,
           ADC_OUT_CH7            => ADC_OUT_CH7,
           ADC_OUT_CH8            => ADC_OUT_CH8,
           adc_datavalid          => adc_datavalid,
           ADC_DATA_CH1           => ADC_DATA_CH1,
           ADC_DATA_CH2           => ADC_DATA_CH2,
           ADC_DATA_CH3           => ADC_DATA_CH3,
           ADC_DATA_CH4           => ADC_DATA_CH4,
           ADC_DATA_CH5           => ADC_DATA_CH5,
           ADC_DATA_CH6           => ADC_DATA_CH6,
           ADC_DATA_CH7           => ADC_DATA_CH7,          
           ADC_DATA_CH8           => ADC_DATA_CH8
          );
   
    
  end Behavioral;
  