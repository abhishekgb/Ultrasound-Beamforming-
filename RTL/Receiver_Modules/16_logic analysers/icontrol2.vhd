-------------------------------------------------------------------------------
-- Copyright (c) 2014 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.4
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : icontrol2.vhd
-- /___/   /\     Timestamp  : Thu Jan 09 16:10:39 India Standard Time 2014
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY icontrol2 IS
  port (
    CONTROL0: inout std_logic_vector(35 downto 0));
END icontrol2;

ARCHITECTURE icontrol2_a OF icontrol2 IS
BEGIN

END icontrol2_a;
