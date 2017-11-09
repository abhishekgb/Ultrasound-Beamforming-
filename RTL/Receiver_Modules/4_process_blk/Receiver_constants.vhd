--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_SIGNED.ALL;

package Receiver_constants is
----------------------------------------------------------------------     
-- Channel Focal point Constant Val
----------------------------------------------------------------------
-- Channel 1 -- for all focal points --
----------------------------------------------------------------------       
CONSTANT CH1_SINE   	: std_logic_vector (15 downto 0) 	:=   x"0000";        --	  x"0001";   --    
CONSTANT CH1_COSINE 	: std_logic_vector (15 downto 0) 	:=   x"7FFF";        --     x"0000";   --
------------------------------------------------------------                     ----------   
-- Channel 2 --                                                                               
------------------------------------------------------------                     ----------   
-- For Focal Point 1 --                                                                       
CONSTANT CH2_FP1_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   -- x"0507";       --    x"0001";   --
CONSTANT CH2_FP1_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   -- x"7FE6";       --    x"0000";   --
-- For Focal Point 2 --                                                                                       
CONSTANT CH2_FP2_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"0507";        --    x"0001";   --
CONSTANT CH2_FP2_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"7FE6";        --    x"0000";   --
-- For Focal Point 3 --                                                                                       
CONSTANT CH2_FP3_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"0F0C";        --    x"0001";   --
CONSTANT CH2_FP3_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"7F1C";        --    x"0000";   --
-- For Focal Point 4 --                                                                                       
CONSTANT CH2_FP4_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"0A0B";        --    x"0001";   --
CONSTANT CH2_FP4_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"7F9A";        --    x"0000";   --
-- For Focal Point 5 --                                                                                       
CONSTANT CH2_FP5_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"0A0B";        --    x"0001";   --
CONSTANT CH2_FP5_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"7F9A";        --    x"0000";   --
-- For Focal Point 6 --                                                                                       
CONSTANT CH2_FP6_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"0F0C";        --    x"0001";   --
CONSTANT CH2_FP6_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"7F1C";        --    x"0000";   --
-- For Focal Point 7 --                                                                                       
CONSTANT CH2_FP7_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"1407";        --    x"0001";   --
CONSTANT CH2_FP7_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"7E6B";        --    x"0000";   --
-- For Focal Point 8 --                                                                                       
CONSTANT CH2_FP8_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"22C0";        --    x"0001";   --
CONSTANT CH2_FP8_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"7B30";        --    x"0000";   --
-- For Focal Point 9 --                                                                                       
CONSTANT CH2_FP9_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"2790";        --    x"0001";   --
CONSTANT CH2_FP9_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"79BA";        --    x"0000";   --
-- For Focal Point 10 --                                                                                      
CONSTANT CH2_FP10_SINE   : std_logic_vector (15 downto 0) :=  x"0001";   --x"30FE";        --    x"0001";   --
CONSTANT CH2_FP10_COSINE : std_logic_vector (15 downto 0) :=  x"0000";   --x"7640";        --    x"0000";   --
------------------------------------------------------------ ---------                         ----------     
-- Channel 3 --                                                                                               
------------------------------------------------------------ ---------                         ----------     
-- For Focal Point 1 --                                                                                       
CONSTANT CH3_FP1_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"0DE3";        --    x"0001";   --
CONSTANT CH3_FP1_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0061";        --    x"0000";   --
-- For Focal Point 2 --                                                                                       
CONSTANT CH3_FP2_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"1155";        --    x"0001";   --
CONSTANT CH3_FP2_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0097";        --    x"0000";   --
-- For Focal Point 3 --                                                                                       
CONSTANT CH3_FP3_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"1835";        --    x"0001";   --
CONSTANT CH3_FP3_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0128";        --    x"0000";   --
-- For Focal Point 4 --                                                                                       
CONSTANT CH3_FP4_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"1BA2";        --    x"0001";   --
CONSTANT CH3_FP4_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0182";        --    x"0000";   --
-- For Focal Point 5 --                                                                                       
CONSTANT CH3_FP5_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"275D";        --    x"0001";   --
CONSTANT CH3_FP5_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"3CE6";        --    x"0000";   --
-- For Focal Point 6 --                                                                                       
CONSTANT CH3_FP6_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"D3B6";        --    x"0001";   --
CONSTANT CH3_FP6_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"03F4";        --    x"0000";   --
-- For Focal Point 7 --                                                                                       
CONSTANT CH3_FP7_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"3449";        --    x"0001";   --
CONSTANT CH3_FP7_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0595";        --    x"0000";   --
-- For Focal Point 8 --                                                                                       
CONSTANT CH3_FP8_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"3F30";        --    x"0001";   --
CONSTANT CH3_FP8_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0857";        --    x"0000";   --
-- For Focal Point 9 --                                                                                       
CONSTANT CH3_FP9_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"47F8";        --    x"0001";   --
CONSTANT CH3_FP9_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0B13";        --    x"0000";   --
-- For Focal Point 10 --                                                                                      
CONSTANT CH3_FP10_SINE   : std_logic_vector (15 downto 0) :=  x"0001";   --x"533D";        --    x"0001";   --
CONSTANT CH3_FP10_COSINE : std_logic_vector (15 downto 0) :=  x"0000";   --x"0F61";        --    x"0000";   --
------------------------------------------------------------ ---------                         ----------     
-- Channel 4 --                                                                                               
------------------------------------------------------------ ---------                         ----------     
-- For Focal Point 1 --                                                                                       
CONSTANT CH4_FP1_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"10A7";        --    x"0001";   --
CONSTANT CH4_FP1_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"008B";        --    x"0000";   --
-- For Focal Point 2 --                                                                                       
CONSTANT CH4_FP2_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"14C6";        --    x"0001";   --
CONSTANT CH4_FP2_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"00D9";        --    x"0000";   --
-- For Focal Point 3 --                                                                                       
CONSTANT CH4_FP3_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"1CF9";        --    x"0001";   --
CONSTANT CH4_FP3_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0169";        --    x"0000";   --
-- For Focal Point 4 --                                                                                       
CONSTANT CH4_FP4_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"210B";        --    x"0001";   --
CONSTANT CH4_FP4_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"022B";        --    x"0000";   --
-- For Focal Point 5 --                                                                                       
CONSTANT CH4_FP5_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"2EE6";        --    x"0001";   --
CONSTANT CH4_FP5_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0973";        --    x"0000";   --
-- For Focal Point 6 --                                                                                       
CONSTANT CH4_FP6_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"34A9";        --    x"0001";   --
CONSTANT CH4_FP6_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"05AB";        --    x"0000";   --
-- For Focal Point 7 --                                                                                       
CONSTANT CH4_FP7_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"3DEC";        --    x"0001";   --
CONSTANT CH4_FP7_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"07FD";        --    x"0000";   --
-- For Focal Point 8 --                                                                                       
CONSTANT CH4_FP8_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"4A54";        --    x"0001";   --
CONSTANT CH4_FP8_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0BE5";        --    x"0000";   --
-- For Focal Point 9 --                                                                                       
CONSTANT CH4_FP9_SINE   : std_logic_vector (15 downto 0) :=   x"0001";   --x"5413";        --    x"0001";   --
CONSTANT CH4_FP9_COSINE : std_logic_vector (15 downto 0) :=   x"0000";   --x"0FBE";        --    x"0000";   --
-- For Focal Point 10 --                                                                                      
CONSTANT CH4_FP10_SINE   : std_logic_vector (15 downto 0) :=  x"0001";   --x"6023";        --    x"0001";   --
CONSTANT CH4_FP10_COSINE : std_logic_vector (15 downto 0) :=  x"0000";   --x"15BF";        --    x"0000";   --
------------------------------------------------------------ ----------                    


end Receiver_constants;

package body Receiver_constants is


end Receiver_constants;
