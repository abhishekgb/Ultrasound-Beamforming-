----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:49 03/10/2014 
-- Design Name: 
-- Module Name:    Adder_module - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_module is
    Port ( 
				clk_in				: in std_logic; 
				reset_in				: in std_logic;
				ch1 					: in  STD_LOGIC_VECTOR (31 downto 0);
				ch2 					: in  STD_LOGIC_VECTOR (31 downto 0);
				ch3					: in  STD_LOGIC_VECTOR (31 downto 0);
				ch4 					: in  STD_LOGIC_VECTOR (31 downto 0);
				ch5 					: in  STD_LOGIC_VECTOR (31 downto 0);
				ch6 					: in  STD_LOGIC_VECTOR (31 downto 0);
				ch7 					: in  STD_LOGIC_VECTOR (31 downto 0);
				ch8 					: in  STD_LOGIC_VECTOR (31 downto 0);
				add_output 			: out STD_LOGIC_VECTOR (15 downto 0);
				add_valid_in		: in std_logic;
				add_valid_out		: out std_logic;
				add_carry_in 		: in std_logic;
				add_carry_out 		: out std_logic
	 );

end Adder_module;

architecture Behavioral of Adder_module is
-----------------------------------------------------------
--stage1--
----------------------------------------------------------
signal add_output_1_1 	: STD_LOGIC_VECTOR (32 downto 0);
signal add_output_1_2 	: STD_LOGIC_VECTOR (32 downto 0);
signal add_output_1_3 	: STD_LOGIC_VECTOR (32 downto 0);
signal add_output_1_4 	: STD_LOGIC_VECTOR (32 downto 0);

signal valid_out_1_1 	: STD_LOGIC;
signal valid_out_1_2 	: STD_LOGIC;
signal valid_stage_1_1 	: STD_LOGIC;

signal valid_out_1_3 	: STD_LOGIC;
signal valid_out_1_4 	: STD_LOGIC;
signal valid_stage_1_2 	: STD_LOGIC;

signal carry_out_1_1 	: STD_LOGIC;
signal carry_out_1_2 	: STD_LOGIC;
signal carry_stage_1_1 	: STD_LOGIC;

signal carry_out_1_3 	: STD_LOGIC;
signal carry_out_1_4 	: STD_LOGIC;
signal carry_stage_1_2 	: STD_LOGIC;
----------------------------------------------------------
--stage2--
----------------------------------------------------------
signal add_output_2_1 	: STD_LOGIC_VECTOR (33 downto 0);
signal add_output_2_2 	: STD_LOGIC_VECTOR (33 downto 0);

signal valid_out_2_1 	: STD_LOGIC;
signal valid_out_2_2 	: STD_LOGIC;
signal valid_stage_2_1 	: STD_LOGIC;

signal carry_out_2_1 	: STD_LOGIC;
signal carry_out_2_2 	: STD_LOGIC;
signal carry_stage_2_1 	: STD_LOGIC;

signal sig_add_output_final 	: STD_LOGIC_VECTOR (34 downto 0); 

----------------------------------------------------------
--component declation--
----------------------------------------------------------


component  add_module_stage1 
    Port ( 
				clk_in		: in std_logic; 
				reset_in		: in std_logic;
				input1 		: in  STD_LOGIC_VECTOR (31 downto 0);
				input2 		: in  STD_LOGIC_VECTOR (31 downto 0);
				output_sum 	: out STD_LOGIC_VECTOR (32 downto 0);
				valid_in		: in std_logic;
				valid_out	: out std_logic;
				carry_in 	: in std_logic;
				carry_out 	: out std_logic
	 );
end component;

component  add_module_stage2 
    Port ( 
				clk_in		: in std_logic; 
				reset_in		: in std_logic;
				input1 		: in  STD_LOGIC_VECTOR (32 downto 0);
				input2 		: in  STD_LOGIC_VECTOR (32 downto 0);
				output_sum 	: out STD_LOGIC_VECTOR (33 downto 0);
				valid_in		: in std_logic;
				valid_out	: out std_logic;
				carry_in 	: in std_logic;
				carry_out 	: out std_logic
	 );
end component;

component  add_module_stage3 
    Port ( 
				clk_in		: in std_logic; 
				reset_in		: in std_logic;
				input1 		: in  STD_LOGIC_VECTOR (33 downto 0);
				input2 		: in  STD_LOGIC_VECTOR (33 downto 0);
				output_sum 	: out STD_LOGIC_VECTOR (34 downto 0);
				valid_in		: in std_logic;
				valid_out	: out std_logic;
				carry_in 	: in std_logic;
				carry_out 	: out std_logic
	 );
