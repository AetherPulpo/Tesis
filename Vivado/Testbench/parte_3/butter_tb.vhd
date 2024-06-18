----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2024 19:47:15
-- Design Name: 
-- Module Name: butter_tb - Behavioral
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

entity butter_tb is
--  Port ( );
end butter_tb;

architecture Behavioral of butter_tb is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component test_butterworth_wrapper
    port(
        ap_clk_0 : in STD_LOGIC;
        ap_rst_n_0 : in STD_LOGIC;
        ap_start_0 : in STD_LOGIC;
        out_cut_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
        out_cut_data_V_TREADY_0 : in STD_LOGIC;
        out_cut_data_V_TVALID_0 : out STD_LOGIC;
        out_iir_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
        out_iir_data_V_TVALID_0 : out STD_LOGIC;
        s_axis_tdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
        s_axis_tready_0 : out STD_LOGIC;
        s_axis_tvalid_0 : in STD_LOGIC
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
    signal ap_clk_0 : STD_LOGIC;
    signal ap_rst_n_0 : STD_LOGIC :='1';
    signal ap_start_0 : STD_LOGIC := '0';
    signal s_axis_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal s_axis_TVALID_0  : STD_LOGIC :='0';
    signal out_cut_data_V_TREADY_0 : STD_LOGIC := '0';
    
  -- signals associated with the outpus
    signal s_axis_TREADY_0: STD_LOGIC;
    signal out_cut_data_V_TVALID_0 : STD_LOGIC;
    signal out_cut_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal out_iir_data_V_TVALID_0 : STD_LOGIC;
    signal out_iir_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
        
      -- clock period definitions
   constant clock_period : time := 10 ns;    
begin

---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_butterworth_wrapper port map (
      ap_clk_0 => ap_clk_0,
      ap_rst_n_0 => ap_rst_n_0,
      ap_start_0 => ap_start_0,
      out_cut_data_V_TDATA_0(31 downto 0) => out_cut_data_V_TDATA_0(31 downto 0),
      out_cut_data_V_TREADY_0 => out_cut_data_V_TREADY_0,
      out_cut_data_V_TVALID_0 => out_cut_data_V_TVALID_0,
      out_iir_data_V_TDATA_0(31 downto 0) => out_iir_data_V_TDATA_0(31 downto 0),
      out_iir_data_V_TVALID_0 => out_iir_data_V_TVALID_0,
      s_axis_tdata_0(31 downto 0) => s_axis_tdata_0(31 downto 0),
      s_axis_tready_0 => s_axis_tready_0,
      s_axis_tvalid_0 => s_axis_tvalid_0
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
 
 
--  ---------------------------------------------
--    write_iir_1024 (tiene 1024 muestras)
-----------------------------------------------
--    write_butter_1024: process
--        file output_file: text;
--        variable out_line: line;

--    begin
--        file_open(output_file,"../../../../iir_1024_values.dat",WRITE_MODE);
--        wait until rising_edge(out_iir_data_V_TVALID_0);
--        escritura: for J in 0 to 1023 loop
--            wait for 0.1 ns;
--            write(out_line,to_bitvector(out_iir_data_V_tdata_0),RIGHT,32);
--            writeline(output_file,out_line);
--            wait until rising_edge(out_iir_data_V_TVALID_0);
--        end loop;  
--        file_close(output_file);
--        wait;
--    end process write_butter_1024;

 --  ---------------------------------------------
--    write_iir_512 (tiene 512 muestras)
-----------------------------------------------
--    write_butter_512: process
--        file output_file: text;
--        variable out_line: line;

--    begin
--        file_open(output_file,"../../../../iir_512_values.dat",WRITE_MODE);
--        wait until rising_edge(out_cut_data_V_TVALID_0);
--        escritura: for J in 0 to 511 loop
--            wait for 0.1 ns;
--            write(out_line,to_bitvector(out_cut_data_V_tdata_0),RIGHT,32);
--            writeline(output_file,out_line);
--            wait until rising_edge(out_cut_data_V_TVALID_0);
--        end loop;  
--        file_close(output_file);
--        wait;
--    end process write_butter_512;
 
 
 
 -----------------------------------------------
   -- test process
-----------------------------------------------
   test_amplitude: process
      variable test_input : std_logic_vector(31 downto 0);
      file input_file : text;
	  variable in_line : line;
	  variable J : integer := 0;
    constant axi_butter_double_latency : time := 215610 ns;
   begin
      file_open(input_file,"../../../../amplitude_values.dat",READ_MODE); 
      wait for 600 ns;
      wait until rising_edge(ap_clk_0);
      ap_start_0 <= '1';
      wait until rising_edge(s_axis_tready_0);   
       loop_write:for I in  0 to 1023 loop
          readline(input_file,in_line);
          read(in_line, test_input);
          s_axis_TDATA_0 <= test_input;
          s_axis_TVALID_0 <= '1';
          wait until rising_edge(ap_clk_0);
          if (I = 1023) then
             s_axis_TVALID_0 <= '0';
          end if;
        end loop loop_write;
        wait until rising_edge(ap_clk_0);
        file_close(input_file);
        
        wait;
      end process test_amplitude;

end Behavioral;
