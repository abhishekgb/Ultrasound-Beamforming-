--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: usb_fifo.vhd
-- /___/   /\     Timestamp: Mon Jun 02 12:20:59 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -w -sim -ofmt vhdl "E:/testing code/backup/19_5_14/RTL/Receiver_Modules/13_USB_Fifo/tmp/_cg/usb_fifo.ngc" "E:/testing code/backup/19_5_14/RTL/Receiver_Modules/13_USB_Fifo/tmp/_cg/usb_fifo.vhd" 
-- Device	: 5vlx50ff676-1
-- Input file	: E:/testing code/backup/19_5_14/RTL/Receiver_Modules/13_USB_Fifo/tmp/_cg/usb_fifo.ngc
-- Output file	: E:/testing code/backup/19_5_14/RTL/Receiver_Modules/13_USB_Fifo/tmp/_cg/usb_fifo.vhd
-- # of Entities	: 2
-- Design Name	: usb_fifo
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity reset_builtin is
  port (
    CLK : in STD_LOGIC := 'X'; 
    RST : in STD_LOGIC := 'X'; 
    RD_CLK : in STD_LOGIC := 'X'; 
    INT_CLK : in STD_LOGIC := 'X'; 
    WR_CLK : in STD_LOGIC := 'X'; 
    RD_RST_I : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
    WR_RST_I : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
    INT_RST_I : out STD_LOGIC_VECTOR ( 1 downto 0 ) 
  );
end reset_builtin;

architecture STRUCTURE of reset_builtin is
  signal rd_rst_reg_22 : STD_LOGIC; 
  signal wr_rst_reg_28 : STD_LOGIC; 
  signal NlwRenamedSig_OI_INT_RST_I : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal NlwRenamedSignal_RD_RST_I : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal power_on_rd_rst : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal power_on_wr_rst : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal rd_rst_fb : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal wr_rst_fb : STD_LOGIC_VECTOR ( 4 downto 0 ); 
