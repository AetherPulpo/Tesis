----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2024 13:59:56
-- Design Name: 
-- Module Name: p2y3_tb - Behavioral
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

entity p2y3_tb is
--  Port ( );
end p2y3_tb;

architecture Behavioral of p2y3_tb is
------------------------------------------------------- 
	-- component declaration
--------------------------------------------------------- 
    component test_p2yp3_wrapper
    port(
    ap_clk_0 : in STD_LOGIC;
    ap_start_0 : in STD_LOGIC;
    din_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_mean_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_cut_data_V_TDATA_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_cut_data_V_TREADY_0 : in STD_LOGIC;
    out_cut_data_V_TVALID_0 : out STD_LOGIC;
    srst_0 : in STD_LOGIC;
    wr_en_0 : in STD_LOGIC
    );
    end component;

--------------------------------------------------------- 
	-- signal declarations 
--------------------------------------------------------- 
   -- signals associated with the inputs
    signal ap_clk_0 : STD_LOGIC;
    signal srst_0 : STD_LOGIC :='0';
    signal ap_start_0 : STD_LOGIC := '0';
    signal wr_en_0 : STD_LOGIC := '0';
    signal din_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal in_mean_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal out_cut_data_V_TREADY_0 : STD_LOGIC := '0';
    
  -- signals associated with the outpus
    signal out_cut_data_V_TVALID_0 : STD_LOGIC;
    signal out_cut_data_V_TDATA_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
        
      -- clock period definitions
   constant clock_period : time := 10 ns;    

begin

---------------------------------------------
   -- instantiate the unit under test (uut)
---------------------------------------------- 
   uut: test_p2yp3_wrapper port map (
      ap_clk_0 => ap_clk_0,
      ap_start_0 => ap_start_0,
      din_0(31 downto 0) => din_0(31 downto 0),
      in_mean_0(31 downto 0) => in_mean_0(31 downto 0),
      out_cut_data_V_TDATA_0(31 downto 0) => out_cut_data_V_TDATA_0(31 downto 0),
      out_cut_data_V_TREADY_0 => out_cut_data_V_TREADY_0,
      out_cut_data_V_TVALID_0 => out_cut_data_V_TVALID_0,
      srst_0 => srst_0,
      wr_en_0 => wr_en_0
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
      srst_0 <= '1';
      
      wait for 300 ns;
      wait until rising_edge(ap_clk_0);
      
      srst_0 <= '0';
      
      wait;
   end process reset_proc;

 -----------------------------------------------
   -- handshake_0
-----------------------------------------------
    handshake_0: process
    begin
    wait for 600 ns;
 --       wait until rising_edge(out_cut_data_V_TVALID_0);
        out_cut_data_V_TREADY_0 <= '1'; 
 --       wait until falling_edge(out_cut_data_V_TVALID_0);
 --       out_cut_data_V_TREADY_0 <= '0';
    end process handshake_0;
 
 
  -----------------------------------------------
   -- write_fir_modulus (tiene 1228 muestras)
-----------------------------------------------
    write_amplitude: process
        file output_file: text;
        variable out_line: line;

    begin
        file_open(output_file,"../../../../butter_512_p2y3.dat",WRITE_MODE);
        wait until rising_edge(out_cut_data_V_TVALID_0);
        escritura: for I in 0 to 511 loop
            wait for 0.1 ns;
            write(out_line,to_bitvector(out_cut_data_V_tdata_0),RIGHT,32);
            writeline(output_file,out_line);
            wait until rising_edge(out_cut_data_V_TVALID_0);
        end loop;  
        file_close(output_file);
        wait;
    end process write_amplitude;
    
 -----------------------------------------------
   -- test process
-----------------------------------------------
   test_amplitude: process
      variable test_input : std_logic_vector(31 downto 0);
      file input_file : text;
	  variable in_line : line;
	  variable test_input_mean : std_logic_vector(31 downto 0);
      file input_file_mean : text;
	  variable in_line_mean : line;
	  variable J : integer := 0;
    constant axi_amplitude_latency : time := 10510 ns;
   begin
      file_open(input_file,"../../../../rectValues_ns_tb.dat",READ_MODE); 
      file_open(input_file_mean,"../../../../meanValue_ms_tb.dat",READ_MODE); 
      wait for 600 ns;
      wait until rising_edge(ap_clk_0);
----      wait until rising_edge(s_axis_tready_0); 
--       L1 : loop
--            if (J = 1024) then
--                exit;
--            end if;
--            if (rising_edge(in_ifft_data_V_TREADY_0) or in_ifft_data_V_TREADY_0 = '1') then
--              readline(input_file,in_line);
--              read(in_line, test_input);
--              in_ifft_data_V_TDATA_0 <= test_input;
--              in_ifft_data_V_TVALID_0 <= '1';
--              J := J + 1; 
--              wait until rising_edge(ap_clk_0);
--              in_ifft_data_V_TVALID_0 <= '0';
--              wait until rising_edge(ap_clk_0);  
--            else
--              in_ifft_data_V_TVALID_0 <= '0'; 
--              wait until rising_edge(ap_clk_0);
--            end if;
--       end loop;  
--       in_ifft_data_V_TVALID_0 <= '0'; 
       wr_en_0 <= '1';
       loop_write:for I in  0 to 511 loop     
          readline(input_file,in_line);
          read(in_line, test_input);
          din_0 <= test_input;
          wait until rising_edge(ap_clk_0);
        end loop loop_write;
        wr_en_0 <= '0';
        file_close(input_file);
        ap_start_0 <= '1';
        readline(input_file_mean,in_line_mean);
        read(in_line_mean, test_input_mean);
        in_mean_0 <= test_input_mean;
        file_close(input_file_mean);
        wait until rising_edge(ap_clk_0);
        
        wait;
      end process test_amplitude;

end Behavioral;
