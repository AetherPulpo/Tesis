----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2024 18:32:29
-- Design Name: 
-- Module Name: amplitude_tb - Behavioral
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

entity amplitude_tb is
--  Port ( );
end amplitude_tb;

architecture Behavioral of amplitude_tb is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component test_amplitude_wrapper
    port(
    ap_clk_0 : in STD_LOGIC;
    ap_rst_n_0 : in STD_LOGIC;
    ap_start_0 : in STD_LOGIC;
    in_modulus_data_V_TDATA_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_modulus_data_V_TREADY_0 : out STD_LOGIC;
    in_modulus_data_V_TVALID_0 : in STD_LOGIC;
    in_phase_data_V_TDATA_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_phase_data_V_TREADY_0 : out STD_LOGIC;
    in_phase_data_V_TVALID_0 : in STD_LOGIC;
    out_amplitude_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_amplitude_data_V_TREADY_0 : in STD_LOGIC;
    out_amplitude_data_V_TVALID_0 : out STD_LOGIC
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
    signal ap_clk_0 : STD_LOGIC;
    signal ap_rst_n_0 : STD_LOGIC :='1';
    signal ap_start_0 : STD_LOGIC := '0';
    signal in_modulus_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 ); --modulo
    signal in_phase_data_V_TDATA_0: STD_LOGIC_VECTOR ( 31 downto 0 ); --fase
    signal in_modulus_data_V_TVALID_0  : STD_LOGIC :='0';
    signal in_phase_data_V_TVALID_0  : STD_LOGIC :='0';
    signal out_amplitude_data_V_TREADY_0 : STD_LOGIC := '0';
    
  -- signals associated with the outpus
    signal in_modulus_data_V_TREADY_0: STD_LOGIC;
    signal in_phase_data_V_TREADY_0  : STD_LOGIC;
    signal out_amplitude_data_V_TVALID_0 : STD_LOGIC;
    signal out_amplitude_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
        
      -- clock period definitions
   constant clock_period : time := 10 ns;    

begin
---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_amplitude_wrapper port map (
      ap_clk_0 => ap_clk_0,
      ap_rst_n_0 => ap_rst_n_0,
      ap_start_0 => ap_start_0,
      in_modulus_data_V_TDATA_0(31 downto 0) => in_modulus_data_V_TDATA_0(31 downto 0),
      in_modulus_data_V_TREADY_0 => in_modulus_data_V_TREADY_0,
      in_modulus_data_V_TVALID_0 => in_modulus_data_V_TVALID_0,
      in_phase_data_V_TDATA_0(31 downto 0) => in_phase_data_V_TDATA_0(31 downto 0),
      in_phase_data_V_TREADY_0 => in_phase_data_V_TREADY_0,
      in_phase_data_V_TVALID_0 => in_phase_data_V_TVALID_0,
      out_amplitude_data_V_TDATA_0(31 downto 0) => out_amplitude_data_V_TDATA_0(31 downto 0),
      out_amplitude_data_V_TREADY_0 => out_amplitude_data_V_TREADY_0,
      out_amplitude_data_V_TVALID_0 => out_amplitude_data_V_TVALID_0
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
        wait until rising_edge(out_amplitude_data_V_TVALID_0);
        out_amplitude_data_V_TREADY_0 <= '1'; 
        wait until falling_edge(out_amplitude_data_V_TVALID_0);
        out_amplitude_data_V_TREADY_0 <= '0';
    end process handshake_0;
 
 
  -----------------------------------------------
   -- write_fir_modulus (tiene 1228 muestras)
-----------------------------------------------
--    write_amplitude: process
--        file output_file: text;
--        variable out_line: line;

--    begin
--        file_open(output_file,"../../../../amplitude_values.dat",WRITE_MODE);
--        wait until rising_edge(out_amplitude_data_V_TVALID_0);
--        escritura: for I in 0 to 1023 loop
--            wait for 0.1 ns;
--            write(out_line,to_bitvector(out_amplitude_data_V_tdata_0),RIGHT,32);
--            writeline(output_file,out_line);
--            wait until rising_edge(ap_clk_0);
--        end loop;  
--        file_close(output_file);
--        wait;
--    end process write_amplitude;
    
 -----------------------------------------------
   -- test process
-----------------------------------------------
   test_amplitude: process
      variable test_input_phase : std_logic_vector(31 downto 0);
      variable test_input_modulus : std_logic_vector(31 downto 0);
      file input_file_phase : text;
      file input_file_modulus : text;
	  variable in_line_phase : line;
	  variable in_line_modulus : line;
--	  variable J : integer := 0;
    constant axi_amplitude_latency : time := 10510 ns;
   begin
      file_open(input_file_phase,"../../../../fir_phase_1024_values.dat",READ_MODE);
      file_open(input_file_modulus,"../../../../fir_modulus_1024_values.dat",READ_MODE);  
      wait for 600 ns;
      wait until rising_edge(ap_clk_0);
      ap_start_0 <= '1';
      wait until rising_edge(ap_clk_0);
--      wait until rising_edge(s_axis_tready_0);   
       loop_write:for I in  0 to 1023 loop
          readline(input_file_phase,in_line_phase);
          read(in_line_phase, test_input_phase);
          in_phase_data_V_TDATA_0 <= test_input_phase;
          in_phase_data_V_TVALID_0 <= '1';
          
          readline(input_file_modulus,in_line_modulus);
          read(in_line_modulus, test_input_modulus);
          in_modulus_data_V_TDATA_0 <= test_input_modulus;
          in_modulus_data_V_TVALID_0 <= '1';
          
          wait until rising_edge(ap_clk_0);
          if (I = 1023) then
             in_modulus_data_V_TVALID_0 <= '0';
             in_phase_data_V_TVALID_0 <= '0';
          end if;
        end loop loop_write;
        file_close(input_file_phase);
        file_close(input_file_modulus);
        
        wait;
      end process test_amplitude;

end Behavioral;

