----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2024 13:03:34
-- Design Name: 
-- Module Name: axi_norm_tb - Behavioral
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

entity axi_norm_tb is
--  Port ( );
end axi_norm_tb;

architecture Behavioral of axi_norm_tb is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
component fifo_norm_axi_wrapper
port(
        clk_0 : in STD_LOGIC;
        ap_rst_n_0 : in STD_LOGIC;
        srst_0 : in STD_LOGIC;
        wr_en_0 : in STD_LOGIC;
        ap_start_0 : in STD_LOGIC;
        din_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
        in_mean_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
        out_norm_data_V_TREADY_0 : in STD_LOGIC;
        data_count_0 : out STD_LOGIC_VECTOR ( 9 downto 0 );
        ap_done_0 : out STD_LOGIC;
        ap_idle_0 : out STD_LOGIC;
        ap_ready_0 : out STD_LOGIC;
        full_0 : out STD_LOGIC;
        out_norm_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
        out_norm_data_V_TVALID_0 : out STD_LOGIC        
    );
end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
    -- signals associated with the inputs
        signal clk_0 : STD_LOGIC;
        signal ap_rst_n_0 : STD_LOGIC := '1';
        signal srst_0 : STD_LOGIC := '0';
        signal wr_en_0 : STD_LOGIC := '0';
        signal ap_start_0 : STD_LOGIC := '0' ;
        signal din_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
        signal in_mean_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
        signal out_norm_data_V_TREADY_0 : STD_LOGIC := '0';
    -- signals associated with the outpus
        signal data_count_0 : STD_LOGIC_VECTOR ( 9 downto 0 );
        signal ap_done_0 : STD_LOGIC;
        signal ap_idle_0 : STD_LOGIC;
        signal ap_ready_0 : STD_LOGIC;
        signal full_0 : STD_LOGIC;
        signal out_norm_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
        signal out_norm_data_V_TVALID_0 : STD_LOGIC;
            
      -- clock period definitions
   constant clock_period : time := 10 ns;

begin

---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: fifo_norm_axi_wrapper port map (
        clk_0  => clk_0 ,
        ap_rst_n_0 => ap_rst_n_0,
        srst_0 => srst_0,
        wr_en_0 => wr_en_0, 
        ap_start_0 => ap_start_0,
        din_0 => din_0,
        in_mean_0 => in_mean_0,
        out_norm_data_V_TREADY_0 => out_norm_data_V_TREADY_0,
        data_count_0  => data_count_0,
        full_0 => full_0,
        ap_done_0 => ap_done_0,
        ap_idle_0 => ap_idle_0,
        ap_ready_0 => ap_ready_0,
        out_norm_data_V_TDATA_0  => out_norm_data_V_TDATA_0,
        out_norm_data_V_TVALID_0 => out_norm_data_V_TVALID_0
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
      ap_rst_n_0 <= '0';
      srst_0 <= '1';
      
      wait for 300 ns;
      wait until rising_edge(clk_0);
      
      ap_rst_n_0 <= '1';
      srst_0 <= '0';
      wait;
   end process reset_proc;
  
  -----------------------------------------------
   -- test process
-----------------------------------------------
   test_diag_1: process
      variable test_input : std_logic_vector(31 downto 0);
      file input_file: text;
	  file input_file_mean: text;
	  file output_file: text;
	  variable in_line: line;
	  variable in_line_mean: line;
	  variable out_line: line;
    constant axi_norm_latency : time := 5300 ns;
   begin
      file_open(input_file,"../../../../rectValues_ns_tb.dat",READ_MODE);
	  file_open(input_file_mean,"../../../../meanValue_ms_tb.dat",READ_MODE);
	  file_open(output_file,"../../../../axi_norm_float_tb.dat",WRITE_MODE);
      wait for 600 ns;
      wait until rising_edge(clk_0);
       loop_write_fifo:for I in  0 to 511 loop
          readline(input_file,in_line);
          read(in_line, test_input);
          din_0 <= test_input;
          wait for 0.1 ns;
          wr_en_0 <= '1';
          wait until rising_edge(clk_0);
          if (I = 511) then
            wr_en_0 <= '0';
          end if;
        end loop loop_write_fifo;
        file_close(input_file);
        readline(input_file_mean,in_line_mean);
        read(in_line_mean, test_input);
        in_mean_0 <= test_input;
        ap_start_0 <= '1';
        wait until rising_edge(out_norm_data_V_TVALID_0);
        out_norm_data_V_TREADY_0 <= '1';
        escritura : for I in 0 to 511 loop
            wait for 0.1 ns;
            write(out_line,to_bitvector(out_norm_data_V_tdata_0),RIGHT,32);
            writeline(output_file,out_line);
            wait until rising_edge(clk_0);
        end loop escritura;  
        file_close(output_file);
        wait;
      end process test_diag_1;

  

end Behavioral;
