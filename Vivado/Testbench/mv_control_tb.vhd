----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2024 13:46:31
-- Design Name: 
-- Module Name: mv_control_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mv_control_tb is
--  Port ( );
end mv_control_tb;

architecture Behavioral of mv_control_tb is

--------------------------------------------------------- 
	-- component declaration
	--------------------------------------------------------- 
    component mv_control
    port(
        clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        reset : in STD_LOGIC;
        in_idle_mv : in STD_LOGIC;
        in_ready_mv : in STD_LOGIC;
        in_ack_mv : in STD_LOGIC;
        in_vld_mv : in STD_LOGIC;
        out_rst_mv : out STD_LOGIC;
        out_continue_mv : out STD_LOGIC;
        out_start_mv : out std_logic
        );
    end component;
    
	--------------------------------------------------------- 
	-- signal declarations 
	--------------------------------------------------------- 
   -- signals associated with the inputs
   signal clk_sg   : std_logic := '0';
   signal en_sg   : std_logic := '0';
   signal reset_sg : std_logic := '0';
   signal in_idle_sg : std_logic := '0';
   signal in_ready_sg : std_logic := '0';
   signal in_ack_sg : std_logic := '0';
   signal in_vld : std_logic := '0';
   signal out_rst_sg : std_logic := '0';
   signal out_continue_sg : std_logic := '0';
   signal out_start_sg :std_logic := '0';


   -- clock period definitions
   constant clock_period : time := 10 ns;
   
   -- File definitions
--   file inputfile : text;
-- -------------------------------------------------------------------- --
-- Architecture body

begin

	----------------------------------------------
   -- instantiate the unit under test (uut)
	---------------------------------------------- 
   uut: mv_control port map (
        clk => clk_sg,
        enable =>  en_sg,
        reset =>  reset_sg,
        in_idle_mv => in_idle_sg,
        in_ready_mv => in_ready_sg,
        in_ack_mv => in_ack_sg,
        in_vld_mv => in_vld,
        out_rst_mv => out_rst_sg,
        out_continue_mv => out_continue_sg,
        out_start_mv => out_start_sg 
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
      reset_sg <= '1';
      
      wait for 300 ns;
      wait until rising_edge(clk_sg);
       
      reset_sg <= '0';     
      wait;
   end process reset_proc;
   
   test_mv_control :process
   begin
    wait for 300 ns;
    wait until rising_edge(clk_sg);
    in_idle_sg <= '1';
    wait for 300 ns;
    wait until rising_edge(clk_sg);
    en_sg <= '1';
    in_idle_sg <= '0';
    wait for 380 ns;
    for i in 0 to 511 loop
        in_vld <= '1';
        wait for 50 ns;
        in_vld <='0';
        wait for (1 ms - 50 ns + 380 ns);
    end loop;
    wait;
   end process test_mv_control;
end Behavioral;
