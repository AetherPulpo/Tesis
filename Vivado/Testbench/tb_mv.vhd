---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2024 09:45:19
-- Design Name: 
-- Module Name: tb_test_conv_mv - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_mv is
--  Port ( );
end tb_mv;

architecture Behavioral of tb_mv is
--------------------------------------------------------- 
	-- component declaration
	--------------------------------------------------------- 
    component test_mv_wrapper
    port(
         ap_clk_0  : in  std_logic;
         ap_rst_0  : in  std_logic;
         ap_start_0 : in STD_LOGIC;
         ap_continue_0 : in STD_LOGIC;
         in_data_0 : in std_logic_vector(9 downto 0);
         in_data_ap_ack_0 : out STD_LOGIC;
         ap_done_0   : out std_logic;
         ap_idle_0   : out std_logic;
         ap_ready_0   : out std_logic;
         out_data_0   : out std_logic_vector(31 downto 0);
         out_data_ap_vld_0 : out STD_LOGIC);
    end component;
    
	--------------------------------------------------------- 
	-- signal declarations 
	--------------------------------------------------------- 
   -- signals associated with the inputs
   signal clk_sg   : std_logic := '0';
   signal rst_sg   : std_logic := '0';
   signal start_sg : std_logic := '0';
   signal continue_sg : std_logic := '0';
   signal done_sg : std_logic;
   signal idle_sg : std_logic;
   signal ready_sg : std_logic;
   signal in_data_sg : std_logic_vector(9 downto 0);
   signal in_ack : std_logic;
   signal out_data_sg : std_logic_vector(31 downto 0);
   signal out_vld : std_logic;


   -- clock period definitions
   constant clock_period : time := 10 ns;
   
   -- File definitions
--   file inputfile : text;
-- -------------------------------------------------------------------- --
-- Architecture body
-- -------------------------------------------------------------------- -- 
begin
	----------------------------------------------
   -- instantiate the unit under test (uut)
	---------------------------------------------- 
   uut: test_mv_wrapper port map (
          ap_clk_0  => clk_sg,
          ap_rst_0  => rst_sg,
          ap_start_0 => start_sg,
          ap_continue_0 => continue_sg,
          ap_done_0 => done_sg,
          ap_idle_0 => idle_sg,
          ap_ready_0 => ready_sg,
          in_data_0 => in_data_sg,
          in_data_ap_ack_0 => in_ack,
          out_data_0 => out_data_sg,
          out_data_ap_vld_0 => out_vld
        );
   -- clock process definitions
	----------------------------------------------
   clock_proc: process
   begin
		clk_sg <= '0';
		wait for clock_period/2;
		clk_sg <= '1';
		wait for clock_period/2;
   end process clock_proc;
 
   -----------------------------------------------
   -- reset stimulus process
	-----------------------------------------------
   reset_proc: process
   begin		
      -- hold reset state = '1' for 300 ns
      wait for 300 ns;
      wait until rising_edge(clk_sg);	
		-- inactive reset
      rst_sg <= '1';
      
      wait for 300 ns;
      wait until rising_edge(clk_sg);	
      rst_sg <= '0';
      
      wait;
   end process reset_proc;

	-----------------------------------------------
   -- up_down stimulus process
	-----------------------------------------------
   test_conv_mv: process
      variable test_input : integer;
   begin
      wait for 300 ns;
      wait until rising_edge(clk_sg);	
      start_sg <= '0';	
      continue_sg <='0';
      
      wait for 300 ns;
      wait until rising_edge(clk_sg);	
      test_input := 520;
      in_data_sg <= std_logic_vector(to_unsigned(test_input, 10));
      start_sg <= '1';	
      continue_sg <='1';
      
      wait for 380 ns;
      wait until rising_edge(clk_sg);	
      start_sg <= '1';	
      continue_sg <='0';
      
      wait for (1 ms - 380 ns);
      wait until rising_edge(clk_sg);   
      test_input := 518;
      in_data_sg <= std_logic_vector(to_unsigned(test_input, 10));	
      continue_sg <='1';
      
      wait for 380 ns; 
      wait until rising_edge(clk_sg);
      continue_sg <='0';
      
      wait for (1 ms - 380 ns);
      wait until rising_edge(clk_sg);	
      test_input := 510;
      in_data_sg <= std_logic_vector(to_unsigned(test_input, 10));
      continue_sg <='1';     
      wait for 380 ns;
      wait until rising_edge(clk_sg);	
      continue_sg <='0';  
      wait;
      
--      test_input := 512;
--      in_data_sg <= std_logic_vector(to_unsigned(test_input, 10));
--      wait for 300  ns;
--      continue_sg <='1';
--      wait for 100 ns;
--      test_input := 510;
--      in_data_sg <= std_logic_vector(to_unsigned(test_input, 10));
--      wait for 300 ns;
--      wait;
      
      --wait;
      --ACA TENES QUE PONER VALORES EN DATA IN PARA VER SI HACER LA CONVERSION A MV
      --RECORDATORIO: BUSCAR SI PUEDE LEER UN ARCHIVO .TXT O .DAT
      
   end process test_conv_mv;

end Behavioral;