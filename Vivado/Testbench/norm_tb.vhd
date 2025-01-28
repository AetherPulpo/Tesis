----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 21:38:06
-- Design Name: 
-- Module Name: norm_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use ieee.std_logic_textio.all; -- con esta libreria se puede leer/escribir std_logic_vectors
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity norm_tb is
--  Port ( );
end norm_tb;

architecture Behavioral of norm_tb is

--------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component test_norm_wrapper
        port(
            ap_clk_0 : in STD_LOGIC;
            ap_rst_0 : in STD_LOGIC;
            ap_continue_0 : in STD_LOGIC;         
            ap_start_0 : in STD_LOGIC;
            in_mean_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
            in_rect_data_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
            ap_done_0 : out STD_LOGIC;
            ap_idle_0 : out STD_LOGIC;
            ap_ready_0 : out STD_LOGIC;
            out_norm_data_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
        );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
  signal clk_sg : std_logic := '0';
  signal rst_sg: std_logic := '0';
  signal continue_sg : std_logic := '0';
  signal start_sg : std_logic := '0';
  signal in_mean_sg : std_logic_vector (31 downto 0);
  signal in_rect_data_sg : std_logic_vector (31 downto 0);
  -- signals associated with the outputs
  signal done_sg : std_logic;
  signal idle_sg : std_logic;
  signal ready_sg : std_logic;
  signal out_norm_data_sg : std_logic_vector (31 downto 0);
   -- clock period definitions
  constant clock_period : time := 10 ns;

-- -------------------------------------------------------------------- --
-- Architecture body
-- -------------------------------------------------------------------- -- 
begin

----------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_norm_wrapper port map (
        ap_clk_0 => clk_sg,
        ap_rst_0 => rst_sg,
        ap_continue_0 => continue_sg,
        ap_start_0 => start_sg,
        in_mean_0 => in_mean_sg,
        in_rect_data_0 => in_rect_data_sg,  
        ap_ready_0 => ready_sg,
        ap_done_0 => done_sg,
        ap_idle_0 => idle_sg,
        out_norm_data_0 => out_norm_data_sg
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
   -- test_rect stimulus process
	-----------------------------------------------
   norm_proc: process
      variable test_rect_input : std_logic_vector (31 downto 0);
      variable test_mean_input: std_logic_vector (31 downto 0);
      file input_file_a: text;
      file input_file_b: text;
--      file output_file: text;
	  variable in_line_a: line;
	  variable in_line_b: line;
--	  variable out_line: line;
	  
	  constant norm_latency : time := 150 ns;
	  constant read_latency : time :=10 ns; --Para leer de la FIFO, se tarda un ciclo de reloj
   begin
      file_open(input_file_a,"../../../../rectValues_ns_tb.dat",READ_MODE);
      file_open(input_file_b,"../../../../meanValue_ms_tb.dat",READ_MODE);
--      file_open(output_file,"../../../../normValues_ns_tb.dat",WRITE_MODE);
      wait for 600 ns;
      wait until rising_edge(clk_sg);
      start_sg <= '1';
      continue_sg <= '1';
      
      readline(input_file_b,in_line_b);
      read(in_line_b, test_mean_input);
      in_mean_sg <= test_mean_input;
      file_close(input_file_b);
      
      --PRUEBA en nanosegundos (simulando la maquina de control) -> FUNCIONA
      for I in  0 to 511 loop
          readline(input_file_a,in_line_a);
          read(in_line_a, test_rect_input);
          in_rect_data_sg <= test_rect_input;
          wait for norm_latency;
          wait until rising_edge(clk_sg);
--          wait for read_latency;
--          wait until rising_edge(clk_sg);
--          write(out_line,to_bitvector(out_norm_data_sg),RIGHT,32);
--          writeline(output_file,out_line);
          end loop;
          file_close(input_file_a);
--          file_close(output_file);
      wait;
   end process norm_proc;



end Behavioral;
