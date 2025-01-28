----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2024 10:30:07
-- Design Name: 
-- Module Name: only_fir_tb - Behavioral
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

entity only_fir_tb is
--  Port ( );
end only_fir_tb;

architecture Behavioral of only_fir_tb is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component only_fir_wrapper
    port(
    ap_clk_0 : in STD_LOGIC;
    ap_rst_n_0 : in STD_LOGIC;
    ap_start_0 : in STD_LOGIC;
    m_axis_tdata_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tready_0 : in STD_LOGIC;
    m_axis_tvalid_0 : out STD_LOGIC;
    out_fir_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_fir_data_V_TVALID_0 : out STD_LOGIC;
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
    signal s_axis_TVALID_0 : STD_LOGIC := '0';
    signal m_axis_TREADY_0 : STD_LOGIC := '0';
    
  -- signals associated with the outpus
    signal out_fir_data_V_TVALID_0 : STD_LOGIC;
    signal out_fir_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_axis_TVALID_0 : STD_LOGIC;
    signal m_axis_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal s_axis_tready_0 : STD_LOGIC;
    
    
      -- clock period definitions
   constant clock_period : time := 10 ns;    
begin
---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: only_fir_wrapper port map (
      ap_clk_0 => ap_clk_0,
      ap_rst_n_0 => ap_rst_n_0,
      ap_start_0 => ap_start_0,
      m_axis_tdata_0(31 downto 0) => m_axis_tdata_0(31 downto 0),
      m_axis_tready_0 => m_axis_tready_0,
      m_axis_tvalid_0 => m_axis_tvalid_0,
      out_fir_data_V_TDATA_0(31 downto 0) => out_fir_data_V_TDATA_0(31 downto 0),
      out_fir_data_V_TVALID_0 => out_fir_data_V_TVALID_0,
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
   -- handshake
-------------------------------------------------
--    handshakes_1: process
--    begin
--        wait until rising_edge(out_fir_data_V_TVALID_0);
--        out_fir_data_V_TREADY_0 <= '1'; 
--        wait until falling_edge(out_fir_data_V_TVALID_0);
--        out_fir_data_V_TREADY_0 <= '0';
--    end process handshakes_1;


 
    
    
 -----------------------------------------------
   --reading
-----------------------------------------------
--    reading : process
--        variable test_input : std_logic_vector(31 downto 0);
--        file input_file: text;
--        variable in_line: line;
--        variable I : integer := 0;
--    begin  
--        file_open(input_file,"../../../../phase_values_v4.dat",READ_MODE);
--        while I < 1024 loop
--            if(rising_edge(ap_clk_0)) then
--               if(ap_start_0 = '1' and in_data_v_tready_0 = '1') then
--                   readline(input_file,in_line);
--                   read(in_line, test_input);
--                   in_data_V_TDATA_0 <= test_input;
--                   in_data_V_TVALID_0 <= '1';
--                   I := I + 1;
--                   if (I = 1024) then
--                    file_close(input_file);
--                  end if;
--               else
--                 in_data_V_TVALID_0 <= '0';
--               end if;
--           end if;
--        end loop;
--        wait;
--        if(rising_edge(ap_clk_0)) then
--            if(ap_start_0 = '1' and in_data_v_tready_0 = '1') then
--               readline(input_file,in_line);
--               read(in_line, test_input);
--               in_data_V_TDATA_0 <= test_input;
--               in_data_V_TVALID_0 <= '1';
--               I := I + 1;
--               if (I = 1024) then
--                    file_close(input_file);
--               end if;
--            else
--                in_data_V_TVALID_0 <= '0';
--            end if;
--            if (I = 1024) then
--                wait;
--            end if;
--        end if; 
--    end process reading;


 -----------------------------------------------
   -- test process
-----------------------------------------------
test_fir: process
      variable test_input_phase : std_logic_vector(31 downto 0);
      file input_file_phase : text;
	  variable in_line_phase : line;
	  file output_file_modulus_1228: text;
      variable out_line_modulus_1228: line;
    constant axi_n_zeroes_latency : time := 12320 ns;
    constant axi_fir_latency : time := 10233370 ns;
    constant axi_cut_n_latency : time := 12320 ns;
   begin
      file_open(input_file_phase,"../../../../phase_values_v4.dat",READ_MODE);
      
      wait for 600 ns;
      wait until rising_edge(ap_clk_0);
      ap_start_0 <= '1';
      wait until rising_edge(ap_clk_0);
      wait until rising_edge(s_axis_tready_0);
       loop_write:for I in  0 to 1023 loop
          readline(input_file_phase,in_line_phase);
          read(in_line_phase, test_input_phase);
          s_axis_tdata_0 <= test_input_phase;
          s_axis_tvalid_0 <= '1';
          wait until rising_edge(ap_clk_0);
--          if (I = 1023) then
--            s_axis_tvalid_0 <= '0';
--          end if;
        end loop loop_write;
        file_close(input_file_phase);
        loop_zero: for J in 0 to 203 loop
            s_axis_tvalid_0 <= '1';
            s_axis_tdata_0 <= (others => '0');
            wait until rising_edge(ap_clk_0);
            if (J = 203) then
                s_axis_tvalid_0 <= '0';
            end if;
        end loop loop_zero;
        wait for 10233370 ns;
        m_axis_tready_0 <= '1';
        wait until rising_edge(m_axis_tvalid_0);
        file_open(output_file_modulus_1228,"../../../../fir_phase_1228_values_v1.dat",WRITE_MODE);
        escritura_fir_modulo_1228: for I in 0 to 1227 loop
            wait for 0.1 ns;
            write(out_line_modulus_1228,to_bitvector(out_fir_data_V_tdata_0),RIGHT,32);
            writeline(output_file_modulus_1228,out_line_modulus_1228);
            wait until rising_edge(ap_clk_0);
        end loop escritura_fir_modulo_1228;  
        file_close(output_file_modulus_1228);
        wait;
      end process test_fir;


end Behavioral;
