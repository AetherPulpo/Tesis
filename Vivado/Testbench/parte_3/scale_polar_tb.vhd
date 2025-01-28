----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2024 22:02:47
-- Design Name: 
-- Module Name: scale_polar_tb - Behavioral
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

entity scale_polar_tb is
--  Port ( );
end scale_polar_tb;

architecture Behavioral of scale_polar_tb is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component scale_polar_translate_wrapper
    port(
    ap_clk_0 : in STD_LOGIC;
    ap_done_0 : out STD_LOGIC;
    ap_done_1 : out STD_LOGIC;
    ap_rst_n_0 : in STD_LOGIC;
    ap_start_0 : in STD_LOGIC;
    in_ifft_data_V_TDATA_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    in_ifft_data_V_TREADY_0 : out STD_LOGIC;
    in_ifft_data_V_TVALID_0 : in STD_LOGIC;
    in_modulus_scale_data_V_TREADY_0 : out STD_LOGIC;
    out_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_data_V_TREADY_0 : in STD_LOGIC;
    out_data_V_TVALID_0 : out STD_LOGIC;
    out_modulus_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_modulus_V_TVALID_0 : out STD_LOGIC;
    out_phase_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_phase_V_TREADY_0 : in STD_LOGIC;
    out_phase_V_TVALID_0 : out STD_LOGIC
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
    signal ap_clk_0 : STD_LOGIC;
    signal ap_rst_n_0 : STD_LOGIC :='1';
    signal ap_start_0 : STD_LOGIC := '0';
    signal in_ifft_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
    signal in_ifft_data_V_TVALID_0 : STD_LOGIC :='0';
    signal out_data_V_TREADY_0 : STD_LOGIC := '0';
    signal out_phase_V_TREADY_0 : STD_LOGIC := '0';
    
  -- signals associated with the outpus
    signal ap_done_0 : STD_LOGIC;
    signal ap_done_1 : STD_LOGIC;
    signal in_ifft_data_V_TREADY_0 : STD_LOGIC;
    signal in_modulus_scale_data_V_TREADY_0 : STD_LOGIC;
    signal out_data_V_TVALID_0 : STD_LOGIC;
    signal out_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal out_modulus_V_TVALID_0 : STD_LOGIC;
    signal out_modulus_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal out_phase_V_TVALID_0 : STD_LOGIC;
    signal out_phase_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    
    
      -- clock period definitions
   constant clock_period : time := 10 ns;    

begin

---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: scale_polar_translate_wrapper port map (
      ap_clk_0 => ap_clk_0,
      ap_done_0 => ap_done_0,
      ap_done_1 => ap_done_1,
      ap_rst_n_0 => ap_rst_n_0,
      ap_start_0 => ap_start_0,
      in_ifft_data_V_TDATA_0(63 downto 0) => in_ifft_data_V_TDATA_0(63 downto 0),
      in_ifft_data_V_TREADY_0 => in_ifft_data_V_TREADY_0,
      in_ifft_data_V_TVALID_0 => in_ifft_data_V_TVALID_0,
      in_modulus_scale_data_V_TREADY_0 => in_modulus_scale_data_V_TREADY_0,
      out_data_V_TDATA_0(31 downto 0) => out_data_V_TDATA_0(31 downto 0),
      out_data_V_TREADY_0 => out_data_V_TREADY_0,
      out_data_V_TVALID_0 => out_data_V_TVALID_0,
      out_modulus_V_TDATA_0(31 downto 0) => out_modulus_V_TDATA_0(31 downto 0),
      out_modulus_V_TVALID_0 => out_modulus_V_TVALID_0,
      out_phase_V_TDATA_0(31 downto 0) => out_phase_V_TDATA_0(31 downto 0),
      out_phase_V_TREADY_0 => out_phase_V_TREADY_0,
      out_phase_V_TVALID_0 => out_phase_V_TVALID_0
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
   -- handshake_phase
-----------------------------------------------
    handshake_phase: process
    begin
        wait until rising_edge(out_phase_V_TVALID_0);
        out_phase_V_TREADY_0 <= '1';
        wait until falling_edge(out_phase_V_TVALID_0);
        out_phase_V_TREADY_0 <= '0';  
        wait;    
    end process handshake_phase;


 -----------------------------------------------
   -- handshake_modulus
-----------------------------------------------
    handshake_modulus: process
    begin
        wait until rising_edge(out_data_V_TVALID_0);
        out_data_V_TREADY_0 <= '1'; 
        wait until falling_edge(out_data_V_TVALID_0);
        out_data_V_TREADY_0 <= '0';
        wait;
    end process handshake_modulus;

 -----------------------------------------------
   -- write_phase
-----------------------------------------------
--    write_phase: process
--        file output_file_phase: text;
--        variable out_line_phase: line;
--    begin
--        file_open(output_file_phase,"../../../../phase_values_v4.dat",WRITE_MODE);
--        wait until rising_edge(out_phase_V_TVALID_0);
--        escritura_fase : for I in 0 to 1023 loop
--            wait for 0.1 ns;
--            write(out_line_phase,to_bitvector(out_phase_V_tdata_0),RIGHT,32);
--            writeline(output_file_phase,out_line_phase);
--            wait until rising_edge(ap_clk_0);
--        end loop escritura_fase;  
--        file_close(output_file_phase);
--        wait;
--    end process write_phase;
    

 -----------------------------------------------
   -- write_scaled_modulus (A ESTOS VALORES FALTA DIVIDIRLOS POR 128)
-----------------------------------------------
--    write_scaled_modulus: process
--        file output_file_scaled_modulus: text;
--        variable out_line_scaled_modulus: line;
--    begin
--        file_open(output_file_scaled_modulus,"../../../../scaled_modulus_values_v4.dat",WRITE_MODE);
--        wait until rising_edge(out_modulus_V_TVALID_0);
--        escritura_modulo_escalado : for I in 0 to 1023 loop
--            wait for 0.1 ns;
--            write(out_line_scaled_modulus,to_bitvector(out_modulus_V_tdata_0),RIGHT,32);
--            writeline(output_file_scaled_modulus,out_line_scaled_modulus);
--            wait until rising_edge(ap_clk_0);
--        end loop escritura_modulo_escalado;  
--        file_close(output_file_scaled_modulus);
--        wait;
--    end process write_scaled_modulus;

 -----------------------------------------------
   -- write_modulus (VALORES YA DESESCALADOS (CON ESTOS COMPARO LOS VALORES DE PYTHON))
-----------------------------------------------
--    write_modulus: process
--        file output_file_modulus: text;
--        variable out_line_modulus: line;
--    begin
--        file_open(output_file_modulus,"../../../../modulus_values_v4.dat",WRITE_MODE);
--        wait until rising_edge(out_data_V_TVALID_0);
--        escritura_modulo_original : for I in 0 to 1023 loop
--            wait for 0.1 ns;
--            write(out_line_modulus,to_bitvector(out_data_V_tdata_0),RIGHT,32);
--            writeline(output_file_modulus,out_line_modulus);
--            wait until rising_edge(ap_clk_0);
--        end loop escritura_modulo_original;  
--        file_close(output_file_modulus);
--        wait;
--    end process write_modulus;



 -----------------------------------------------
   -- test process
-----------------------------------------------
   test_scale_polar: process
      variable test_input : std_logic_vector(63 downto 0);
      file input_file: text;
	  variable in_line: line;
    constant axi_scale_latency : time := 10300 ns;
    constant axi_polar_latency : time := 10890 ns;
    constant axi_deescalate_latency : time := 10300 ns;
   begin
      file_open(input_file,"../../../../axi_ifft_1024_all_tb.dat",READ_MODE);  
      wait for 600 ns;
      wait until rising_edge(ap_clk_0);
      ap_start_0 <= '1';
      wait until rising_edge(ap_clk_0);
       loop_write:for I in  0 to 1023 loop
          readline(input_file,in_line);
          read(in_line, test_input);
          in_ifft_data_V_TDATA_0 <= test_input;
          in_ifft_data_V_TVALID_0 <= '1';
          wait until rising_edge(ap_clk_0);
          if (I = 1023) then
            in_ifft_data_V_TVALID_0 <= '0';
          end if;
        end loop loop_write;
        file_close(input_file);
        wait;
      end process test_scale_polar;

end Behavioral;
