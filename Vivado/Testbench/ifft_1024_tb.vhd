----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.05.2024 19:45:02
-- Design Name: 
-- Module Name: ifft_1024_tb - Behavioral
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

entity ifft_1024_tb is
--  Port ( );
end ifft_1024_tb;

architecture Behavioral of ifft_1024_tb is
--------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component ifft_1024_wrapper
    port(
        aclk_0 : in STD_LOGIC;
        aresetn_0 : in STD_LOGIC;
        m_axis_data_tdata_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
        m_axis_data_tlast_0 : out STD_LOGIC;
        m_axis_data_tready_0 : in STD_LOGIC;
        m_axis_data_tuser_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
        m_axis_data_tvalid_0 : out STD_LOGIC;
        s_axis_config_tdata_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
        s_axis_config_tready_0 : out STD_LOGIC;
        s_axis_config_tvalid_0 : in STD_LOGIC;
        s_axis_data_tdata_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
        s_axis_data_tlast_0 : in STD_LOGIC;
        s_axis_data_tready_0 : out STD_LOGIC;
        s_axis_data_tvalid_0 : in STD_LOGIC  
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
        signal aclk_0 : STD_LOGIC;
        signal aresetn_0 : STD_LOGIC := '1';
        signal m_axis_data_tready_0 : STD_LOGIC := '0';
        signal s_axis_config_tdata_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
        signal s_axis_config_tvalid_0 : STD_LOGIC := '0';
        signal s_axis_data_tdata_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
        signal s_axis_data_tlast_0 : STD_LOGIC;
        signal s_axis_data_tvalid_0 : STD_LOGIC := '0';
   -- signals associated with the inputs
        signal m_axis_data_tdata_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
        signal m_axis_data_tlast_0 : STD_LOGIC;
        signal m_axis_data_tuser_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
        signal m_axis_data_tvalid_0 : STD_LOGIC;
        signal s_axis_config_tready_0 : STD_LOGIC;
        signal s_axis_data_tready_0 : STD_LOGIC;    


   -- clock period definitions
   constant clock_period : time := 10 ns;

begin
----------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: ifft_1024_wrapper port map (
      aclk_0 => aclk_0,
      aresetn_0 => aresetn_0,
      m_axis_data_tdata_0(63 downto 0) => m_axis_data_tdata_0(63 downto 0),
      m_axis_data_tlast_0 => m_axis_data_tlast_0,
      m_axis_data_tready_0 => m_axis_data_tready_0,
      m_axis_data_tuser_0(15 downto 0) => m_axis_data_tuser_0(15 downto 0),
      m_axis_data_tvalid_0 => m_axis_data_tvalid_0,
      s_axis_config_tdata_0(15 downto 0) => s_axis_config_tdata_0(15 downto 0),
      s_axis_config_tready_0 => s_axis_config_tready_0,
      s_axis_config_tvalid_0 => s_axis_config_tvalid_0,
      s_axis_data_tdata_0(63 downto 0) => s_axis_data_tdata_0(63 downto 0),
      s_axis_data_tlast_0 => s_axis_data_tlast_0,
      s_axis_data_tready_0 => s_axis_data_tready_0,
      s_axis_data_tvalid_0 => s_axis_data_tvalid_0
        );
----------------------------------------------
   -- clock process definitions
----------------------------------------------
   clock_proc: process
   begin
		aclk_0 <= '0';
		wait for clock_period/2;
		aclk_0 <= '1';
		wait for clock_period/2;
   end process clock_proc;
 
    -----------------------------------------------
   -- reset stimulus process
	-----------------------------------------------
   reset_proc: process
   begin		
      -- hold reset state = '1' for 300 ns
      wait for 300 ns;
      wait until rising_edge(aclk_0);	
		-- inactive reset
      aresetn_0 <= '0';
      
      wait for 300 ns;
      wait until rising_edge(aclk_0);
      
      aresetn_0 <= '1';
      
      wait;
   end process reset_proc;
 
 config: process

 begin
     wait for 600 ns;
     wait until rising_edge(aclk_0);
     s_axis_config_tdata_0  <= "0000000000000000";
     s_axis_config_tvalid_0 <= '1';
 wait;
 end process config;
 
ready: process
 	  file output_file_re: text;
	  file output_file_im: text;
	  file output_file_all: text;
	  variable out_line_re: line;
	  variable out_line_im : line;
	  variable out_line_all: line;
begin
 	file_open(output_file_re,"../../../../compare_ifft_1024_re_tb.dat",WRITE_MODE);
	file_open(output_file_im,"../../../../compare_ifft_1024_im_tb.dat",WRITE_MODE);
	file_open(output_file_all,"../../../../compare_ifft_1024_all_tb.dat",WRITE_MODE);
    wait for 600 ns;
    wait until rising_edge(aclk_0);
    wait until rising_edge(m_axis_data_tvalid_0);
    m_axis_data_tready_0 <= '1';
        escritura : for I in 0 to 1023 loop
            wait for 0.1 ns;
            write(out_line_im,to_bitvector(m_axis_data_tdata_0(63 downto 32)),RIGHT,32);
            writeline(output_file_im,out_line_im);
            
            write(out_line_re,to_bitvector(m_axis_data_tdata_0(31 downto 0)),RIGHT,32);
            writeline(output_file_re,out_line_re);
            
            write(out_line_all,to_bitvector(m_axis_data_tdata_0),RIGHT,64);
            writeline(output_file_all,out_line_all);
            wait until rising_edge(aclk_0);
            
        end loop escritura;  
          file_close(output_file_re);
          file_close(output_file_im);
          file_close(output_file_all);
    wait;
end process ready; 
 
-----------------------------------------------
   -- test process
-----------------------------------------------
   test_diag_1: process
      variable test_input : std_logic_vector(63 downto 0);
      file input_file: text;

	  variable in_line: line;

    constant fft_latency : time := 45.2 us; --45840 ns mejor
   begin
      file_open(input_file,"../../../../compare_analytic_fft_1024_all_tb.dat",READ_MODE);

      wait for 600 ns;
      wait until rising_edge(aclk_0);
      wait until rising_edge(s_axis_data_tready_0);
      s_axis_data_tvalid_0  <= '1'; 
      lectura_file:for I in 0 to 1023 loop
          readline(input_file,in_line);
          read(in_line, test_input);
          s_axis_data_tdata_0 <= test_input;
          wait until rising_edge(aclk_0);
       end loop lectura_file;
       file_close(input_file);
       s_axis_data_tvalid_0 <= '0'; 
      
      wait;
      end process test_diag_1;

end Behavioral;
