----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2024 19:34:13
-- Design Name: 
-- Module Name: part_2_tb - Behavioral
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

entity part_2_tb is
--  Port ( );
end part_2_tb;

architecture Behavioral of part_2_tb is
-------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component test_part_2_wrapper
    port(
        TLAST_0 : out STD_LOGIC;
        aclk_0 : in STD_LOGIC;
        ap_done_0 : out STD_LOGIC;
        ap_idle_0 : out STD_LOGIC;
        ap_ready_0 : out STD_LOGIC;
        ap_start_0 : in STD_LOGIC;
        aresetn_0 : in STD_LOGIC;
        event_data_in_channel_halt_0 : out STD_LOGIC;
        event_data_out_channel_halt_0 : out STD_LOGIC;
        event_frame_started_0 : out STD_LOGIC;
        event_status_channel_halt_0 : out STD_LOGIC;
        event_tlast_missing_0 : out STD_LOGIC;
        event_tlast_unexpected_0 : out STD_LOGIC;
        m_axis_data_tlast_0 : out STD_LOGIC;
        m_axis_data_tvalid_0 : out STD_LOGIC;
        m_axis_data_tuser_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
        out_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
        out_data_V_TREADY_0 : in STD_LOGIC;
        out_data_V_TVALID_0 : out STD_LOGIC;
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
        signal ap_start_0 : STD_LOGIC := '0';
        signal out_data_V_TREADY_0 :  STD_LOGIC := '0';
        signal s_axis_config_tdata_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
        signal s_axis_config_tvalid_0 : STD_LOGIC := '0';
        signal s_axis_data_tdata_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
        signal s_axis_data_tlast_0 : STD_LOGIC :='0';
        signal s_axis_data_tvalid_0 : STD_LOGIC := '0';
    -- signals associated with the outputs
        signal TLAST_0 : STD_LOGIC;
        signal ap_done_0 : STD_LOGIC;
        signal ap_idle_0 : STD_LOGIC;
        signal ap_ready_0 : STD_LOGIC;
        signal event_data_in_channel_halt_0 : STD_LOGIC;
        signal event_data_out_channel_halt_0 : STD_LOGIC;
        signal event_frame_started_0 : STD_LOGIC;
        signal event_status_channel_halt_0 : STD_LOGIC;
        signal event_tlast_missing_0 : STD_LOGIC;
        signal event_tlast_unexpected_0 : STD_LOGIC;
        signal m_axis_data_tvalid_0 : STD_LOGIC;
        signal m_axis_data_tlast_0 : STD_LOGIC;
        signal m_axis_data_tuser_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
        signal out_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
        signal out_data_V_TVALID_0 : STD_LOGIC;
        signal s_axis_config_tready_0 : STD_LOGIC;
        signal s_axis_data_tready_0 : STD_LOGIC;
        
  -- clock period definitions
   constant clock_period : time := 10 ns;

begin
----------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_part_2_wrapper port map (
        aclk_0 => aclk_0,
        aresetn_0 => aresetn_0,
        ap_start_0 => ap_start_0,
        out_data_V_TREADY_0 => out_data_V_TREADY_0,
        s_axis_config_tdata_0 => s_axis_config_tdata_0,
        s_axis_config_tvalid_0 => s_axis_config_tvalid_0,
        s_axis_data_tdata_0 => s_axis_data_tdata_0,
        s_axis_data_tlast_0 => s_axis_data_tlast_0,
        s_axis_data_tvalid_0 => s_axis_data_tvalid_0,
        TLAST_0 => TLAST_0,
        ap_done_0 => ap_done_0,
        ap_idle_0 => ap_idle_0,
        ap_ready_0 => ap_ready_0,
        event_data_in_channel_halt_0 => event_data_in_channel_halt_0,
        event_data_out_channel_halt_0 => event_data_out_channel_halt_0, 
        event_frame_started_0 => event_frame_started_0,
        event_status_channel_halt_0 => event_status_channel_halt_0,
        event_tlast_missing_0 => event_tlast_missing_0,
        event_tlast_unexpected_0  => event_tlast_unexpected_0,
        m_axis_data_tvalid_0 => m_axis_data_tvalid_0,
        m_axis_data_tlast_0 => m_axis_data_tlast_0,
        m_axis_data_tuser_0 => m_axis_data_tuser_0,
        out_data_V_TDATA_0 => out_data_V_TDATA_0,
        out_data_V_TVALID_0 => out_data_V_TVALID_0,
        s_axis_config_tready_0 => s_axis_config_tready_0,
        s_axis_data_tready_0 => s_axis_data_tready_0
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
 
-----------------------------------------------
   -- test process
-----------------------------------------------
   test_diag_1: process
      variable test_input : std_logic_vector(31 downto 0);
      file input_file: text;
	  file output_file_re: text;
	  file output_file_im: text;
	  file output_file_all: text;
	  variable in_line: line;
	  variable out_line_re: line;
	  variable out_line_im : line;
	  variable out_line_all: line;
    constant fft512_latency : time := 23.44 us; --24080 ns;
    constant analytic_fft_latency : time := 5180 ns;
   begin
      file_open(input_file,"../../../../normValues_ns_tb.dat",READ_MODE);
	  file_open(output_file_re,"../../../../analytic_fft_re_tb.dat",WRITE_MODE);
	  file_open(output_file_im,"../../../../analytic_fft_im_tb.dat",WRITE_MODE);
	  file_open(output_file_all,"../../../../analytic_fft_all_tb.dat",WRITE_MODE);
      wait for 600 ns;
      wait until rising_edge(aclk_0);
       s_axis_config_tvalid_0 <= '1';
       s_axis_data_tvalid_0  <= '1';
       s_axis_config_tdata_0  <= "0000000000000001";  
       wait until rising_edge(s_axis_data_tready_0); 
       loop_fft:for I in  0 to 511 loop
          readline(input_file,in_line);
          read(in_line, test_input);
          if (I = 511) then
            s_axis_data_tlast_0 <= '1';
          end if;
          s_axis_data_tdata_0(63 downto 32) <= (others => '0'); 
          s_axis_data_tdata_0(31 downto 0) <= test_input;
          wait until rising_edge(aclk_0);
          if (I = 511) then
            s_axis_data_tvalid_0 <= '0';
            s_axis_data_tlast_0 <= '0';
          end if;
        end loop loop_fft;
        file_close(input_file);
        wait until rising_edge(m_axis_data_tvalid_0);
        ap_start_0 <= '1';
        wait until rising_edge(out_data_V_TVALID_0);
        out_data_V_TREADY_0 <= '1';
       -- wait for analytic_fft_latency;
        escritura : for I in 0 to 511 loop
            wait for 0.1 ns;
            write(out_line_im,to_bitvector(out_data_V_tdata_0(63 downto 32)),RIGHT,32);
            writeline(output_file_im,out_line_im);
            
            write(out_line_re,to_bitvector(out_data_V_tdata_0(31 downto 0)),RIGHT,32);
            writeline(output_file_re,out_line_re);
            
            write(out_line_all,to_bitvector(out_data_V_tdata_0),RIGHT,64);
            writeline(output_file_all,out_line_all);
            wait until rising_edge(aclk_0);
        end loop escritura;  
        file_close(output_file_re);
        file_close(output_file_im);
        file_close(output_file_all);
        wait;

          
      wait;
      end process test_diag_1;



end Behavioral;
