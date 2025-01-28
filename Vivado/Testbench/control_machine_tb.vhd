----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.05.2024 22:36:05
-- Design Name: 
-- Module Name: control_machine_tb - Behavioral
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

entity control_machine_tb is
--  Port ( );
end control_machine_tb;

architecture Behavioral of control_machine_tb is

--------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component control_machine
    port(
        clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        reset : in STD_LOGIC;
        in_idle_mv : in STD_LOGIC;
        in_full_fifo_0 :in STD_LOGIC;
        in_empty_fifo_0 : in STD_LOGIC;
        out_rst_mv : out STD_LOGIC;
        out_continue_mv : out STD_LOGIC;
        out_continue_rect : out STD_LOGIC;
        out_continue_mean : out STD_LOGIC;
        out_samples_ready : out STD_LOGIC;
        out_wr_en_fifo_0 : out STD_LOGIC;
        out_rd_en_fifo_0 : out STD_LOGIC;
        out_continue_norm : out STD_LOGIC;
        out_start_mv : out STD_LOGIC
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
   signal clk_sg   : std_logic := '0';
   signal rst_sg   : std_logic := '0';
   signal enable : std_logic := '0';
   signal in_idle_mv_sg : std_logic;
   signal in_full_fifo_sg : std_logic;
   signal in_empty_fifo_sg : std_logic;

   
   --signals associated with the outputs
   signal out_rst_mv : std_logic;
   signal out_continue_mv : std_logic;
   signal out_continue_rect : std_logic;
   signal out_continue_mean : std_logic;
   signal out_samples_ready : std_logic;
   signal out_wr_en_fifo_0 :  STD_LOGIC;
   signal out_rd_en_fifo_0 :  STD_LOGIC;
   signal out_continue_norm :  STD_LOGIC;
   signal out_start_mv : STD_LOGIC;
   -- clock period definitions
   constant clock_period : time := 10 ns;

begin

----------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: control_machine port map (
          clk  => clk_sg,
          reset => rst_sg,
          enable => enable,
          in_idle_mv => in_idle_mv_sg,
          in_full_fifo_0 => in_full_fifo_sg,
          in_empty_fifo_0 => in_empty_fifo_sg,
          out_rst_mv => out_rst_mv,
          out_continue_mv => out_continue_mv,
          out_continue_rect => out_continue_rect,
          out_continue_mean => out_continue_mean,
          out_continue_norm => out_continue_norm,
          out_samples_ready =>  out_samples_ready,
          out_wr_en_fifo_0  => out_wr_en_fifo_0,
          out_rd_en_fifo_0  => out_rd_en_fifo_0, 
          out_start_mv => out_start_mv
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
   -- test process
	-----------------------------------------------
   test_control: process
      variable test_input : integer;
--      file input_file: text;
--	  file output_file: text;
--	  variable in_line: line;
--	  variable out_line: line;
   begin
--      file_open(input_file,"../../../../InputValues.dat",READ_MODE);
--	  file_open(output_file,"../../../../mvValues2_tb.dat",WRITE_MODE);
      wait for 590 ns;
      wait until rising_edge(clk_sg);
      enable <= '1';
      in_idle_mv_sg <= '1';
      wait for 10 ns;
      wait until rising_edge(clk_sg);
      in_idle_mv_sg <= '0';
      in_empty_fifo_sg <= '0';
      in_full_fifo_sg <= '0';
      for I in 0 to 511 loop  --Leo los datos del archivo InputValues.dat
         
--	        wait for  390 ns; -- Escribo los resultados en RecMeanValues.dat
--	        write(out_line,to_bitvector(out_data_sg),RIGHT,32);
--	        writeline(output_file,out_line);
	        --wait for (1 ms);
	        wait for 10 us;
	        wait until rising_edge(clk_sg);
	   end loop;
--	   file_close(input_file);
--	   file_close(output_file);
	   wait;
--      test_input := 514;
--      in_data_sg <= std_logic_vector(to_unsigned(test_input, 10));
      
      
--      wait for 1 ms;
--      test_input := 510;
--      in_data_sg <= std_logic_vector(to_unsigned(test_input, 10));

      
--      wait for 1 ms;
--      test_input := 512;
--      in_data_sg <= std_logic_vector(to_unsigned(test_input, 10));
--      wait;  

      
      --wait;
      --ACA TENES QUE PONER VALORES EN DATA IN PARA VER SI HACER LA CONVERSION A MV
      --RECORDATORIO: BUSCAR SI PUEDE LEER UN ARCHIVO .TXT O .DAT
      end process test_control;

end Behavioral;

