----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.04.2024 13:43:34
-- Design Name: 
-- Module Name: mean_tb - Behavioral
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

entity mean_tb is
--  Port ( );
end mean_tb;

architecture Behavioral of mean_tb is
--------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component test_mean_wrapper
  port (
    ap_clk_0 : in STD_LOGIC;
    ap_rst_0 : in STD_LOGIC;
    ap_continue_0 : in STD_LOGIC;
    ap_start_0 : in STD_LOGIC;
    in_data_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_samples_ready_0 : in STD_LOGIC;
    ap_done_0 : out STD_LOGIC;
    ap_idle_0 : out STD_LOGIC;
    ap_ready_0 : out STD_LOGIC;
    out_mean_0 : out STD_LOGIC_VECTOR ( 31 downto 0 ));
  end component;
  
--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
  signal clk_sg : std_logic := '0';
  signal rst_sg: std_logic := '0';
  signal continue_sg : std_logic := '0';
  signal start_sg : std_logic := '0';
  signal in_data_sg : std_logic_vector (31 downto 0);
  signal in_samples_ready_sg : std_logic := '0';
  -- signals associated with the outputs
  signal done_sg : std_logic;
  signal idle_sg : std_logic;
  signal ready_sg : std_logic;
  signal out_mean_sg : std_logic_vector (31 downto 0);
   -- clock period definitions
   constant clock_period : time := 10 ns;

-- -------------------------------------------------------------------- --
-- Architecture body
-- -------------------------------------------------------------------- -- 
begin

----------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_mean_wrapper port map (
        ap_clk_0 => clk_sg,
        ap_rst_0 => rst_sg,
        ap_continue_0 => continue_sg,
        ap_start_0 => start_sg,
        in_data_0 => in_data_sg,
        in_samples_ready_0 => in_samples_ready_sg,  
        ap_ready_0 => ready_sg,
        ap_done_0 => done_sg,
        ap_idle_0 => idle_sg,
        out_mean_0 => out_mean_sg
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
   mean_proc: process
      variable test_input : std_logic_vector (31 downto 0);
      file input_file: text;
--      file output_file: text;
	  variable in_line: line;
--	  variable out_line: line;
	  
	  constant mean_latency : time := 80 ns;
   begin
      file_open(input_file,"../../../../rectValues_ns_tb.dat",READ_MODE);
--      file_open(output_file,"../../../../meanValue_ms_tb.dat",WRITE_MODE);
      wait for 600 ns;
      wait until rising_edge(clk_sg);
      start_sg <= '1';
      continue_sg <= '1';
      --PRUEBA en milisegundos (simulando la maquina de control) -> FUNCIONA
      for I in  0 to 511 loop
          readline(input_file,in_line);
          read(in_line, test_input);
          in_data_sg <= test_input;
          wait for mean_latency;
          wait until rising_edge(clk_sg);
          if(I = 511) then
              in_samples_ready_sg <= '1';
              continue_sg <= '0';
              wait for 0.1 ns;
--             write(out_line,to_bitvector(out_mean_sg),RIGHT,32);
--              writeline(output_file,out_line);
          end if;
          continue_sg <= '0';
          if(I = 511) then
            wait for (1 ms - mean_latency - 10 ns - 0.1 ns);
          else
            wait for (1 ms - mean_latency - 10 ns);
          end if;
          wait until rising_edge(clk_sg);
          continue_sg <= '1';
          wait for 10 ns;
          wait until rising_edge(clk_sg);
          end loop;
          file_close(input_file);
 --         file_close(output_file);
      --PRUEBA en nanosegundos -> NO FUNCIONA (pensarla mejor)
--      for I in 0 to 511 loop  --Leo los datos del archivo mvValues_tb.dat
--        readline(input_file,in_line);
--	   	read(in_line, test_input);
--	   	in_data_sg <= test_input;
--	   	wait for mean_latency;
--	   	wait until rising_edge(clk_sg);
--	   	if(I = 511) then
--	   	   in_samples_ready_sg <= '1';
--           wait for mean_latency;
--           wait until rising_edge(clk_sg);
--	   	end if;
--      end loop;
--      file_close(input_file);
--      file_close(output_file);
      wait;
   end process mean_proc;


end Behavioral;
