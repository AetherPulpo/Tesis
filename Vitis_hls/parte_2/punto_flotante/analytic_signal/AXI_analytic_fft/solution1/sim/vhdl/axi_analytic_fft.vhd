-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity axi_analytic_fft is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    in_data_V_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    in_data_V_TVALID : IN STD_LOGIC;
    in_data_V_TREADY : OUT STD_LOGIC;
    out_data_V_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    out_data_V_TVALID : OUT STD_LOGIC;
    out_data_V_TREADY : IN STD_LOGIC );
end;


architecture behav of axi_analytic_fft is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "axi_analytic_fft_axi_analytic_fft,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.400000,HLS_SYN_LAT=1029,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=637,HLS_SYN_LUT=1026,HLS_VERSION=2020_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv32_40000000 : STD_LOGIC_VECTOR (31 downto 0) := "01000000000000000000000000000000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv10_200 : STD_LOGIC_VECTOR (9 downto 0) := "1000000000";
    constant ap_const_lv10_3FF : STD_LOGIC_VECTOR (9 downto 0) := "1111111111";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal in_data_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal out_data_V_TDATA_blk_n : STD_LOGIC;
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal inc10_reg_67 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln35_fu_88_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln35_reg_191 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal tmp_M_value_fu_98_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_M_value_reg_196 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_M_value_reg_196_pp0_iter1_reg : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_M_value_reg_196_pp0_iter2_reg : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_M_value_1_fu_113_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_M_value_1_reg_202 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_M_value_1_reg_202_pp0_iter1_reg : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_M_value_1_reg_202_pp0_iter2_reg : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln22_fu_130_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln22_reg_208 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln22_reg_208_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln22_reg_208_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln22_2_fu_136_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln22_2_reg_214 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln22_2_reg_214_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln22_2_reg_214_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln35_fu_142_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln35_reg_220 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_flush_enable : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_phi_mux_inc10_phi_fu_71_p4 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal grp_fu_78_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_83_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln145_fu_94_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln145_1_fu_103_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln22_fu_118_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln22_1_fu_124_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_83_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_78_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln22_1_fu_154_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln174_1_fu_160_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln22_fu_148_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln174_fu_171_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln174_1_fu_175_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln174_fu_164_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_78_ce : STD_LOGIC;
    signal grp_fu_83_ce : STD_LOGIC;
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal regslice_both_out_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal regslice_both_in_data_V_U_apdone_blk : STD_LOGIC;
    signal in_data_V_TDATA_int_regslice : STD_LOGIC_VECTOR (63 downto 0);
    signal in_data_V_TVALID_int_regslice : STD_LOGIC;
    signal in_data_V_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_in_data_V_U_ack_in : STD_LOGIC;
    signal out_data_V_TDATA_int_regslice : STD_LOGIC_VECTOR (63 downto 0);
    signal out_data_V_TVALID_int_regslice : STD_LOGIC;
    signal out_data_V_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_out_data_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component axi_analytic_fft_fmul_32ns_32ns_32_4_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component axi_analytic_fft_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    fmul_32ns_32ns_32_4_max_dsp_1_U1 : component axi_analytic_fft_fmul_32ns_32ns_32_4_max_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_78_p0,
        din1 => ap_const_lv32_40000000,
        ce => grp_fu_78_ce,
        dout => grp_fu_78_p2);

    fmul_32ns_32ns_32_4_max_dsp_1_U2 : component axi_analytic_fft_fmul_32ns_32ns_32_4_max_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_83_p0,
        din1 => ap_const_lv32_40000000,
        ce => grp_fu_83_ce,
        dout => grp_fu_83_p2);

    regslice_both_in_data_V_U : component axi_analytic_fft_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_data_V_TDATA,
        vld_in => in_data_V_TVALID,
        ack_in => regslice_both_in_data_V_U_ack_in,
        data_out => in_data_V_TDATA_int_regslice,
        vld_out => in_data_V_TVALID_int_regslice,
        ack_out => in_data_V_TREADY_int_regslice,
        apdone_blk => regslice_both_in_data_V_U_apdone_blk);

    regslice_both_out_data_V_U : component axi_analytic_fft_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_data_V_TDATA_int_regslice,
        vld_in => out_data_V_TVALID_int_regslice,
        ack_in => out_data_V_TREADY_int_regslice,
        data_out => out_data_V_TDATA,
        vld_out => regslice_both_out_data_V_U_vld_out,
        ack_out => out_data_V_TREADY,
        apdone_blk => regslice_both_out_data_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_pp0_flush_enable)) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    inc10_reg_67_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                inc10_reg_67 <= ap_const_lv10_0;
            elsif (((icmp_ln35_reg_220 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                inc10_reg_67 <= add_ln35_reg_191;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                add_ln35_reg_191 <= add_ln35_fu_88_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln22_2_reg_214 <= icmp_ln22_2_fu_136_p2;
                icmp_ln22_2_reg_214_pp0_iter1_reg <= icmp_ln22_2_reg_214;
                icmp_ln35_reg_220 <= icmp_ln35_fu_142_p2;
                or_ln22_reg_208 <= or_ln22_fu_130_p2;
                or_ln22_reg_208_pp0_iter1_reg <= or_ln22_reg_208;
                tmp_M_value_1_reg_202 <= tmp_M_value_1_fu_113_p1;
                tmp_M_value_1_reg_202_pp0_iter1_reg <= tmp_M_value_1_reg_202;
                tmp_M_value_reg_196 <= tmp_M_value_fu_98_p1;
                tmp_M_value_reg_196_pp0_iter1_reg <= tmp_M_value_reg_196;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                icmp_ln22_2_reg_214_pp0_iter2_reg <= icmp_ln22_2_reg_214_pp0_iter1_reg;
                or_ln22_reg_208_pp0_iter2_reg <= or_ln22_reg_208_pp0_iter1_reg;
                tmp_M_value_1_reg_202_pp0_iter2_reg <= tmp_M_value_1_reg_202_pp0_iter1_reg;
                tmp_M_value_reg_196_pp0_iter2_reg <= tmp_M_value_reg_196_pp0_iter1_reg;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_block_pp0_stage0_subdone, ap_CS_fsm_state7, regslice_both_out_data_V_U_apdone_blk)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state7 => 
                if (((regslice_both_out_data_V_U_apdone_blk = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state7))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    add_ln35_fu_88_p2 <= std_logic_vector(unsigned(ap_phi_mux_inc10_phi_fu_71_p4) + unsigned(ap_const_lv10_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state7 <= ap_CS_fsm(2);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, in_data_V_TVALID_int_regslice, out_data_V_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (out_data_V_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (out_data_V_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (in_data_V_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, in_data_V_TVALID_int_regslice, out_data_V_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (out_data_V_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (out_data_V_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (in_data_V_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, in_data_V_TVALID_int_regslice, out_data_V_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (out_data_V_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (out_data_V_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (in_data_V_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter0_assign_proc : process(in_data_V_TVALID_int_regslice)
    begin
                ap_block_state2_pp0_stage0_iter0 <= (in_data_V_TVALID_int_regslice = ap_const_logic_0);
    end process;

        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state5_pp0_stage0_iter3_assign_proc : process(out_data_V_TREADY_int_regslice)
    begin
                ap_block_state5_pp0_stage0_iter3 <= (out_data_V_TREADY_int_regslice = ap_const_logic_0);
    end process;


    ap_block_state6_pp0_stage0_iter4_assign_proc : process(out_data_V_TREADY_int_regslice)
    begin
                ap_block_state6_pp0_stage0_iter4 <= (out_data_V_TREADY_int_regslice = ap_const_logic_0);
    end process;


    ap_condition_pp0_flush_enable_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln35_fu_142_p2, ap_block_pp0_stage0_subdone)
    begin
        if (((icmp_ln35_fu_142_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_pp0_flush_enable <= ap_const_logic_1;
        else 
            ap_condition_pp0_flush_enable <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state7, regslice_both_out_data_V_U_apdone_blk)
    begin
        if (((regslice_both_out_data_V_U_apdone_blk = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_inc10_phi_fu_71_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, inc10_reg_67, add_ln35_reg_191, icmp_ln35_reg_220, ap_enable_reg_pp0_iter1)
    begin
        if (((icmp_ln35_reg_220 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
            ap_phi_mux_inc10_phi_fu_71_p4 <= add_ln35_reg_191;
        else 
            ap_phi_mux_inc10_phi_fu_71_p4 <= inc10_reg_67;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state7, regslice_both_out_data_V_U_apdone_blk)
    begin
        if (((regslice_both_out_data_V_U_apdone_blk = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    bitcast_ln174_1_fu_160_p1 <= select_ln22_1_fu_154_p3;
    bitcast_ln174_fu_171_p1 <= select_ln22_fu_148_p3;

    grp_fu_78_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_78_ce <= ap_const_logic_1;
        else 
            grp_fu_78_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_78_p0 <= trunc_ln145_fu_94_p1;

    grp_fu_83_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_83_ce <= ap_const_logic_1;
        else 
            grp_fu_83_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_83_p0 <= trunc_ln145_1_fu_103_p4;
    icmp_ln22_1_fu_124_p2 <= "1" when (ap_phi_mux_inc10_phi_fu_71_p4 = ap_const_lv10_200) else "0";
    icmp_ln22_2_fu_136_p2 <= "1" when (unsigned(ap_phi_mux_inc10_phi_fu_71_p4) > unsigned(ap_const_lv10_200)) else "0";
    icmp_ln22_fu_118_p2 <= "1" when (ap_phi_mux_inc10_phi_fu_71_p4 = ap_const_lv10_0) else "0";
    icmp_ln35_fu_142_p2 <= "1" when (ap_phi_mux_inc10_phi_fu_71_p4 = ap_const_lv10_3FF) else "0";

    in_data_V_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0, in_data_V_TVALID_int_regslice)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            in_data_V_TDATA_blk_n <= in_data_V_TVALID_int_regslice;
        else 
            in_data_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    in_data_V_TREADY <= regslice_both_in_data_V_U_ack_in;

    in_data_V_TREADY_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            in_data_V_TREADY_int_regslice <= ap_const_logic_1;
        else 
            in_data_V_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    or_ln22_fu_130_p2 <= (icmp_ln22_fu_118_p2 or icmp_ln22_1_fu_124_p2);

    out_data_V_TDATA_blk_n_assign_proc : process(ap_block_pp0_stage0, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, out_data_V_TREADY_int_regslice)
    begin
        if ((((ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            out_data_V_TDATA_blk_n <= out_data_V_TREADY_int_regslice;
        else 
            out_data_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    out_data_V_TDATA_int_regslice <= (select_ln174_1_fu_175_p3 & select_ln174_fu_164_p3);
    out_data_V_TVALID <= regslice_both_out_data_V_U_vld_out;

    out_data_V_TVALID_int_regslice_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            out_data_V_TVALID_int_regslice <= ap_const_logic_1;
        else 
            out_data_V_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    select_ln174_1_fu_175_p3 <= 
        ap_const_lv32_0 when (icmp_ln22_2_reg_214_pp0_iter2_reg(0) = '1') else 
        bitcast_ln174_fu_171_p1;
    select_ln174_fu_164_p3 <= 
        ap_const_lv32_0 when (icmp_ln22_2_reg_214_pp0_iter2_reg(0) = '1') else 
        bitcast_ln174_1_fu_160_p1;
    select_ln22_1_fu_154_p3 <= 
        tmp_M_value_reg_196_pp0_iter2_reg when (or_ln22_reg_208_pp0_iter2_reg(0) = '1') else 
        grp_fu_78_p2;
    select_ln22_fu_148_p3 <= 
        tmp_M_value_1_reg_202_pp0_iter2_reg when (or_ln22_reg_208_pp0_iter2_reg(0) = '1') else 
        grp_fu_83_p2;
    tmp_M_value_1_fu_113_p1 <= trunc_ln145_1_fu_103_p4;
    tmp_M_value_fu_98_p1 <= trunc_ln145_fu_94_p1;
    trunc_ln145_1_fu_103_p4 <= in_data_V_TDATA_int_regslice(63 downto 32);
    trunc_ln145_fu_94_p1 <= in_data_V_TDATA_int_regslice(32 - 1 downto 0);
end behav;
