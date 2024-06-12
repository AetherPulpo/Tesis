--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Mon Jun 10 10:20:24 2024
--Host        : vitis-VBox running 64-bit Ubuntu 18.04.6 LTS
--Command     : generate_target bd_0.bd
--Design      : bd_0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_ctrl_done : out STD_LOGIC;
    ap_ctrl_idle : out STD_LOGIC;
    ap_ctrl_ready : out STD_LOGIC;
    ap_ctrl_start : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    in_amplitude_data_V_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_amplitude_data_V_tready : out STD_LOGIC;
    in_amplitude_data_V_tvalid : in STD_LOGIC;
    out_iir_data_V_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_iir_data_V_tready : in STD_LOGIC;
    out_iir_data_V_tvalid : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_0 : entity is "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_0 : entity is "bd_0.hwdef";
end bd_0;

architecture STRUCTURE of bd_0 is
  component bd_0_hls_inst_0 is
  port (
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
  end component bd_0_hls_inst_0;
  signal ap_clk_0_1 : STD_LOGIC;
  signal ap_ctrl_0_1_done : STD_LOGIC;
  signal ap_ctrl_0_1_idle : STD_LOGIC;
  signal ap_ctrl_0_1_ready : STD_LOGIC;
  signal ap_ctrl_0_1_start : STD_LOGIC;
  signal ap_rst_n_0_1 : STD_LOGIC;
  signal hls_inst_out_iir_data_V_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_out_iir_data_V_TREADY : STD_LOGIC;
  signal hls_inst_out_iir_data_V_TVALID : STD_LOGIC;
  signal in_amplitude_data_V_0_1_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_amplitude_data_V_0_1_TREADY : STD_LOGIC;
  signal in_amplitude_data_V_0_1_TVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF in_amplitude_data_V:out_iir_data_V, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of ap_ctrl_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ";
  attribute X_INTERFACE_INFO of ap_ctrl_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ";
  attribute X_INTERFACE_INFO of ap_ctrl_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ";
  attribute X_INTERFACE_INFO of ap_ctrl_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of in_amplitude_data_V_tready : signal is "xilinx.com:interface:axis:1.0 in_amplitude_data_V ";
  attribute X_INTERFACE_INFO of in_amplitude_data_V_tvalid : signal is "xilinx.com:interface:axis:1.0 in_amplitude_data_V ";
  attribute X_INTERFACE_INFO of out_iir_data_V_tready : signal is "xilinx.com:interface:axis:1.0 out_iir_data_V ";
  attribute X_INTERFACE_INFO of out_iir_data_V_tvalid : signal is "xilinx.com:interface:axis:1.0 out_iir_data_V ";
  attribute X_INTERFACE_INFO of in_amplitude_data_V_tdata : signal is "xilinx.com:interface:axis:1.0 in_amplitude_data_V ";
  attribute X_INTERFACE_PARAMETER of in_amplitude_data_V_tdata : signal is "XIL_INTERFACENAME in_amplitude_data_V, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of out_iir_data_V_tdata : signal is "xilinx.com:interface:axis:1.0 out_iir_data_V ";
  attribute X_INTERFACE_PARAMETER of out_iir_data_V_tdata : signal is "XIL_INTERFACENAME out_iir_data_V, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  ap_clk_0_1 <= ap_clk;
  ap_ctrl_0_1_start <= ap_ctrl_start;
  ap_ctrl_done <= ap_ctrl_0_1_done;
  ap_ctrl_idle <= ap_ctrl_0_1_idle;
  ap_ctrl_ready <= ap_ctrl_0_1_ready;
  ap_rst_n_0_1 <= ap_rst_n;
  hls_inst_out_iir_data_V_TREADY <= out_iir_data_V_tready;
  in_amplitude_data_V_0_1_TDATA(31 downto 0) <= in_amplitude_data_V_tdata(31 downto 0);
  in_amplitude_data_V_0_1_TVALID <= in_amplitude_data_V_tvalid;
  in_amplitude_data_V_tready <= in_amplitude_data_V_0_1_TREADY;
  out_iir_data_V_tdata(31 downto 0) <= hls_inst_out_iir_data_V_TDATA(31 downto 0);
  out_iir_data_V_tvalid <= hls_inst_out_iir_data_V_TVALID;
hls_inst: component bd_0_hls_inst_0
     port map (
      ap_clk => ap_clk_0_1,
      ap_done => ap_ctrl_0_1_done,
      ap_idle => ap_ctrl_0_1_idle,
      ap_ready => ap_ctrl_0_1_ready,
      ap_rst_n => ap_rst_n_0_1,
      ap_start => ap_ctrl_0_1_start,
      in_amplitude_data_V_TDATA(31 downto 0) => in_amplitude_data_V_0_1_TDATA(31 downto 0),
      in_amplitude_data_V_TREADY => in_amplitude_data_V_0_1_TREADY,
      in_amplitude_data_V_TVALID => in_amplitude_data_V_0_1_TVALID,
      out_iir_data_V_TDATA(31 downto 0) => hls_inst_out_iir_data_V_TDATA(31 downto 0),
      out_iir_data_V_TREADY => hls_inst_out_iir_data_V_TREADY,
      out_iir_data_V_TVALID => hls_inst_out_iir_data_V_TVALID
    );
end STRUCTURE;
