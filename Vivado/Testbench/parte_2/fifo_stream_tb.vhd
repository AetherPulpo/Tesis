----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2024 00:21:07
-- Design Name: 
-- Module Name: fifo_stream_tb - Behavioral
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

entity fifo_stream_tb is
--  Port ( );
end fifo_stream_tb;

architecture Behavioral of fifo_stream_tb is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component fifo_stream_wrapper
    port(
    ap_done_0 : out STD_LOGIC; -- axi_norm
    ap_done_1 : out STD_LOGIC; -- axi_zero_0
    ap_done_2 : out STD_LOGIC; -- real2complex
    ap_done_3 : out STD_LOGIC; -- axi_zero_1
    ap_done_4 : out STD_LOGIC; -- config 0
    ap_done_5 : out STD_LOGIC; -- axi analytic
    ap_done_6 : out STD_LOGIC; -- config 1
    ap_start_0 : in STD_LOGIC; --axi_norm
    ap_start_1 : in STD_LOGIC; --axi_zero_0
    ap_start_2 : in STD_LOGIC; --axi_zero_1
    ap_start_3 : in STD_LOGIC; -- config
    ap_start_4 : in STD_LOGIC; -- axi analytic
    ap_start_5 : in STD_LOGIC; -- config 1
    clk_0 : in STD_LOGIC;
    din_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_data_tready_0 : in STD_LOGIC;
    full_0 : out STD_LOGIC;
    in_mean_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_data_tdata_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_data_tlast_0 : out STD_LOGIC;
    m_axis_data_tuser_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_data_tuser_1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_data_tvalid_0 : out STD_LOGIC;
    out_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    out_data_V_TVALID_0 : out STD_LOGIC;
    out_stream_TLAST_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_stream_TLAST_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    sel_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    srst_0 : in STD_LOGIC;
    wr_en_0 : in STD_LOGIC
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
    signal clk_0 : STD_LOGIC;
    signal srst_0 : STD_LOGIC :='0';
    signal ap_start_0 : STD_LOGIC := '0';
    signal ap_start_1 : STD_LOGIC := '0';
    signal ap_start_2 : STD_LOGIC := '0';
    signal ap_start_3 : STD_LOGIC := '0';
    signal ap_start_4 : STD_LOGIC := '0';
    signal ap_start_5 : STD_LOGIC := '0';
    signal wr_en_0 : STD_LOGIC := '0';
    signal din_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_axis_data_tready_0 : STD_LOGIC := '0';
    signal in_mean_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal sel_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
    
  -- signals associated with the outpus
    signal ap_done_0 : STD_LOGIC;
    signal ap_done_1 : STD_LOGIC;
    signal ap_done_2 : STD_LOGIC;
    signal ap_done_3 : STD_LOGIC;
    signal ap_done_4 : STD_LOGIC;
    signal ap_done_5 : STD_LOGIC;
    signal ap_done_6 : STD_LOGIC;
    signal full_0 : STD_LOGIC;
    signal out_data_V_TVALID_0 : STD_LOGIC;
    signal out_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
    signal m_axis_data_tdata_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
    signal m_axis_data_tlast_0 : STD_LOGIC;
    signal m_axis_data_tuser_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
    signal m_axis_data_tuser_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
    signal m_axis_data_tvalid_0 : STD_LOGIC;
    signal out_stream_TLAST_0 : STD_LOGIC_VECTOR ( 0 to 0 );
    signal out_stream_TLAST_1 : STD_LOGIC_VECTOR ( 0 to 0 );
    
      -- clock period definitions
   constant clock_period : time := 10 ns;

begin

---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: fifo_stream_wrapper port map (
      ap_done_0 => ap_done_0,
      ap_done_1 => ap_done_1,
      ap_done_2 => ap_done_2,
      ap_done_3 => ap_done_3,
      ap_done_4 => ap_done_4,
      ap_done_5 => ap_done_5,
      ap_done_6 => ap_done_6,
      ap_start_0 => ap_start_0,
      ap_start_1 => ap_start_1,
      ap_start_2 => ap_start_2,
      ap_start_3 => ap_start_3,
      ap_start_4 => ap_start_4,
      ap_start_5 => ap_start_5,
      clk_0 => clk_0,
      din_0(31 downto 0) => din_0(31 downto 0),
      full_0 => full_0,
      in_mean_0(31 downto 0) => in_mean_0(31 downto 0),
      m_axis_data_tdata_0(63 downto 0) => m_axis_data_tdata_0(63 downto 0),
      m_axis_data_tlast_0 => m_axis_data_tlast_0,
      m_axis_data_tready_0 => m_axis_data_tready_0,
      m_axis_data_tuser_0(15 downto 0) => m_axis_data_tuser_0(15 downto 0),
      m_axis_data_tuser_1(15 downto 0) => m_axis_data_tuser_1(15 downto 0),
      m_axis_data_tvalid_0 => m_axis_data_tvalid_0,
      out_data_V_TVALID_0 => out_data_V_TVALID_0,
      out_data_V_TDATA_0 => out_data_V_TDATA_0,
      out_stream_TLAST_0(0) => out_stream_TLAST_0(0),
      out_stream_TLAST_1(0) => out_stream_TLAST_1(0),
      sel_0(1 downto 0) => sel_0(1 downto 0),
      srst_0 => srst_0,
      wr_en_0 => wr_en_0
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
      srst_0 <= '1';
      
      wait for 300 ns;
      wait until rising_edge(clk_0);
      
      srst_0 <= '0';
      
      wait;
   end process reset_proc;
   
   
sel_mux_0 : process (srst_0,clk_0)
    begin
        if (srst_0 = '1') then
            sel_0  <= "00";
        elsif(rising_edge(clk_0)) then
            if (out_stream_TLAST_0(0) = '1') then
                sel_0  <= "01";
            elsif(out_stream_TLAST_1(0) = '1') then
                sel_0  <= "11";
            elsif(ap_done_2 = '1') then
                sel_0 <= "10";
            else
                sel_0 <= sel_0;
            end if;
        end if;  
    end process sel_mux_0;

zero_0 : process(srst_0, ap_start_0,out_stream_TLAST_0)
begin
    if (srst_0 = '1') then
        ap_start_1 <= '0';
    elsif (rising_edge(ap_start_0)) then
        ap_start_1 <= '1';
    elsif (falling_edge(out_stream_TLAST_0(0))) then
        ap_start_1 <= '0';
    end if;
end process zero_0;

zero_1 : process(srst_0, ap_start_0,out_stream_TLAST_1)
begin
    if (srst_0 = '1') then
        ap_start_2 <= '0';
    elsif (rising_edge(ap_start_0)) then
        ap_start_2 <= '1';
    elsif (falling_edge(out_stream_TLAST_1(0))) then
        ap_start_2 <= '0';
    end if;
end process zero_1;

config0: process (srst_0, ap_start_0, ap_done_4)
begin
        if (srst_0 = '1') then
            ap_start_3 <= '0';
        elsif(rising_edge(ap_start_0)) then
            ap_start_3 <= '1';    
        elsif (ap_done_4 = '1') then
            ap_start_3 <= '0';
        end if;       
end process config0;

config1: process (srst_0, ap_start_0, ap_done_6)
begin
        if (srst_0 = '1') then
            ap_start_5 <= '0';
        elsif(rising_edge(ap_start_0)) then
            ap_start_5 <= '1';    
        elsif (ap_done_6 = '1') then
            ap_start_5 <= '0';
        end if;       
end process config1;    
   
  
 --FALTA HACER EL TB DESDE 0 (SOLO LOS PROCESOS)
 --Leer las muestras rectificadas y almacenarlas en la fifo
 --Leer el promedio y encender el bloque norm
 --encender los demas bloques y cuando axis zeros y config pongan en alto done
 --detener el start
  -----------------------------------------------
   -- test process
-----------------------------------------------
   test_fifo_norm: process
      variable test_input : std_logic_vector(31 downto 0);
      file input_file: text;
	  file input_file_mean: text;
	  file output_file_re: text;
	  file output_file_im: text;
	  file output_file_ifft_re :text;
	  file output_file_ifft_im :text;
	  variable in_line: line;
	  variable in_line_mean: line;
	  variable out_line_re: line;
	  variable out_line_im: line;
	  variable out_line_ifft_re: line;
	  variable out_line_ifft_im: line;
    constant axi_norm_latency : time := 5300 ns;
   begin
      file_open(input_file,"../../../../rectValues_ns_tb.dat",READ_MODE);
	  file_open(input_file_mean,"../../../../meanValue_ms_tb.dat",READ_MODE);
	  file_open(output_file_re,"../../../../axi_analytic_fft_1024_re_tb.dat",WRITE_MODE);
	  file_open(output_file_im,"../../../../axi_analytic_fft_1024_im_tb.dat",WRITE_MODE);
	  file_open(output_file_ifft_re,"../../../../axi_ifft_1024_re_tb.dat",WRITE_MODE);
	  file_open(output_file_ifft_im,"../../../../axi_ifft_1024_im_tb.dat",WRITE_MODE);
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
        file_close(input_file_mean);
        ap_start_0 <= '1';
        ap_start_4 <= '1';
        m_axis_data_tready_0 <= '1';
        wait until rising_edge(out_data_V_TVALID_0);
        escritura_analytic : for I in 0 to 1023 loop
            wait for 0.1 ns;
            write(out_line_im,to_bitvector(out_data_V_tdata_0(63 downto 32)),RIGHT,32);
            writeline(output_file_im,out_line_im);
            
            write(out_line_re,to_bitvector(out_data_V_tdata_0(31 downto 0)),RIGHT,32);
            writeline(output_file_re,out_line_re);
            wait until rising_edge(clk_0);
        end loop escritura_analytic;  
        file_close(output_file_im);
        file_close(output_file_re);
        wait until rising_edge(m_axis_data_tvalid_0);
        escritura_ifft : for I in 0 to 1023 loop
            wait for 0.1 ns;
            write(out_line_ifft_im,to_bitvector(m_axis_data_tdata_0(63 downto 32)),RIGHT,32);
            writeline(output_file_ifft_im,out_line_ifft_im);
            
            write(out_line_ifft_re,to_bitvector(m_axis_data_tdata_0(31 downto 0)),RIGHT,32);
            writeline(output_file_ifft_re,out_line_ifft_re);
            wait until rising_edge(clk_0);
        end loop escritura_ifft;  
        file_close(output_file_ifft_im);
        file_close(output_file_ifft_re);
        wait;
      end process test_fifo_norm;


end Behavioral;
