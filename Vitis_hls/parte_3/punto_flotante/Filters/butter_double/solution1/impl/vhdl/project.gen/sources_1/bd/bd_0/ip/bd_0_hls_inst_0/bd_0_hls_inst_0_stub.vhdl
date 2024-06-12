-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Mon Jun 10 10:24:43 2024
-- Host        : vitis-VBox running 64-bit Ubuntu 18.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Filters/butter_double/solution1/impl/vhdl/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_0_hls_inst_0 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    in_amplitude_data_V_TVALID : in STD_LOGIC;
    in_amplitude_data_V_TREADY : out STD_LOGIC;
    in_amplitude_data_V_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_iir_data_V_TVALID : out STD_LOGIC;
    out_iir_data_V_TREADY : in STD_LOGIC;
    out_iir_data_V_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end bd_0_hls_inst_0;

architecture stub of bd_0_hls_inst_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,in_amplitude_data_V_TVALID,in_amplitude_data_V_TREADY,in_amplitude_data_V_TDATA[31:0],out_iir_data_V_TVALID,out_iir_data_V_TREADY,out_iir_data_V_TDATA[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "butterworth_double,Vivado 2020.2";
begin
end;
