----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:55 05/25/2012 
-- Design Name: 
-- Module Name:    sram - Behavioral 
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
  use ieee.std_logic_unsigned.all;
  use IEEE.NUMERIC_STD.all;
  use IEEE.STD_LOGIC_ARITH.all;
  
  entity sram_cntlr is
      port   (
         s_fifo_clk      : in  std_logic;
         s_fifo_rst      : in  std_logic;
         
			-- Schedular Interface --
			wr_en           : in std_logic;
		   rd_en           : in std_logic;
		   wr_done	       : out std_logic;
		   rd_done	       : out std_logic;
			rd_data_valid   : out std_logic;
			sram_addrs_in   : in  std_logic_vector(18 downto 0);
			sram_wr_data_in : in  std_logic_vector(15 downto 0);
			
			-- SRAM interface --
         adv_n           : out std_logic;			 
         adsp_n          : out std_logic;                                
         adsc_n          : out std_logic;                                
         ce_n            : out std_logic;                                
         ce2             : out std_logic;                                
         ce2_n           : out std_logic;                                
         bwa_n           : out std_logic;                                
         bwb_n           : out std_logic; 
         bwc_n           : out std_logic;                                
         bwd_n           : out std_logic;			 
         oe_n            : out std_logic;                                
         global_wr_n     : out std_logic;                                
         bwe_n           : out std_logic;                                
         zz              : out std_logic;                                
         mode            : out std_logic;
			sram_addrs_out  : out std_logic_vector(18 downto 0);
			sram_wr_data    : out std_logic_vector(17 downto 0)
      );
  end sram_cntlr;
  
  architecture sram_fifo_Beh  of sram_cntlr is
 
   signal wr_cnt :std_logic_vector(2 downto 0);
	signal int_sram_rd_done : std_logic;  
	signal rd_data_valid_s : std_logic;
	signal rd_data_valid_int : std_logic;
	signal oe_n_int : std_logic;
	signal oe_n_int_d1 : std_logic;
	signal oe_n_int_d2 : std_logic;
	
  
   type sram_sm is
				(  
               sram_init,
               sram_write_data,
				   sram_wr_addr,
					--sram_wr_wait,	
               sram_rd_addr,
					sram_rd_data
					--sram_rd_wait
				);

	signal sram_state : sram_sm;  
	
	signal data_valid_cnt : std_logic_vector ( 1 downto 0);
	signal rd_data_valid_temp1 : std_logic;
	signal rd_data_valid_temp2 : std_logic;
	
 
  begin

  adsp_n <= '1';
  zz <= '0';
  mode <= '0';
  rd_done <= int_sram_rd_done;
  rd_data_valid <= rd_data_valid_temp2; --rd_data_valid_s;
  sram_wr_data <= ("00" & sram_wr_data_in);
  oe_n <= (oe_n_int_d1 and oe_n_int_d2);
  
	process (s_fifo_clk,s_fifo_rst) begin 
	   if s_fifo_rst = '1' then 
		   rd_data_valid_temp1 <= '0';
		elsif falling_edge(s_fifo_clk) then   
			rd_data_valid_temp2 <= rd_data_valid_temp1;
			if(data_valid_cnt = "11") then
				rd_data_valid_temp1 <= '0';
			elsif (rd_data_valid_s = '1') then 
				rd_data_valid_temp1 <= '1';
			end if;
		end if;
	end process;
	
	
		process (s_fifo_clk,s_fifo_rst) begin 
      if(s_fifo_rst = '1') then
			data_valid_cnt <= (others => '0');				
		elsif falling_edge(s_fifo_clk) then   
			oe_n_int_d1 <= oe_n_int;
			oe_n_int_d2 <= oe_n_int_d1;
			if (rd_data_valid_temp1 = '1') then 
				data_valid_cnt <= data_valid_cnt + '1';
			else
				data_valid_cnt <= (others => '0');
			end if;
		end if;
	end process;
	
	
	STATE_MACHINE:
		process (s_fifo_clk,s_fifo_rst) begin  
         if(s_fifo_rst = '1') then
					sram_addrs_out <= (others => '0');
					wr_done <= '0';
					int_sram_rd_done <= '0';
					global_wr_n <= '1';
					wr_cnt <= (others => '0');
					rd_data_valid_s <= '0';
					adv_n              <= '1';                                        
               adsc_n             <= '1';                                        
               ce_n               <= '1';                                        
               ce2                <= '0';                                        
               ce2_n              <= '1';                                        
               bwa_n              <= '1';
               bwb_n              <= '1';
					bwc_n 				 <= '1';
					bwd_n 				 <= '1';
               oe_n_int           <= '1';
               global_wr_n        <= '1';
               bwe_n              <= '1';
					sram_state <= sram_init;       
         elsif falling_edge(s_fifo_clk) then   
            
              case sram_state is
               
					when sram_init  =>
                  
					  if (wr_en = '1' ) then
					   sram_state <= sram_write_data;
                 elsif (rd_en = '1') then 
					   sram_state <= sram_rd_data ; 
                 end if ;
                
                 sram_addrs_out   <= sram_addrs_in;
					  adv_n            <= '1';                                        
                 adsc_n           <= '1';                                        
                 ce_n             <= '1';                                        
                 ce2              <= '0';                                        
                 ce2_n            <= '1';                                        
                 bwa_n            <= '1';
                 bwb_n            <= '1';
					  bwc_n 				 <= '1';
					  bwd_n 			 	 <= '1';
                 oe_n_int         <= '1';
                 global_wr_n      <= '1';
                 bwe_n            <= '1';
                 wr_done          <= '0';  
                 int_sram_rd_done <= '0'; 
					  rd_data_valid_s  <= '0';

               when sram_write_data => 

						wr_cnt <= wr_cnt + '1';

						case wr_cnt is
								
						 when "000" => 
						               adsc_n             <= '0';
											ce_n               <= '0';
											ce2                <= '1';
											ce2_n              <= '0';
											bwa_n              <= '0';
											bwb_n              <= '0';
											bwc_n              <= '0';
											bwd_n              <= '0';
											oe_n_int           <= '1';
											global_wr_n        <= '0';
											bwe_n              <= '0';
						 when "001" => 
											adsc_n <= '1';		
											adv_n <= '0';
											ce_n   <= '1';
											ce2    <= '0';
											ce2_n  <= '1';											

						 when "101" => 
											wr_done <= '1';
											adv_n <= '1';
											wr_cnt <= "000";
											sram_state <= sram_init;
											
						 when others => Null;
						end case;
						
                 
               when sram_rd_data => 
                  
						wr_cnt <= wr_cnt + '1';
						
						case wr_cnt is
						
						 when "000" =>
											adv_n       <= '1';
											adsc_n      <= '0';
											ce_n        <= '0';
											ce2         <= '1';
											ce2_n       <= '0';
											bwa_n       <= '1';
											bwb_n       <= '1';
											bwc_n       <= '1';
											bwd_n       <= '1';
											global_wr_n <= '1';                                           
											bwe_n       <= '1';       
						 when "001" => 
											oe_n_int <= '0'; -- For Board testing --
											adsc_n <= '1';
											adv_n <= '0';
											ce_n <= '1';
											ce2 <= '0';
											ce2_n <= '1';
						 
						 when "010" => 
											rd_data_valid_s <= '1';
						 when "011" => 
											rd_data_valid_s <= '0';	
						 when "101" => 
											int_sram_rd_done <= '1';
											wr_cnt <= "000";
											adv_n <= '1';
											sram_state <= sram_init ; 
											
						 when others => Null;
						 
						end case;
						
					when others =>
						sram_state <= sram_init ; 
						
              end case; 
            end if;
				end process;

end sram_fifo_Beh;		