end component;

begin


-----------------------------------------------------------------
-- stage 1 --
-----------------------------------------------------------------
	add_1_1 : add_module_stage1
    Port map( 
				clk_in		=> clk_in,						 
				reset_in		=> reset_in,                          
				input1 		=> ch1, 		                         
				input2 		=> ch2, 		                         
				output_sum 	=> add_output_1_1,                  
				valid_in		=> add_valid_in,	                  
				valid_out	=> valid_out_1_1,	                  
				carry_in 	=> '0', 	                           
				carry_out 	=> carry_out_1_1 	                  
	 );                                                      
                                                            
	add_1_2 : add_module_stage1                                     
    Port map(                                               
				clk_in		=> clk_in,                
				reset_in		=> reset_in,                         
				input1 		=> ch3, 		                        
				input2 		=> ch4, 		                        
				output_sum 	=> add_output_1_2,                   
				valid_in		=> add_valid_in,	                   
				valid_out	=> valid_out_1_2,	                  
				carry_in 	=> '0', 	
				carry_out 	=> carry_out_1_2 	
	 );

carry_stage_1_1 <= carry_out_1_1 or carry_out_1_2;
valid_stage_1_1 <= valid_out_1_1 and valid_out_1_2;

	add_1_3 : add_module_stage1
    Port map( 
				clk_in		=> clk_in,
				reset_in		=> reset_in,
				input1 		=> ch5, 		
				input2 		=> ch6, 		
				output_sum 	=> add_output_1_3, 
				valid_in		=> add_valid_in,	
				valid_out	=> valid_out_1_3,	
				carry_in 	=> '0', 	
				carry_out 	=> carry_out_1_3  	
	 );

	add_1_4 : add_module_stage1
    Port map( 
				clk_in		=> clk_in,
				reset_in		=> reset_in,
				input1 		=> ch7, 		
				input2 		=> ch8, 		
				output_sum 	=> add_output_1_4, 
				valid_in		=> add_valid_in,	
				valid_out	=> valid_out_1_4,	
				carry_in 	=> '0',	
				carry_out 	=> carry_out_1_4 	
	 );

carry_stage_1_2 <= carry_out_1_3 or carry_out_1_4;
valid_stage_1_2 <= valid_out_1_3 and valid_out_1_4;
-----------------------------------------------------------------
-- stage 2 --
-----------------------------------------------------------------
	add_2_1 : add_module_stage2
    Port map( 
				clk_in		=> clk_in,
				reset_in		=> reset_in,
				input1 		=> add_output_1_1, 		
				input2 		=> add_output_1_2, 		
				output_sum 	=> add_output_2_1, 
				valid_in		=> valid_stage_1_1,	
				valid_out	=> valid_out_2_1,						  	
				carry_in 	=> carry_stage_1_1, 	              	
				carry_out 	=> carry_out_2_1 	                
	 );                                                     	
                                                           	
	add_2_2 : add_module_stage2                                    	
    Port map(                                             
				clk_in		=> clk_in,               	
				reset_in		=> reset_in,                        	
				input1 		=> add_output_1_3, 		           	
				input2 		=> add_output_1_4, 		
				output_sum 	=> add_output_2_2, 
				valid_in		=> valid_stage_1_2,	
				valid_out	=> valid_out_2_2,	
				carry_in 	=> carry_stage_1_2, 	
				carry_out 	=> carry_out_2_2 	
	 );
	 
carry_stage_2_1 <= carry_out_2_1 or carry_out_2_2;
valid_stage_2_1 <= valid_out_2_1 and valid_out_2_2;
-----------------------------------------------------------------
-- stage 3 --
-----------------------------------------------------------------
	add_3_1 : add_module_stage3
    Port map( 
				clk_in		=> clk_in,
				reset_in		=> reset_in,
				input1 		=> add_output_2_1, 		
				input2 		=> add_output_2_2, 		
				output_sum 	=> sig_add_output_final, 
				valid_in		=> valid_stage_2_1,	
				valid_out	=> add_valid_out,	
				carry_in 	=> carry_stage_2_1, 	
				carry_out 	=> add_carry_out 	
	 );

add_output <= sig_add_output_final(32 downto 17);-- in actual board
--add_output <= sig_add_output_final(15 downto 0);-- for only testing
end Behavioral;

