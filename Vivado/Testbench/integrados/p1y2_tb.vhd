----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2024 21:45:27
-- Design Name: 
-- Module Name: p1y2_tb - Behavioral
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

entity p1y2_tb is
--  Port ( );
end p1y2_tb;

architecture Behavioral of p1y2_tb is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
component test_p1y2_wrapper
port(
    clk_0 : in STD_LOGIC;
    enable_0 : in STD_LOGIC;
    in_data_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    m_axis_data_tdata_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_data_tvalid_0 : out STD_LOGIC;
    out_scale_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    out_scale_data_V_TREADY_0 : in STD_LOGIC;
    out_scale_data_V_TVALID_0 : out STD_LOGIC;
    reset_0 : in STD_LOGIC
    );
end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
    -- signals associated with the inputs
    signal enable_0 : STD_LOGIC := '0';
    signal clk_0 : STD_LOGIC;
    signal reset_0 : STD_LOGIC := '0';
    signal in_data_0 : STD_LOGIC_VECTOR ( 9 downto 0 );
    signal out_scale_data_V_tready_0 : STD_LOGIC := '0';
    -- signals associated with the outpus
    signal m_axis_data_tdata_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
    signal m_axis_data_tvalid_0 : STD_LOGIC;
    signal out_scale_data_V_tdata_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
    signal out_scale_data_V_tvalid_0 : STD_LOGIC;
            
      -- clock period definitions
   constant clock_period : time := 10 ns;


begin

---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_p1y2_wrapper port map (
      clk_0 => clk_0,
      enable_0 => enable_0,
      in_data_0(9 downto 0) => in_data_0(9 downto 0),
      m_axis_data_tdata_0(63 downto 0) => m_axis_data_tdata_0(63 downto 0),
      m_axis_data_tvalid_0 => m_axis_data_tvalid_0,
      out_scale_data_V_TDATA_0(63 downto 0) => out_scale_data_V_TDATA_0(63 downto 0),
      out_scale_data_V_TREADY_0 => out_scale_data_V_TREADY_0,
      out_scale_data_V_TVALID_0 => out_scale_data_V_TVALID_0,
      reset_0 => reset_0
        );

----------------------------------------------
   -- clock process definitions
----------------------------------------------
   clock_proc: process
   begin
		clk_0 <= '0';
		wait for clock_period/2;
		clk_0 <= '1';
		wait for clock_period/2;
   end process clock_proc;
   
-----------------------------------------------
   -- reset stimulus process
-----------------------------------------------
   reset_proc: process
   begin		
      -- hold reset state = '1' for 300 ns
      wait for 300 ns;
      wait until rising_edge(clk_0);	
		-- inactive reset
      reset_0 <= '1';
      
      wait for 300 ns;
      wait until rising_edge(clk_0);
       
      reset_0 <= '0';
      
      wait;
   end process reset_proc;
    
 -----------------------------------------------
   -- handshake_0
-----------------------------------------------
    handshake_0: process
    begin
    wait for 600 ns;
       wait until rising_edge(out_scale_data_V_TVALID_0);
       out_scale_data_V_TREADY_0 <= '1'; 
       wait until falling_edge(out_scale_data_V_TVALID_0);
       out_scale_data_V_TREADY_0 <= '0'; 
    end process handshake_0;
 
  -----------------------------------------------
   -- write_fir_modulus (tiene 1024 muestras y 64 bits)
-----------------------------------------------
    write_amplitude: process
        file output_file: text;
        variable out_line: line;

    begin
        file_open(output_file,"../../../../ifft_1024_values_p1y2.dat",WRITE_MODE);
        wait until rising_edge(m_axis_data_TVALID_0);
        escritura: for I in 0 to 1023 loop
            wait for 0.1 ns;
            write(out_line,to_bitvector(m_axis_data_tdata_0),RIGHT,64);
            writeline(output_file,out_line);
            wait until rising_edge(clk_0);
        end loop;  
        file_close(output_file);
        wait;
    end process write_amplitude;
          
  
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
      wait until rising_edge(clk_0);
      enable_0 <= '1';
      for I in 0 to 511 loop  --Leo los datos del archivo InputValues.dat
            readline(input_file,in_line);
	   	    read(in_line, test_input);
		    in_data_0 <=std_logic_vector(to_unsigned(test_input,10));
--	        wait for  390 ns; -- Escribo los resultados en RecMeanValues.dat
--	        write(out_line,to_bitvector(out_data_sg),RIGHT,32);
--	        writeline(output_file,out_line);
	        --wait for (1 ms);
	        wait for 100 us;
	        wait until rising_edge(clk_0);
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
