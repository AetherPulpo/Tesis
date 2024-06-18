----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2024 13:21:10
-- Design Name: 
-- Module Name: fir_tb_v2 - Behavioral
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

entity fir_tb_v2 is
--  Port ( );
end fir_tb_v2;

architecture Behavioral of fir_tb_v2 is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component test_fir_wrapper
    port(
    ap_clk_0 : in STD_LOGIC;
    ap_rst_n_0 : in STD_LOGIC;
    ap_start_0 : in STD_LOGIC;
    out_cut_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_cut_data_V_TDATA_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_cut_data_V_TREADY_0 : in STD_LOGIC;
    out_cut_data_V_TREADY_1 : in STD_LOGIC;
    out_cut_data_V_TVALID_0 : out STD_LOGIC;
    out_cut_data_V_TVALID_1 : out STD_LOGIC;
    out_fir_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_fir_data_V_TDATA_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_fir_data_V_TVALID_0 : out STD_LOGIC;
    out_fir_data_V_TVALID_1 : out STD_LOGIC;
    s_axis_tdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tdata_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tready_0 : out STD_LOGIC;
    s_axis_tready_1 : out STD_LOGIC;
    s_axis_tvalid_0 : in STD_LOGIC;
    s_axis_tvalid_1 : in STD_LOGIC
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
    signal ap_clk_0 : STD_LOGIC;
    signal ap_rst_n_0 : STD_LOGIC :='1';
    signal ap_start_0 : STD_LOGIC := '0';
    signal s_axis_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 ); --modulo
    signal s_axis_TDATA_1 : STD_LOGIC_VECTOR ( 31 downto 0 ); --fase
    signal s_axis_TVALID_0 : STD_LOGIC :='0';
    signal s_axis_TVALID_1 : STD_LOGIC :='0';
    signal out_cut_data_V_TREADY_0 : STD_LOGIC := '0';
    signal out_cut_data_V_TREADY_1 : STD_LOGIC := '0';
    
  -- signals associated with the outpus
    signal s_axis_TREADY_0 : STD_LOGIC;
    signal s_axis_TREADY_1 : STD_LOGIC;
    signal out_cut_data_V_TVALID_0 : STD_LOGIC;
    signal out_cut_data_V_TVALID_1 : STD_LOGIC;
    signal out_cut_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal out_cut_data_V_TDATA_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal out_fir_data_V_TVALID_0 : STD_LOGIC;
    signal out_fir_data_V_TVALID_1 : STD_LOGIC;
    signal out_fir_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal out_fir_data_V_TDATA_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
        
      -- clock period definitions
   constant clock_period : time := 10 ns;    

begin

---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_fir_wrapper port map (
      ap_clk_0 => ap_clk_0,
      ap_rst_n_0 => ap_rst_n_0,
      ap_start_0 => ap_start_0,
      out_cut_data_V_TDATA_0(31 downto 0) => out_cut_data_V_TDATA_0(31 downto 0),
      out_cut_data_V_TDATA_1(31 downto 0) => out_cut_data_V_TDATA_1(31 downto 0),
      out_cut_data_V_TREADY_0 => out_cut_data_V_TREADY_0,
      out_cut_data_V_TREADY_1 => out_cut_data_V_TREADY_1,
      out_cut_data_V_TVALID_0 => out_cut_data_V_TVALID_0,
      out_cut_data_V_TVALID_1 => out_cut_data_V_TVALID_1,
      out_fir_data_V_TDATA_0(31 downto 0) => out_fir_data_V_TDATA_0(31 downto 0),
      out_fir_data_V_TDATA_1(31 downto 0) => out_fir_data_V_TDATA_1(31 downto 0),
      out_fir_data_V_TVALID_0 => out_fir_data_V_TVALID_0,
      out_fir_data_V_TVALID_1 => out_fir_data_V_TVALID_1,
      s_axis_tdata_0(31 downto 0) => s_axis_tdata_0(31 downto 0),
      s_axis_tdata_1(31 downto 0) => s_axis_tdata_1(31 downto 0),
      s_axis_tready_0 => s_axis_tready_0,
      s_axis_tready_1 => s_axis_tready_1,
      s_axis_tvalid_0 => s_axis_tvalid_0,
      s_axis_tvalid_1 => s_axis_tvalid_1 
        );

