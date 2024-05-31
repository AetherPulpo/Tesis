----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2024 22:02:02
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_MUX is
    Port( axis_aclk : in STD_LOGIC;
          in_tdata_mux_0: in STD_LOGIC_VECTOR (63 downto 0);
          in_tvalid_mux_0: in STD_LOGIC;
          in_tdata_mux_1: in STD_LOGIC_VECTOR (63 downto 0);
          in_tvalid_mux_1: in STD_LOGIC;
          in_tdata_mux_2: in STD_LOGIC_VECTOR (63 downto 0);
          in_tvalid_mux_2: in STD_LOGIC;
          in_tready : in STD_LOGIC;
          sel: in STD_LOGIC_VECTOR (1 downto 0);
          out_tdata_mux: out STD_LOGIC_VECTOR (63 downto 0);
          out_tvalid_mux: out STD_LOGIC;
          out_tready_mux_0 : out STD_LOGIC; 
          out_tready_mux_1 : out STD_LOGIC; 
          out_tready_mux_2 : out STD_LOGIC 
    );
end AXI_MUX;

architecture Behavioral of AXI_MUX is

 ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO of in_tdata_mux_0: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_0 TDATA";
  ATTRIBUTE X_INTERFACE_INFO of in_tdata_mux_1: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_1 TDATA";
  ATTRIBUTE X_INTERFACE_INFO of in_tdata_mux_2: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_2 TDATA";
  
  ATTRIBUTE X_INTERFACE_INFO of in_tvalid_mux_0: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_0 TVALID";
  ATTRIBUTE X_INTERFACE_INFO of in_tvalid_mux_1: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_1 TVALID";
  ATTRIBUTE X_INTERFACE_INFO of in_tvalid_mux_2: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_2 TVALID";
  
  ATTRIBUTE X_INTERFACE_INFO of out_tready_mux_0: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_0 TREADY";
  ATTRIBUTE X_INTERFACE_INFO of out_tready_mux_1: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_1 TREADY";
  ATTRIBUTE X_INTERFACE_INFO of out_tready_mux_2: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS_2 TREADY";
 
  ATTRIBUTE X_INTERFACE_INFO of out_tdata_mux: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO of out_tvalid_mux: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_INFO of in_tready: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";

  
  -- define clocks and associate them with the corresponding bus port 
  ATTRIBUTE X_INTERFACE_INFO of axis_aclk: SIGNAL is "xilinx.com:signal:clock:1.0 axis_aclk CLK";
  --ATTRIBUTE X_INTERFACE_INFO of axis_aclk: SIGNAL is "xilinx.com:signal:clock:1.0 m_axi_clk_p CLK";
  
  --ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
----------------------------------------------------------
  --HAY QUE ASOCIAR LOS CLOCKS EN LA PARTE DE PACKAGE IP
----------------------------------------------------------
  --ATTRIBUTE X_INTERFACE_PARAMETER of axis_aclk: SIGNAL is "ASSOCIATED_BUSIF S_AXIS_0";
  --ATTRIBUTE X_INTERFACE_PARAMETER of axis_aclk: SIGNAL is "ASSOCIATED_BUSIF S_AXIS_1";
  --ATTRIBUTE X_INTERFACE_PARAMETER of axis_aclk: SIGNAL is "ASSOCIATED_BUSIF S_AXIS_2";
  --ATTRIBUTE X_INTERFACE_PARAMETER of axis_aclk: SIGNAL is "ASSOCIATED_BUSIF M_AXIS";

begin

    process(axis_aclk)
    begin
--        if(rising_edge(axis_aclk)) then
            case sel is
                when "00"=> 
                    out_tdata_mux <= in_tdata_mux_0;
                    out_tvalid_mux <= in_tvalid_mux_0;
                    out_tready_mux_0 <= in_tready;
                    out_tready_mux_1 <= '0';
                    out_tready_mux_2 <= '0';
                when "01"=> 
                    out_tdata_mux <= in_tdata_mux_1;
                    out_tvalid_mux <= in_tvalid_mux_1;
                    out_tready_mux_0 <= '0';
                    out_tready_mux_1 <= in_tready;
                    out_tready_mux_2 <= '0';
                when "10"=>
                    out_tdata_mux <= in_tdata_mux_2;
                    out_tvalid_mux <= in_tvalid_mux_2;
                    out_tready_mux_0 <= '0';
                    out_tready_mux_1 <= '0';
                    out_tready_mux_2 <= in_tready;
                when "11"=> 
                    out_tdata_mux <= in_tdata_mux_0;
                    out_tvalid_mux <= '0';
                    out_tready_mux_0 <= '0';
                    out_tready_mux_1 <= '0';
                    out_tready_mux_2 <= '0';
                when  others => 
                    out_tdata_mux <= in_tdata_mux_0;
                    out_tvalid_mux <= '0';
                    out_tready_mux_0 <= '0';
                    out_tready_mux_1 <= '0';
                    out_tready_mux_2 <= '0';
            end case;
--        end if;            
    end process;

end Behavioral;
