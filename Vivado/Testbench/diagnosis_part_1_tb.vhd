----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2024 10:36:18
-- Design Name: 
-- Module Name: diagnosis_part_1_tb - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity diagnosis_part_1_tb is
--  Port ( );
end diagnosis_part_1_tb;

architecture Behavioral of diagnosis_part_1_tb is

--------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component diagnosis_part_1_wrapper
    port(
        clk_0 : in STD_LOGIC;
        reset_0 : in STD_LOGIC;
        enable_0 : in STD_LOGIC;
        in_data_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );        
        data_count_0 : out STD_LOGIC_VECTOR ( 8 downto 0 );
        out_norm_data_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
   signal clk_sg   : std_logic := '0';
   signal rst_sg   : std_logic := '0';
   signal enable : std_logic := '0';
   signal in_data_sg : std_logic_vector(9 downto 0);
   --signals associated with the outputs
   signal data_count_sg : std_logic_vector(8 downto 0);
   signal out_norm_data_sg : std_logic_vector (31 downto 0);


   -- clock period definitions
   constant clock_period : time := 10 ns;

begin

----------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: diagnosis_part_1_wrapper port map (
          clk_0  => clk_sg,
          reset_0  => rst_sg,
          enable_0 => enable,
          in_data_0 => in_data_sg,
          data_count_0 => data_count_sg,
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
   -- test process
	-----------------------------------------------
   test_diag_1: process
      variable test_input : integer;
      file input_file: text;
--	  file output_file: text;
	  variable in_line: line;
--	  variable out_line: line;
   begin
      file_open(input_file,"../../../../InputValues.dat",READ_MODE);
--	  file_open(output_file,"../../../../mvValues2_tb.dat",WRITE_MODE);
      wait for 600 ns;
      wait until rising_edge(clk_sg);
      enable <= '1';
      for I in 0 to 511 loop  --Leo los datos del archivo InputValues.dat
            readline(input_file,in_line);
	   	    read(in_line, test_input);
		    in_data_sg <=std_logic_vector(to_unsigned(test_input,10));
--	        wait for  390 ns; -- Escribo los resultados en RecMeanValues.dat
--	        write(out_line,to_bitvector(out_data_sg),RIGHT,32);
--	        writeline(output_file,out_line);
	        --wait for (1 ms);
	        wait for 100 us;
	        wait until rising_edge(clk_sg);
	   end loop;
	   file_close(input_file);
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
      end process test_diag_1;

end Behavioral;
