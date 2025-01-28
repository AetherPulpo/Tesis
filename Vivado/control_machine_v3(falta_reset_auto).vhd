----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.05.2024 16:30:14
-- Design Name: 
-- Module Name: control_machine - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_machine_v3 is
  Port ( 
        clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        reset : in STD_LOGIC;
        in_idle_mv : in STD_LOGIC;
        in_full_fifo_0 :in STD_LOGIC;
        in_empty_fifo_0 : in STD_LOGIC;
        out_rst_mv : out STD_LOGIC;
        out_continue_mv : out STD_LOGIC;
        out_continue_rect : out STD_LOGIC;
        out_continue_mean : out STD_LOGIC;
        out_samples_ready : out STD_LOGIC;
        out_axi_start : out STD_LOGIC;
        out_wr_en_fifo_0 : out STD_LOGIC;
        out_rd_en_fifo_0 : out STD_LOGIC;
--        out_start_axi_zero_0 : out STD_LOGIC;
--        out_start_real2complex : out STD_LOGIC;
--        out_start_axi_zero_1 : out STD_LOGIC;
--        out_sel_mux_0 : out STD_LOGIC_VECTOR (1 downto 0);
--        out_start_config_fft : out STD_LOGIC;
        out_start_mv : out STD_LOGIC
  );
end control_machine_v3;

architecture Behavioral of control_machine_v3 is
--------------------------------------------------------
--Declaracion de constantes
constant samples_size       : natural := 512; --Cantidad de muestras
constant next_sample_latency: natural := 10000; --100000; -- cuantos ciclos tarda en llegar la muestra siguiente
constant mv_latency         : natural := 38;
constant rect_latency       : natural := 1;
constant mean_latency       : natural := 8;
--constant norm_latency       : natural := 15;
constant axi_norm_latency       : natural := 531;
constant half_norm_latency :natural := 265;
constant fifo_read_latency  : natural := 1;
constant fifo_write_latency : natural := fifo_read_latency;
constant axi_real2complex_latency : natural := 515;
constant axi_analytic_fft_latency :natural := 1030;


--------------------------------------------------------

--------------------------------------------------------
--Declaracion de senales
signal sg_sample_counter : natural range 0 to samples_size;
signal sg_counter : natural range 0 to next_sample_latency;
signal ok_counter_0 : std_logic;
--signal ok_axi_zero : std_logic;
--signal select_mux_0 : std_logic_vector (1 downto 0);
signal ok_axi_start : std_logic;
--------------------------------------------------------

begin
    
    process_out_start : process (clk, enable, reset)
    begin
        if(reset = '1') then
            out_start_mv <= '0';
        elsif (enable = '1') then
        --antes, dentro del elsif, estaba rising_edge(clk) pero hacia que ap_start se demorara 1 ciclo de reloj en activarse 
            out_start_mv <= '1';
        elsif (enable = '0') then
            out_start_mv <= '0';
        end if;
    end process process_out_start;
    
    process_ok_counter : process (clk, enable, reset) --in_idle_mv
    begin
        if(reset = '1') then
            ok_counter_0 <= '0';
        elsif (enable = '1') then
            ok_counter_0 <= '1';
        else
            ok_counter_0 <= '0';
        end if;
    end process process_ok_counter;
    
    
    process_counter: process(clk, reset)
    begin
        if(reset = '1') then
            sg_counter <= 0;
       -- elsif (enable = '1' and ok_wait_counter = '1' and rising_edge(in_vld_mv)) then
       --     sg_wait_counter <= sg_wait_counter + 1;
        elsif (rising_edge(clk)) then
            if(sg_counter = (next_sample_latency-1)) then
                sg_counter <= 0;
            elsif (enable = '1' and ok_counter_0 = '1') then 
                sg_counter <= sg_counter + 1;
--            else
--                sg_counter <= sg_counter;  
            end if;     
        end if;
    end process process_counter;

    
    --17/06/24 AGREGUÉ ENABLE Y SG_COUNTER EN LA SENSITIVITY LIST
    process_mv_continue : process(clk,reset, enable, sg_counter)
    begin
        if(reset = '1') then
            out_continue_mv <= '0';
--        elsif (enable ='1' and ok_hold_counter = '1' and  (sg_counter <= (mv_latency - 1) or sg_counter = (next_sample_latency-1) ) ) then
        elsif (enable ='1' and  (sg_counter <= (mv_latency - 1) or sg_counter = (next_sample_latency-1) ) ) then
            out_continue_mv <= '1';
