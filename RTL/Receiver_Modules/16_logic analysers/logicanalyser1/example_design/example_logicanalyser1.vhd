------------------------------------------------------------------------------
--$Date: 2011/07/18 06:12:03 $
--$RCSfile: example_design_vhd.ejava,v $
--$Revision: 1.3 $
------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version : 1.05
--  \   \         Application : ILA V1.05a
--  /   /         Filename : example_logicanalyser1.vhd
-- /___/   /\     
-- \   \  /  \ 
--  \___\/\___\
--
-- (c) Copyright 2010 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.

-- Library Declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.vcomponents.all;

--The example module here illustrates how ila core can be instantiated in
--a user design. This helps the user on how various ports selected for the core can be used.

-- Entity Declaration
entity example_logicanalyser1 is
  port (
    clk_i : in std_logic
    );
end example_logicanalyser1;

-- Architecture Declaration
architecture ila_arch of example_logicanalyser1 is

  ---------------------------------------------------------------------
  --
  --  ICON component declaration
  --
  ---------------------------------------------------------------------

  component chipscope_icon
    port (
      CONTROL0	: inout std_logic_vector(35 downto 0)
      );
  end component;


  ---------------------------------------------------------------------
  -- 
  --  ILA component declaration
  --
  ---------------------------------------------------------------------

  component logicanalyser1
    port (
      CONTROL	: inout std_logic_vector(35 downto 0);
      CLK	:  in  std_logic;
      DATA	:  in std_logic_vector(111 downto 0);
      TRIG0	:  in std_logic_vector(1 downto 0)
      );
  end component;


  ---------------------------------------------------------------------
  --
  --  Shift Reg component declaration
  --
  ---------------------------------------------------------------------
  component shift_reg
    generic (
      WIDTH    : integer := 8
    );
    port (
      clk_in       : in std_logic;
      en_in        : in std_logic;
      en_out       : out std_logic;
      shiftout     : out std_logic_vector(WIDTH-1 downto 0)
      );
  end component;

  -----------------------------------------------------------------------
  --  Constant Declaration
  -----------------------------------------------------------------------
  constant C_NUM_OF_TRIGPORTS   : integer       := 1;
  constant C_TRIG0_SIZE         : integer	:= 2;


  -----------------------------------------------------------------------
  --  Local Signals
  -----------------------------------------------------------------------
  signal clk_o                 : std_logic;
  signal control_0             : std_logic_vector (35 downto 0);
  signal trig_0	: std_logic_vector(C_TRIG0_SIZE-1 downto 0);
  signal en_out_int	: std_logic_vector(C_NUM_OF_TRIGPORTS downto 0) ;
  signal data	: std_logic_vector (111 downto 0);
  signal val	: std_logic_vector (111 downto 0);



begin
   
  bufg_inst : BUFG
    port map(
      O          => clk_o,
      I          => clk_i
      );
  -------------------------------------------------------------------
  --  For TRIG0
  -------------------------------------------------------------------
  -- This shift register takes enable_in and registers enable_out. Size of 
  -- shift register is given as TRIG0 width. Output of shift register 
  -- is mapped to TRIG0.en_out of this shift_reg instance can be used as
  -- en_in for next shift_reg instance. 

  -- Enabling First shift register
  en_out_int(0) <= '1';

  SHIFT_REG_I_0 : shift_reg
    generic map (
      WIDTH => C_TRIG0_SIZE
      )
    port map (
      clk_in	=> clk_o,
      en_in	=> en_out_int(0),
      en_out	=> en_out_int(1),
      shiftout	=> trig_0
      );



  -------------------------------------------------------------------
  --
  --  If Trigout port is selected
  --
  -------------------------------------------------------------------


  -------------------------------------------------------------------
  --
  --  If Data not same as trigger
  --
  -------------------------------------------------------------------
  -- ILA cores capture and store trace data information using on-chip block RAM resources.
  -- In this example, johnson counter(where the output from the last stage is inverted 
  -- and fed back as input to the first stage) operation can be observed on data port.
  data <= val;

  process (clk_o)
  begin
    if (clk_o'event and clk_o='1') then
      val <= (val(110 downto 0) & (not val(111)));
    end if;
  end process;

  -------------------------------------------------------------------
  --
  --  ICON Pro core instance
  --
  -------------------------------------------------------------------
  -- Icon core is instantiated to connect to ILA core.
  ICON_inst : chipscope_icon  
    port map(
      CONTROL0 => control_0 -- INOUT BUS [35:0]
      );


  
  -------------------------------------------------------------------
  --
  --  ILA Pro core instance
  --
  -------------------------------------------------------------------
  -- When this design is run on analyzer, shift operation is observed on each trigger port.
  -- The pulse width is different for any two trigger ports. If Data port is selected, 
  -- Johnson Counter operation can be observed on Data port. If Trig_out port is selected,
  -- shift operation can be viewed on VIO core. 


  ILA_inst : logicanalyser1
    port map (
      CONTROL	=> control_0,	-- INOUT BUS (35:0)
      CLK	=> clk_o,	-- IN
      DATA	=> data,	-- DATA (111:0);
      TRIG0	=> trig_0	-- IN BUS (1:0) 
      );


end ila_arch;

-- Library Declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.vcomponents.all;
-- -------------------------------------------------------------------
--   Shift Register module
-- -------------------------------------------------------------------
-- Shift register module is a ring counter logic along with en_in and en_out. 
-- This logic generates walking one pattern of given width when en_in is '1'. 
-- en_out is MSB of the shiftout. Width of shift register is parameterized 
-- and default width is specified as '8'. If the width is '1', toggle pattern is generated.

entity shift_reg is
  generic (
    WIDTH : integer := 8
    );
  port (
    clk_in          : in std_logic;
    en_in        : in std_logic;
    en_out       : out std_logic;
    shiftout     : out std_logic_vector(WIDTH-1 downto 0)
    );
end shift_reg;

architecture bhv of shift_reg is

  signal val        : std_logic_vector(WIDTH-1 downto 0) := (0=>'1', OTHERS=>'0');
  signal en_out_reg : std_logic;
 
  begin 

  shiftout <= val;
  
  -- One shot enable
  en_out <= (val(WIDTH-1) and (not(en_out_reg)));

  -- Ring Counter logic
  RING_CNT_GEN :  if (WIDTH > 1) generate
    begin
      process (clk_in)
      begin
        if (clk_in'event and clk_in='1') then
          if(en_in = '1') then
            val <= (val(WIDTH-2 downto 0) & val(WIDTH-1));
          end if;
        end if;
      end process;
    end generate RING_CNT_GEN;

  -- Toggle logic
  TOGGLE_GEN :  if (WIDTH = 1) generate
    begin
      process (clk_in)
      begin
        if (clk_in'event and clk_in='1') then
          if(en_in = '1') then
            val <= not val;
          end if;
        end if;
      end process;
    end generate TOGGLE_GEN;

 
  -- Registering enable out
  process (clk_in)
  begin
    if (clk_in'event and clk_in='1') then
        en_out_reg <= val(WIDTH-1);
    end if;
  end process;
end bhv;