begin
  RD_RST_I(1) <= NlwRenamedSignal_RD_RST_I(0);
  RD_RST_I(0) <= NlwRenamedSignal_RD_RST_I(0);
  INT_RST_I(1) <= NlwRenamedSig_OI_INT_RST_I(0);
  INT_RST_I(0) <= NlwRenamedSig_OI_INT_RST_I(0);
  XST_GND : GND
    port map (
      G => NlwRenamedSig_OI_INT_RST_I(0)
    );
  rd_rst_reg : FDPE
    generic map(
      INIT => '0'
    )
    port map (
      C => RD_CLK,
      CE => rd_rst_fb(0),
      D => NlwRenamedSig_OI_INT_RST_I(0),
      PRE => RST,
      Q => rd_rst_reg_22
    );
  wr_rst_fb_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => WR_CLK,
      D => wr_rst_fb(1),
      Q => wr_rst_fb(0)
    );
  wr_rst_fb_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => WR_CLK,
      D => wr_rst_fb(2),
      Q => wr_rst_fb(1)
    );
  wr_rst_fb_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => WR_CLK,
      D => wr_rst_fb(3),
      Q => wr_rst_fb(2)
    );
  wr_rst_fb_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => WR_CLK,
      D => wr_rst_fb(4),
      Q => wr_rst_fb(3)
    );
  wr_rst_fb_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => WR_CLK,
      D => wr_rst_reg_28,
      Q => wr_rst_fb(4)
    );
  power_on_rd_rst_0 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => RD_CLK,
      D => power_on_rd_rst(1),
      Q => power_on_rd_rst(0)
    );
  power_on_rd_rst_1 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => RD_CLK,
      D => power_on_rd_rst(2),
      Q => power_on_rd_rst(1)
    );
  power_on_rd_rst_2 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => RD_CLK,
      D => power_on_rd_rst(3),
      Q => power_on_rd_rst(2)
    );
  power_on_rd_rst_3 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => RD_CLK,
      D => power_on_rd_rst(4),
      Q => power_on_rd_rst(3)
    );
  power_on_rd_rst_4 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => RD_CLK,
      D => power_on_rd_rst(5),
      Q => power_on_rd_rst(4)
    );
  power_on_rd_rst_5 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => RD_CLK,
      D => NlwRenamedSig_OI_INT_RST_I(0),
      Q => power_on_rd_rst(5)
    );
  power_on_wr_rst_0 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => WR_CLK,
      D => power_on_wr_rst(1),
      Q => power_on_wr_rst(0)
    );
  power_on_wr_rst_1 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => WR_CLK,
      D => power_on_wr_rst(2),
      Q => power_on_wr_rst(1)
    );
  power_on_wr_rst_2 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => WR_CLK,
      D => power_on_wr_rst(3),
      Q => power_on_wr_rst(2)
    );
  power_on_wr_rst_3 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => WR_CLK,
      D => power_on_wr_rst(4),
      Q => power_on_wr_rst(3)
    );
  power_on_wr_rst_4 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => WR_CLK,
      D => power_on_wr_rst(5),
      Q => power_on_wr_rst(4)
    );
  power_on_wr_rst_5 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => WR_CLK,
      D => NlwRenamedSig_OI_INT_RST_I(0),
      Q => power_on_wr_rst(5)
    );
  wr_rst_reg : FDPE
    generic map(
      INIT => '0'
    )
    port map (
      C => WR_CLK,
      CE => wr_rst_fb(0),
      D => NlwRenamedSig_OI_INT_RST_I(0),
      PRE => RST,
      Q => wr_rst_reg_28
    );
  rd_rst_fb_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => RD_CLK,
      D => rd_rst_fb(1),
      Q => rd_rst_fb(0)
    );
  rd_rst_fb_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => RD_CLK,
      D => rd_rst_fb(2),
      Q => rd_rst_fb(1)
    );
  rd_rst_fb_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => RD_CLK,
      D => rd_rst_fb(3),
      Q => rd_rst_fb(2)
    );
  rd_rst_fb_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => RD_CLK,
      D => rd_rst_fb(4),
      Q => rd_rst_fb(3)
    );
  rd_rst_fb_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => RD_CLK,
      D => rd_rst_reg_22,
      Q => rd_rst_fb(4)
    );
  RD_RST_I_1_1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => rd_rst_reg_22,
      I1 => power_on_rd_rst(0),
      O => NlwRenamedSignal_RD_RST_I(0)
    );

end STRUCTURE;

-- synthesis translate_on

