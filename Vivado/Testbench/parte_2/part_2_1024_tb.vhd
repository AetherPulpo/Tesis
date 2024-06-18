----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2024 13:00:14
-- Design Name: 
-- Module Name: part_2_1024_tb - Behavioral
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

entity part_2_1024_tb is
--  Port ( );
end part_2_1024_tb;

architecture Behavioral of part_2_1024_tb is
-------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component test_part_2_1024_wrapper
    port(
        ap_clk_0 : in STD_LOGIC;
        ap_done_0 : out STD_LOGIC;
        ap_done_1 : out STD_LOGIC;
        ap_done_2 : out STD_LOGIC;
        ap_done_3 : out STD_LOGIC;
        ap_done_4 : out STD_LOGIC;
        ap_done_5 : out STD_LOGIC;
        ap_idle_0 : out STD_LOGIC;
        ap_ready_0 : out STD_LOGIC;
        ap_rst_n_0 : in STD_LOGIC;
        ap_start_0 : in STD_LOGIC;
        ap_start_1 : in STD_LOGIC;
        ap_start_2 : in STD_LOGIC;
        ap_start_3 : in STD_LOGIC;
        ap_start_4 : in STD_LOGIC;
        ap_start_5 : in STD_LOGIC;
        in_data_V_TDATA_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
        in_data_V_TREADY_0 : out STD_LOGIC;
        in_data_V_TVALID_0 : in STD_LOGIC;
        m_axis_data_tdata_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
        m_axis_data_tlast_0 : out STD_LOGIC;
        m_axis_data_tready_0 : in STD_LOGIC;
        m_axis_data_tuser_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
        m_axis_data_tuser_1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
        m_axis_data_tvalid_0 : out STD_LOGIC;
        out_stream_TLAST_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
        s_axis_data_tlast_0 : in STD_LOGIC; --tlast del ifft
        sel_0 : in STD_LOGIC_VECTOR ( 1 downto 0 )
    );
    end component;
    
--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
        signal ap_clk_0 : STD_LOGIC;
        signal ap_rst_n_0 : STD_LOGIC := '1';
        signal ap_start_0 : STD_LOGIC := '0';
        signal ap_start_1 : STD_LOGIC := '0';
        signal ap_start_2 : STD_LOGIC := '0';
        signal ap_start_3 : STD_LOGIC := '0';
        signal ap_start_4 : STD_LOGIC := '0';
        signal ap_start_5 : STD_LOGIC := '0';
        signal in_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
        signal in_data_V_TVALID_0 : STD_LOGIC := '0';
        signal m_axis_data_tready_0 : STD_LOGIC := '0';
        signal s_axis_data_tlast_0 : STD_LOGIC := '0';
        signal sel_0 : STD_LOGIC_VECTOR ( 1 downto 0 ) := "00";
    -- signals associated with the outputs
        signal ap_done_0 : STD_LOGIC;
        signal ap_done_1 : STD_LOGIC;
        signal ap_done_2 : STD_LOGIC;
        signal ap_done_3 : STD_LOGIC;
        signal ap_done_4 : STD_LOGIC;
        signal ap_done_5 : STD_LOGIC;
        signal ap_idle_0 : STD_LOGIC;
        signal ap_ready_0 : STD_LOGIC;
        signal in_data_V_TREADY_0 : STD_LOGIC;
        signal m_axis_data_tdata_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
        signal m_axis_data_tlast_0 : STD_LOGIC;
        signal m_axis_data_tuser_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
        signal m_axis_data_tuser_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
        signal m_axis_data_tvalid_0 : STD_LOGIC;
        signal out_stream_TLAST_0 : STD_LOGIC_VECTOR ( 0 to 0 );
        
  -- clock period definitions
   constant clock_period : time := 10 ns;
    
begin

