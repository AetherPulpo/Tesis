----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.05.2024 17:51:38
-- Design Name: 
-- Module Name: axi_analytic_1024_fft_tb - Behavioral
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

entity axi_analytic_1024_fft_tb is
--  Port ( );
end axi_analytic_1024_fft_tb;

architecture Behavioral of axi_analytic_1024_fft_tb is

------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component axi_analytic_1024_fft_wrapper
    port(
    ap_clk_0 : in STD_LOGIC;
    ap_done_0 : out STD_LOGIC;
    ap_rst_n_0 : in STD_LOGIC;
    ap_start_0 : in STD_LOGIC;
    in_data_V_TDATA_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    in_data_V_TREADY_0 : out STD_LOGIC;
    in_data_V_TVALID_0 : in STD_LOGIC;
    out_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    out_data_V_TREADY_0 : in STD_LOGIC;
    out_data_V_TVALID_0 : out STD_LOGIC
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
    signal ap_clk_0 : STD_LOGIC;
    signal ap_rst_n_0 : STD_LOGIC :='1';
    signal ap_start_0 : STD_LOGIC := '0';
    signal in_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
    signal in_data_V_TVALID_0 : STD_LOGIC := '0';
    signal out_data_V_TREADY_0 : STD_LOGIC := '0';
  -- signals associated with the outpus
    signal ap_done_0 : STD_LOGIC;
    signal out_data_V_TVALID_0 : STD_LOGIC;
    signal in_data_V_TREADY_0 : STD_LOGIC; 
    signal out_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
    
      -- clock period definitions
   constant clock_period : time := 10 ns;

begin

---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: axi_analytic_1024_fft_wrapper port map (
      ap_clk_0 => ap_clk_0,
      ap_done_0 => ap_done_0,
      ap_rst_n_0 => ap_rst_n_0,
      ap_start_0 => ap_start_0,
      in_data_V_TDATA_0(63 downto 0) => in_data_V_TDATA_0(63 downto 0),
      in_data_V_TREADY_0 => in_data_V_TREADY_0,
      in_data_V_TVALID_0 => in_data_V_TVALID_0,
      out_data_V_TDATA_0(63 downto 0) => out_data_V_TDATA_0(63 downto 0),
      out_data_V_TREADY_0 => out_data_V_TREADY_0,
      out_data_V_TVALID_0 => out_data_V_TVALID_0
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

    ----------------------------------------------
   -- test process
-----------------------------------------------
   test_diag_1: process
      variable test_input : std_logic_vector(63 downto 0);
      file input_file: text;
	  variable in_line: line;
    constant real2complex_latency : time := 5150 ns;
   begin
      file_open(input_file,"../../../../fft_1024_2_all_tb.dat",READ_MODE);
      wait for 600 ns;
      wait until rising_edge(ap_clk_0);
       ap_start_0 <= '1';
       wait for 10 ns;
       wait until rising_edge(ap_clk_0);
       lectura:for I in  0 to 1023 loop
          readline(input_file,in_line);
          read(in_line, test_input);
          in_data_V_TDATA_0 <= test_input;
          in_data_V_TVALID_0 <= '1'; 
          wait until rising_edge(ap_clk_0);
       end loop lectura;
          file_close(input_file);
        in_data_V_TVALID_0 <= '0';    
       wait;
      end process test_diag_1;

 ready_valid: process
       variable test_input : std_logic_vector(63 downto 0);
	  file output_file_re: text;
	  file output_file_im: text;
	  file output_file_all: text;
	  variable out_line_re: line;
	  variable out_line_im : line;
	  variable out_line_all: line;
    constant real2complex_latency : time := 5150 ns;
   begin
	  file_open(output_file_re,"../../../../compare_analytic_fft_1024_re_tb.dat",WRITE_MODE);
	  file_open(output_file_im,"../../../../compare_analytic_fft_1024_im_tb.dat",WRITE_MODE);
	  file_open(output_file_all,"../../../../compare_analytic_fft_1024_all_tb.dat",WRITE_MODE);
 wait for 600 ns;
        wait until rising_edge (out_data_V_TVALID_0);
         out_data_V_TREADY_0 <='1';
        escritura : for I in 0 to 1023 loop
            wait for 0.1 ns;
            write(out_line_im,to_bitvector(out_data_V_tdata_0(63 downto 32)),RIGHT,32);
            writeline(output_file_im,out_line_im);
            
            write(out_line_re,to_bitvector(out_data_V_tdata_0(31 downto 0)),RIGHT,32);
            writeline(output_file_re,out_line_re);
            
            write(out_line_all,to_bitvector(out_data_V_tdata_0),RIGHT,64);
            writeline(output_file_all,out_line_all);
            wait until rising_edge(ap_clk_0);
        end loop escritura;  
        file_close(output_file_re);
        file_close(output_file_im);
        file_close(output_file_all);

          
      wait;
 end process ready_valid;    

end Behavioral;