--        elsif (enable ='1' and ok_wait_counter = '1' and sg_counter > (mv_latency - 1) and sg_counter <(next_sample_latency-1) ) then
        elsif (enable ='1' and sg_counter > (mv_latency - 1) and sg_counter <(next_sample_latency-1) ) then
            out_continue_mv <= '0';
        else
            out_continue_mv <= '0';
        end if;
    end process process_mv_continue;
    
    process_rect_continue : process(clk, reset, enable)
    begin
        if(reset = '1') then
            out_continue_rect <= '0';
        elsif (rising_edge(clk)) then
            if (enable = '1' and  (sg_counter = (mv_latency-2) or sg_counter = mv_latency-1) )then 
            --por alguna razon este resultado ocurre un ciclo despues de que es verdadera la condicion de arriba
                out_continue_rect <= '1';
            else
                out_continue_rect <= '0';
            end if;
        end if;
    end process process_rect_continue;
    
    process_write_fifo_0 : process(clk, reset, enable)
    begin
        if (reset = '1') then
            out_wr_en_fifo_0 <= '0';
        elsif (rising_edge(clk)) then
            if (enable ='1' and sg_counter = mv_latency + rect_latency) then
                out_wr_en_fifo_0 <= '1';
            else
                out_wr_en_fifo_0 <= '0';
            end if;
        end if; 
    end process process_write_fifo_0;
    
    
    process_mean_continue : process(clk, reset, enable)
    begin
        if(reset = '1') then
           out_continue_mean <= '0';
           out_samples_ready <= '0';
        elsif (rising_edge(clk)) then
           if(enable ='1' and ((sg_counter >= mv_latency-1) and sg_counter <= (mv_latency + mean_latency - 1))) then 
                out_continue_mean <= '1';
                out_samples_ready <= '0';
               -- ok_axi_zero <= '0';
           elsif(enable ='1' and sg_sample_counter = samples_size - 1 and sg_counter >= (mv_latency + mean_latency - 1)) then               
                out_continue_mean <= '0';
                out_samples_ready <= '1';
               -- ok_axi_zero <= '1';
           else 
                out_continue_mean <= '0';
                out_samples_ready <= '0';
              --  ok_axi_zero <= '0';     
           end if;
        end if;
    end process process_mean_continue;
    --17/06/24 AGREGUÉ ok_axi_start EN LA SENSITIVITY LIST
    process_axi_start : process (clk, reset, enable, ok_axi_start)
    begin
        if (reset = '1') then
            ok_axi_start <= '0';
        elsif (rising_edge(clk)) then
            if(enable ='1' and sg_sample_counter = samples_size - 1 and sg_counter >= (mv_latency + mean_latency - 1)) then               
                ok_axi_start <= '1';
            else
               ok_axi_start <= ok_axi_start; 
            end if;
        end if;
        out_axi_start <= ok_axi_start;
    end process process_axi_start;
    
--    process_norm_continue : process (clk, reset, enable) -- está incompleto
--    begin
--        if(reset = '1') then
--           out_continue_norm<= '0';
--        elsif (rising_edge(clk)) then
--           if (enable = '1' and in_empty_fifo_0 = '1') then
--                out_continue_norm <= '0';
--           elsif(enable ='1' and sg_counter_1 >= 0 and sg_sample_counter = samples_size-1 ) then 
--                out_continue_norm <= '1';
--           else 
--                out_continue_norm <= '0';
--           end if;
--        end if;
--    end process process_norm_continue;
    
--    sel_mux_0 : process (reset,clk)
--    begin
--        if (reset = '1') then
--            select_mux_0  <= "00";
--        elsif(rising_edge(clk)) then
--            if (in_TLAST_axi_zero_0 = '1') then
--                select_mux_0  <= "01";
--            elsif(in_done_real2complex = '1') then
--                select_mux_0 <= "10";
--            elsif(in_TLAST_axi_zero_1 = '1') then
--                select_mux_0  <= "00";
--            else
--                select_mux_0 <= select_mux_0;
--            end if;
--        end if;  
--    end process sel_mux_0;
--    out_sel_mux_0 <= select_mux_0;
    
--    axi_zeros_0: process (clk, reset)
--    begin
--        if (reset = '1') then
--          out_start_axi_zero_0 <= '0';
--        elsif(ok_axi_zero = '1') then
--          out_start_axi_zero_0 <= '1';
--        end if;
----        elsif (rising_edge(clk)) then
----            if(enable ='1' and sg_sample_counter = samples_size - 1 and sg_counter >= (mv_latency + mean_latency + half_norm_latency - 1)) then
----                out_start_axi_zero_0 <= '1';
----            else
----                out_start_axi_zero_0 <= '0';
----            end if;
----        end if;
--    end process axi_zeros_0;
    
--    axi_zeros_1: process (clk, reset)
--    begin
--        if (reset = '1') then
--          out_start_axi_zero_1 <= '0';
--        elsif (rising_edge(clk)) then
--            if(enable ='1' and sg_sample_counter = samples_size - 1 and sg_counter >= (mv_latency + mean_latency + half_norm_latency - 1)) then
--                out_start_axi_zero_1 <= '1';
--            else
--                out_start_axi_zero_1 <= '0';
--            end if;
--        end if;
--    end process axi_zeros_1;
    
    --Cuento la cantidad de muestras que fueron procesadas por el bloque mv
    --Cada muestra aparece a una frecuencia de 1 Khz
    --Cuando ya se procesaron las 512 muestras, se resetea el bloque mv
    process_sample_counter : process (clk, enable, reset)
    begin
        if (reset = '1') then
            sg_sample_counter <= 0;
            out_rst_mv <= '0';
        elsif (rising_edge(clk) and enable = '1') then         
            if (sg_counter = (next_sample_latency - 1) ) then
                sg_sample_counter <= sg_sample_counter + 1;
            end if;    
                            
            if (sg_sample_counter = (samples_size - 1) and sg_counter = (next_sample_latency - 1) ) then
                sg_sample_counter <= 0;
                out_rst_mv <= '1';
            else
                out_rst_mv <= '0';
            end if;
--        else
--            out_rst_mv <= '0';
        end if;
    end process process_sample_counter;
    
end Behavioral;