----------------------------------------------
   -- clock process definitions
----------------------------------------------
   clock_proc: process
   begin
		ap_clk_0 <= '0';
		wait for clock_period/2;
		ap_clk_0 <= '1';
		wait for clock_period/2;
   end process clock_proc;
 
    -----------------------------------------------
   -- reset stimulus process
	-----------------------------------------------
   reset_proc: process
   begin		
      -- hold reset state = '1' for 300 ns
      wait for 300 ns;
      wait until rising_edge(ap_clk_0);	
		-- inactive reset
      ap_rst_n_0 <= '0';
      
      wait for 300 ns;
      wait until rising_edge(ap_clk_0);
      
      ap_rst_n_0 <= '1';
      
      wait;
   end process reset_proc;
 -----------------------------------------------
   -- handshake_0
-----------------------------------------------
    handshake_0: process
    begin
        wait until rising_edge(out_cut_data_V_TVALID_0);
        out_cut_data_V_TREADY_0 <= '1'; 
        wait until falling_edge(out_cut_data_V_TVALID_0);
        out_cut_data_V_TREADY_0 <= '0';
    end process handshake_0;
    
 -----------------------------------------------
   -- handshake_1
-----------------------------------------------
    handshake_1: process
    begin
        wait until rising_edge(out_cut_data_V_TVALID_1);
        out_cut_data_V_TREADY_1 <= '1'; 
        wait until falling_edge(out_cut_data_V_TVALID_1);
        out_cut_data_V_TREADY_1 <= '0';
    end process handshake_1;

    

 -----------------------------------------------
   -- write_fir_modulus (tiene 1228 muestras)
-----------------------------------------------
--    write_fir_modulus_1228: process
--        file output_file_modulus_1228: text;
--        variable out_line_modulus_1228: line;

--    begin
--        file_open(output_file_modulus_1228,"../../../../fir_modulus_1228_values.dat",WRITE_MODE);
--        wait until rising_edge(out_fir_data_V_TVALID_0);
--        escritura_fir_modulo_1228: for I in 0 to 1227 loop
--            wait for 0.1 ns;
--            write(out_line_modulus_1228,to_bitvector(out_fir_data_V_tdata_0),RIGHT,32);
--            writeline(output_file_modulus_1228,out_line_modulus_1228);
--            wait until rising_edge(out_fir_data_V_TVALID_0);
----            wait for 8330 ns;
----            wait until rising_edge(ap_clk_0);
--        end loop escritura_fir_modulo_1228;  
--        file_close(output_file_modulus_1228);
--        wait;
--    end process write_fir_modulus_1228;


 -----------------------------------------------
   -- write_fir_phase_1228(tiene 1228 muestras)
-----------------------------------------------
--    write_fir_phase_1228: process
--         file output_file_phase_1228: text;
--        variable out_line_phase_1228: line;
--    begin
--        file_open(output_file_phase_1228,"../../../../fir_phase_1228_values.dat",WRITE_MODE);
--        wait until rising_edge(out_fir_data_V_TVALID_1);
--        escritura_fir_fase_1228: for I in 0 to 1227 loop
--            wait for 0.1 ns;
--            write(out_line_phase_1228,to_bitvector(out_fir_data_V_tdata_1),RIGHT,32);
--            writeline(output_file_phase_1228,out_line_phase_1228);
--            wait until rising_edge(out_fir_data_V_TVALID_1);
----            wait for 8330 ns;
----            wait until rising_edge(ap_clk_0);           
--        end loop escritura_fir_fase_1228;  
--        file_close(output_file_phase_1228);
--        wait;
--    end process write_fir_phase_1228;