----------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_part_2_1024_wrapper port map (
      ap_clk_0 => ap_clk_0,
      ap_done_0 => ap_done_0,
      ap_done_1 => ap_done_1,
      ap_done_2 => ap_done_2,
      ap_done_3 => ap_done_3,
      ap_done_4 => ap_done_4,
      ap_done_5 => ap_done_5,
      ap_idle_0 => ap_idle_0,
      ap_ready_0 => ap_ready_0,
      ap_rst_n_0 => ap_rst_n_0,
      ap_start_0 => ap_start_0,
      ap_start_1 => ap_start_1,
      ap_start_2 => ap_start_2,
      ap_start_3 => ap_start_3,
      ap_start_4 => ap_start_4,
      ap_start_5 => ap_start_5,
      in_data_V_TDATA_0(31 downto 0) => in_data_V_TDATA_0(31 downto 0),
      in_data_V_TREADY_0 => in_data_V_TREADY_0,
      in_data_V_TVALID_0 => in_data_V_TVALID_0,
      m_axis_data_tdata_0(63 downto 0) => m_axis_data_tdata_0(63 downto 0),
      m_axis_data_tlast_0 => m_axis_data_tlast_0,
      m_axis_data_tready_0 => m_axis_data_tready_0,
      m_axis_data_tuser_0(15 downto 0) => m_axis_data_tuser_0(15 downto 0),
      m_axis_data_tuser_1(15 downto 0) => m_axis_data_tuser_1(15 downto 0),
      m_axis_data_tvalid_0 => m_axis_data_tvalid_0,
      out_stream_TLAST_0(0) => out_stream_TLAST_0(0),
      s_axis_data_tlast_0 => s_axis_data_tlast_0,
      sel_0(1 downto 0) => sel_0(1 downto 0)
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
      
      ap_rst_n_0  <= '1';
      
      wait;
   end process reset_proc;
 
-----------------------------------------------
   -- test process
-----------------------------------------------
   test_diag_1: process
      variable test_input : std_logic_vector(31 downto 0);
      file input_file: text;
	  variable in_line: line;
    constant fft512_latency : time := 23.44 us; --24080 ns;
    constant analytic_fft_latency : time := 5180 ns;
   begin
      file_open(input_file,"../../../../normValues_ns_tb.dat",READ_MODE);
      wait for 600 ns;
      wait until rising_edge(ap_clk_0);
      ap_start_0 <= '1'; --Axi_zeros_0
      ap_start_3 <= '1'; --Axi_config_fft
      ap_start_4 <= '1'; --analytic fft
      ap_start_5 <= '1'; -- Axi_config_ifft
      wait until falling_edge(out_stream_TLAST_0(0)); --Terminan los primero 256 ceros
      wait until rising_edge(ap_clk_0);
      ap_start_0 <= '0';
      ap_start_1 <= '1';--Axi Real2Complex
      wait for 50 ns;
      sel_0 <= "01";
      in_data_V_TVALID_0 <= '1'; --Axi Real2Complex
      loop_fft:for I in  0 to 511 loop
          readline(input_file,in_line);
          read(in_line, test_input);
          in_data_V_TDATA_0<= test_input;
          wait until rising_edge(ap_clk_0);
        end loop loop_fft;
        file_close(input_file);
        wait until rising_edge(ap_done_1);
        ap_start_2 <= '1'; --Axi_zeros_1
        sel_0 <= "10";
        wait for 30 us;
--        escritura : for I in 0 to 511 loop
--            wait for 0.1 ns;
--            write(out_line_im,to_bitvector(out_data_V_tdata_0(63 downto 32)),RIGHT,32);
--            writeline(output_file_im,out_line_im);
            
--            write(out_line_re,to_bitvector(out_data_V_tdata_0(31 downto 0)),RIGHT,32);
--            writeline(output_file_re,out_line_re);
            
--            write(out_line_all,to_bitvector(out_data_V_tdata_0),RIGHT,64);
--            writeline(output_file_all,out_line_all);
--            wait until rising_edge(aclk_0);
--        end loop escritura;  
--        file_close(output_file_re);
--        file_close(output_file_im);
--        file_close(output_file_all);
        wait;

      end process test_diag_1;

end Behavioral;