-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity usb_fifo is
  port (
    rd_en : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    empty : out STD_LOGIC; 
    wr_en : in STD_LOGIC := 'X'; 
    rd_clk : in STD_LOGIC := 'X'; 
    valid : out STD_LOGIC; 
    full : out STD_LOGIC; 
    wr_clk : in STD_LOGIC := 'X'; 
    prog_full : out STD_LOGIC; 
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    din : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end usb_fifo;

architecture STRUCTURE of usb_fifo is
  component reset_builtin
    port (
      CLK : in STD_LOGIC := 'X'; 
      RST : in STD_LOGIC := 'X'; 
      RD_CLK : in STD_LOGIC := 'X'; 
      INT_CLK : in STD_LOGIC := 'X'; 
      WR_CLK : in STD_LOGIC := 'X'; 
      RD_RST_I : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
      WR_RST_I : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
      INT_RST_I : out STD_LOGIC_VECTOR ( 1 downto 0 ) 
    );
  end component;
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_VALID_32 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_as_reg_53 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_d1_54 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_d2_55 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_4_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_as_reg_65 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_d1_66 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_d2_67 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_as_reg_80 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_d1_81 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_d2_82 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_4_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_as_reg_92 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_d1_93 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_d2_94 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_as_reg_107 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_d1_108 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_d2_109 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_4_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_as_reg_119 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_d1_120 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_d2_121 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_0_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_as_reg_134 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_d1_135 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_d2_136 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_1_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_4_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_as_reg_146 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_d1_147 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_d2_148 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_rd_tmp : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_wr_ack_i : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_RD_RST_I_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_WR_RST_I_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_WR_RST_I_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_INT_RST_I_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_INT_RST_I_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED : STD_LOGIC;
 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp : STD_LOGIC_VECTOR ( 4 downto 1 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful : STD_LOGIC_VECTOR ( 4 downto 1 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf : STD_LOGIC_VECTOR ( 4 downto 1 ); 
begin
  valid <= U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_VALID_32;
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt : reset_builtin
    port map (
      CLK => N0,
      RST => rst,
      RD_CLK => rd_clk,
      INT_CLK => N0,
      WR_CLK => wr_clk,
      RD_RST_I(1) => NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_RD_RST_I_1_UNCONNECTED,
      RD_RST_I(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      WR_RST_I(1) => NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_WR_RST_I_1_UNCONNECTED,
      WR_RST_I(0) => NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_WR_RST_I_0_UNCONNECTED,
      INT_RST_I(1) => NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_INT_RST_I_1_UNCONNECTED,
      INT_RST_I(0) => NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rstbt_INT_RST_I_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_3_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_2_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_3_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_3_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_2_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_1_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_2_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_2_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_2_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_1_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_wr_ack_i,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf(1),
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_1_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(1),
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => din(3),
      DI(2) => din(2),
      DI(1) => din(1),
      DI(0) => din(0),
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_1_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => FALSE,
      ALMOST_EMPTY_OFFSET => X"0005"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_rd_tmp,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_3_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => rd_clk,
      RDCLKL => rd_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => rd_clk,
      RDRCLKL => rd_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(1),
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_4_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_d_3_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => dout(3),
      DO(2) => dout(2),
      DO(1) => dout(1),
      DO(0) => dout(0),
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_3_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_2_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_3_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_3_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_2_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_1_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_2_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_2_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_2_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_1_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_wr_ack_i,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf(2),
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_1_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(2),
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => din(7),
      DI(2) => din(6),
      DI(1) => din(5),
      DI(0) => din(4),
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_1_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => FALSE,
      ALMOST_EMPTY_OFFSET => X"0005"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_rd_tmp,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_3_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => rd_clk,
      RDCLKL => rd_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => rd_clk,
      RDRCLKL => rd_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(2),
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_4_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_d_3_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => dout(7),
      DO(2) => dout(6),
      DO(1) => dout(5),
      DO(0) => dout(4),
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_3_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_2_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_3_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_3_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_2_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_1_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_2_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_2_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_2_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_1_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_wr_ack_i,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf(3),
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_1_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(3),
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => din(11),
      DI(2) => din(10),
      DI(1) => din(9),
      DI(0) => din(8),
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_1_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => FALSE,
      ALMOST_EMPTY_OFFSET => X"0005"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_rd_tmp,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_3_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => rd_clk,
      RDCLKL => rd_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => rd_clk,
      RDRCLKL => rd_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(3),
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_4_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_d_3_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => dout(11),
      DO(2) => dout(10),
      DO(1) => dout(9),
      DO(0) => dout(8),
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_3_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_2_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_3_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_3_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_3_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_2_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_1_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_2_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_2_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_2_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_2_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => TRUE,
      ALMOST_EMPTY_OFFSET => X"000A"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_1_Q,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_wr_ack_i,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => wr_clk,
      RDCLKL => wr_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => wr_clk,
      RDRCLKL => wr_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf(4),
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_1_Q,
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(4),
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => din(15),
      DI(2) => din(14),
      DI(1) => din(13),
      DI(0) => din(12),
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_3_Q,
      DO(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_2_Q,
      DO(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_1_Q,
      DO(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_1_0_Q,
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_1_gbldc_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36 : FIFO36_EXP
    generic map(
      ALMOST_FULL_OFFSET => X"000A",
      SIM_MODE => "SAFE",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_SYN => FALSE,
      FIRST_WORD_FALL_THROUGH => FALSE,
      ALMOST_EMPTY_OFFSET => X"0005"
    )
    port map (
      RDEN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_rd_tmp,
      WREN => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_3_Q,
      RST => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      RDCLKU => rd_clk,
      RDCLKL => rd_clk,
      WRCLKU => wr_clk,
      WRCLKL => wr_clk,
      RDRCLKU => rd_clk,
      RDRCLKL => rd_clk,
      ALMOSTEMPTY => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTEMPTY_UNCONNECTED,
      ALMOSTFULL => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_ALMOSTFULL_UNCONNECTED,
      EMPTY => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(4),
      FULL => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_4_Q,
      RDERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDERR_UNCONNECTED,
      WRERR => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRERR_UNCONNECTED,
      DI(31) => N0,
      DI(30) => N0,
      DI(29) => N0,
      DI(28) => N0,
      DI(27) => N0,
      DI(26) => N0,
      DI(25) => N0,
      DI(24) => N0,
      DI(23) => N0,
      DI(22) => N0,
      DI(21) => N0,
      DI(20) => N0,
      DI(19) => N0,
      DI(18) => N0,
      DI(17) => N0,
      DI(16) => N0,
      DI(15) => N0,
      DI(14) => N0,
      DI(13) => N0,
      DI(12) => N0,
      DI(11) => N0,
      DI(10) => N0,
      DI(9) => N0,
      DI(8) => N0,
      DI(7) => N0,
      DI(6) => N0,
      DI(5) => N0,
      DI(4) => N0,
      DI(3) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_3_Q,
      DI(2) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_2_Q,
      DI(1) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_1_Q,
      DI(0) => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_d_3_0_Q,
      DIP(3) => N0,
      DIP(2) => N0,
      DIP(1) => N0,
      DIP(0) => N0,
      DO(31) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_31_UNCONNECTED,
      DO(30) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_30_UNCONNECTED,
      DO(29) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_29_UNCONNECTED,
      DO(28) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_28_UNCONNECTED,
      DO(27) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_27_UNCONNECTED,
      DO(26) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_26_UNCONNECTED,
      DO(25) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_25_UNCONNECTED,
      DO(24) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_24_UNCONNECTED,
      DO(23) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_23_UNCONNECTED,
      DO(22) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_22_UNCONNECTED,
      DO(21) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_21_UNCONNECTED,
      DO(20) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_20_UNCONNECTED,
      DO(19) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_19_UNCONNECTED,
      DO(18) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_18_UNCONNECTED,
      DO(17) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_17_UNCONNECTED,
      DO(16) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_16_UNCONNECTED,
      DO(15) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_15_UNCONNECTED,
      DO(14) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_14_UNCONNECTED,
      DO(13) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_13_UNCONNECTED,
      DO(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_12_UNCONNECTED,
      DO(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_11_UNCONNECTED,
      DO(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_10_UNCONNECTED,
      DO(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_9_UNCONNECTED,
      DO(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_8_UNCONNECTED,
      DO(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_7_UNCONNECTED,
      DO(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_6_UNCONNECTED,
      DO(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_5_UNCONNECTED,
      DO(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DO_4_UNCONNECTED,
      DO(3) => dout(15),
      DO(2) => dout(14),
      DO(1) => dout(13),
      DO(0) => dout(12),
      DOP(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_3_UNCONNECTED,
      DOP(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_2_UNCONNECTED,
      DOP(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_1_UNCONNECTED,
      DOP(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_DOP_0_UNCONNECTED,
      RDCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_12_UNCONNECTED,
      RDCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_11_UNCONNECTED,
      RDCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_10_UNCONNECTED,
      RDCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_9_UNCONNECTED,
      RDCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_8_UNCONNECTED,
      RDCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_7_UNCONNECTED,
      RDCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_6_UNCONNECTED,
      RDCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_5_UNCONNECTED,
      RDCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_4_UNCONNECTED,
      RDCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_3_UNCONNECTED,
      RDCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_2_UNCONNECTED,
      RDCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_1_UNCONNECTED,
      RDCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_RDCOUNT_0_UNCONNECTED,
      WRCOUNT(12) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_12_UNCONNECTED,
      WRCOUNT(11) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_11_UNCONNECTED,
      WRCOUNT(10) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_10_UNCONNECTED,
      WRCOUNT(9) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_9_UNCONNECTED,
      WRCOUNT(8) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_8_UNCONNECTED,
      WRCOUNT(7) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_7_UNCONNECTED,
      WRCOUNT(6) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_6_UNCONNECTED,
      WRCOUNT(5) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_5_UNCONNECTED,
      WRCOUNT(4) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_4_UNCONNECTED,
      WRCOUNT(3) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_3_UNCONNECTED,
      WRCOUNT(2) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_2_UNCONNECTED,
      WRCOUNT(1) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_1_UNCONNECTED,
      WRCOUNT(0) => 
NLW_U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_gchain_gp1_4_gbldl_inst_prim_gfn72_sngfifo36_WRCOUNT_0_UNCONNECTED
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_d2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_d1_66,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_d2_67
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_d1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_as_reg_53,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_d1_54
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_as_reg : FDCPE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_d2_67,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => N0,
      PRE => N0,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_as_reg_65
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_d2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_d1_54,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_d2_55
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_as_reg : FDCPE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_d2_55,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => N0,
      PRE => N0,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_dbr_as_reg_53
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_d1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_as_reg_65,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_sbr_d1_66
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_d2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_d1_93,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_d2_94
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_d1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_as_reg_80,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_d1_81
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_as_reg : FDCPE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_d2_94,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => N0,
      PRE => N0,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_as_reg_92
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_d2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_d1_81,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_d2_82
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_as_reg : FDCPE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_d2_82,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => N0,
      PRE => N0,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_dbr_as_reg_80
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_d1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_as_reg_92,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_sbr_d1_93
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_d2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_d1_120,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_d2_121
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_d1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_as_reg_107,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_d1_108
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_as_reg : FDCPE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_d2_121,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => N0,
      PRE => N0,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_as_reg_119
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_d2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_d1_108,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_d2_109
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_as_reg : FDCPE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_d2_109,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => N0,
      PRE => N0,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_dbr_as_reg_107
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_d1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_as_reg_119,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_sbr_d1_120
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_d2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_d1_147,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_d2_148
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_d1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_as_reg_134,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_d1_135
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_as_reg : FDCPE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_d2_148,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => N0,
      PRE => N0,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_as_reg_146
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_d2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_d1_135,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_d2_136
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_as_reg : FDCPE
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_d2_136,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => N0,
      PRE => N0,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_dbr_as_reg_134
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_d1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_as_reg_146,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_sbr_d1_147
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_VALID : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => rd_clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_rd_rst_i(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_rd_tmp,
      Q => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_VALID_32
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_PROG_FULL1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf(2),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf(1),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf(4),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_pf(3),
      O => prog_full
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_3_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_3_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_4_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_3_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_2_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_2_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_3_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_2_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_1_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_emp_1_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_ful_2_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_4_inst_extd_e_1_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_3_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_3_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_4_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_3_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_2_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_2_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_3_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_2_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_1_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_emp_1_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_ful_2_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_3_inst_extd_e_1_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_3_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_3_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_4_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_3_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_2_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_2_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_3_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_2_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_1_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_emp_1_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_ful_2_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_2_inst_extd_e_1_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_3_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_3_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_4_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_3_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_2_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_2_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_3_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_2_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_1_not00001 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_emp_1_Q,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_ful_2_Q,
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_gextw_1_inst_extd_e_1_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_empty_i1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(2),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(1),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(4),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(3),
      O => empty
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_full_i1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(2),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(1),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(4),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(3),
      O => full
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_wr_ack_i1 : LUT5
    generic map(
      INIT => X"00000002"
    )
    port map (
      I0 => wr_en,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(3),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(4),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(1),
      I4 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_ful(2),
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_wr_ack_i
    );
  U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_rd_tmp1 : LUT5
    generic map(
      INIT => X"00000002"
    )
    port map (
      I0 => rd_en,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(3),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(4),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(1),
      I4 => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_emp(2),
      O => U0_xst_fifo_generator_gconvfifo_rf_gbiv5_bi_v5_fifo_fblk_rd_tmp
    );

end STRUCTURE;

-- synthesis translate_on