-- -----------------------------------------------
--   -- write_fir_modulus_1024VALORES (CON ESTOS COMPARO LOS VALORES DE PYTHON))
-------------------------------------------------
--    write_fir_modulus_1024: process
--        file output_file_modulus_1024: text;
--        variable out_line_modulus_1024: line;
--    begin
--        file_open(output_file_modulus_1024,"../../../../fir_modulus_1024_values.dat",WRITE_MODE);
--        wait until rising_edge(out_cut_data_V_TVALID_0);
--        escritura_fir_modulo_1024 : for I in 0 to 1023 loop
--            wait for 0.1 ns;
--            write(out_line_modulus_1024,to_bitvector(out_cut_data_V_tdata_0),RIGHT,32);
--            writeline(output_file_modulus_1024,out_line_modulus_1024);
--           wait until rising_edge(out_cut_data_V_TVALID_0);
--        end loop escritura_fir_modulo_1024;  
--        file_close(output_file_modulus_1024);
--        wait;
--    end process write_fir_modulus_1024;

-- -----------------------------------------------
--   -- write_fir_phase_1024 VALORES (CON ESTOS COMPARO LOS VALORES DE PYTHON))
-------------------------------------------------
--    write_fir_phase_1024: process
--        file output_file_phase_1024: text;
--        variable out_line_phase_1024: line;
--    begin
--        file_open(output_file_phase_1024,"../../../../fir_phase_1024_values.dat",WRITE_MODE);
--        wait until rising_edge(out_cut_data_V_TVALID_1);
--        escritura_fir_fase_1024 : for I in 0 to 1023 loop
--            wait for 0.1 ns; 
--            write(out_line_phase_1024,to_bitvector(out_cut_data_V_tdata_1),RIGHT,32);
--            writeline(output_file_phase_1024,out_line_phase_1024);
--            wait until rising_edge(out_cut_data_V_TVALID_1);
--        end loop escritura_fir_fase_1024;  
--        file_close(output_file_phase_1024);
--        wait;
--    end process write_fir_phase_1024;


 -----------------------------------------------
   -- test process
-----------------------------------------------
   test_fir: process
      variable test_input_phase : std_logic_vector(31 downto 0);
      variable test_input_modulus : std_logic_vector(31 downto 0);
      file input_file_phase : text;
      file input_file_modulus : text;
	  variable in_line_phase : line;
	  variable in_line_modulus : line;
--	  variable J : integer := 0;
    constant axi_n_zeroes_latency : time := 12320 ns;
    constant axi_fir_latency : time := 10233370 ns;
    constant axi_cut_n_latency : time := 12320 ns;
    constant out_1228_latency : time := 8330 ns;
   begin
      file_open(input_file_phase,"../../../../phase_values_v4.dat",READ_MODE);
      file_open(input_file_modulus,"../../../../modulus_values_v4.dat",READ_MODE);  
      wait for 600 ns;
      wait until rising_edge(ap_clk_0);
      ap_start_0 <= '1';
      wait until rising_edge(ap_clk_0);
      wait until rising_edge(s_axis_tready_0);   
       loop_write:for I in  0 to 1023 loop
          readline(input_file_phase,in_line_phase);
          read(in_line_phase, test_input_phase);
          s_axis_TDATA_1 <= test_input_phase;
          s_axis_TVALID_1 <= '1';
          
          readline(input_file_modulus,in_line_modulus);
          read(in_line_modulus, test_input_modulus);
          s_axis_TDATA_0 <= test_input_modulus;
          s_axis_TVALID_0 <= '1';
          
          wait until rising_edge(ap_clk_0);
          if (I = 1023) then
            s_axis_TVALID_0 <= '0';
            s_axis_TVALID_1 <= '0';
          end if;
        end loop loop_write;
        
        loop_zeroes: for J in 0 to 203 loop
          s_axis_TDATA_1 <= (others=> '0');
          s_axis_TVALID_1 <= '1';
          s_axis_TDATA_0 <= (others=> '0');
          s_axis_TVALID_0 <= '1';
          wait until rising_edge(ap_clk_0);
          if (J = 203) then
            s_axis_TVALID_0 <= '0';
            s_axis_TVALID_1 <= '0';
          end if;
        end loop loop_zeroes;
        file_close(input_file_phase);
        file_close(input_file_modulus);
        
        wait;
      end process test_fir;

end Behavioral;
