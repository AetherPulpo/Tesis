
################################################################
# This is a generated script based on design: pynq_tremor
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source pynq_tremor_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
   set_property BOARD_PART tul.com.tw:pynq-z2:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name pynq_tremor

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:hls:AXI_Real2Complex:1.0\
xilinx.com:hls:axi_N_zeroes:1.0\
xilinx.com:hls:axi_add_zeroes:1.0\
xilinx.com:hls:axi_amplitude:1.0\
xilinx.com:hls:axi_analytic_fft:1.0\
xilinx.com:hls:axi_config:1.0\
xilinx.com:hls:axi_cut_N:1.0\
xilinx.com:hls:axi_cut_zeroes:1.0\
xilinx.com:hls:axi_deescalate:1.0\
xilinx.com:ip:axi_dma:7.1\
xilinx.com:hls:axi_fir:1.0\
xilinx.com:hls:axi_mean:1.0\
xilinx.com:hls:axi_mv:1.0\
xilinx.com:hls:axi_polar_translatev2:1.0\
xilinx.com:hls:axi_prediction_V2:1.0\
xilinx.com:hls:axi_scale:1.0\
xilinx.com:hls:axi_stream_norm:1.0\
xilinx.com:hls:axi_tremor_amp:1.0\
xilinx.com:ip:axis_data_fifo:2.0\
xilinx.com:hls:butterworth_double:1.0\
xilinx.com:ip:processing_system7:5.5\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:xfft:9.1\
xilinx.com:ip:xlconstant:1.1\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports

  # Create instance: AXI_Real2Complex_0, and set properties
  set AXI_Real2Complex_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:AXI_Real2Complex:1.0 AXI_Real2Complex_0 ]

  # Create instance: axi_N_zeroes_0, and set properties
  set axi_N_zeroes_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_N_zeroes:1.0 axi_N_zeroes_0 ]

  # Create instance: axi_N_zeroes_1, and set properties
  set axi_N_zeroes_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_N_zeroes:1.0 axi_N_zeroes_1 ]

  # Create instance: axi_add_zeroes_0, and set properties
  set axi_add_zeroes_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_add_zeroes:1.0 axi_add_zeroes_0 ]

  # Create instance: axi_amplitude_0, and set properties
  set axi_amplitude_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_amplitude:1.0 axi_amplitude_0 ]

  # Create instance: axi_analytic_fft_0, and set properties
  set axi_analytic_fft_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_analytic_fft:1.0 axi_analytic_fft_0 ]

  # Create instance: axi_config_0, and set properties
  set axi_config_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_config:1.0 axi_config_0 ]

  # Create instance: axi_config_1, and set properties
  set axi_config_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_config:1.0 axi_config_1 ]

  # Create instance: axi_cut_N_0, and set properties
  set axi_cut_N_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_cut_N:1.0 axi_cut_N_0 ]

  # Create instance: axi_cut_N_1, and set properties
  set axi_cut_N_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_cut_N:1.0 axi_cut_N_1 ]

  # Create instance: axi_cut_zeroes_0, and set properties
  set axi_cut_zeroes_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_cut_zeroes:1.0 axi_cut_zeroes_0 ]

  # Create instance: axi_deescalate_0, and set properties
  set axi_deescalate_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_deescalate:1.0 axi_deescalate_0 ]

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list \
   CONFIG.c_include_sg {0} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
 ] $axi_dma_0

  # Create instance: axi_dma_1, and set properties
  set axi_dma_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_1 ]
  set_property -dict [ list \
   CONFIG.c_include_sg {0} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
 ] $axi_dma_1

  # Create instance: axi_fir_0, and set properties
  set axi_fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_fir:1.0 axi_fir_0 ]

  # Create instance: axi_fir_1, and set properties
  set axi_fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_fir:1.0 axi_fir_1 ]

  # Create instance: axi_mean_0, and set properties
  set axi_mean_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_mean:1.0 axi_mean_0 ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {2} \
 ] $axi_mem_intercon

  # Create instance: axi_mem_intercon_1, and set properties
  set axi_mem_intercon_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon_1 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {2} \
 ] $axi_mem_intercon_1

  # Create instance: axi_mv_0, and set properties
  set axi_mv_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_mv:1.0 axi_mv_0 ]

  # Create instance: axi_polar_translatev2_0, and set properties
  set axi_polar_translatev2_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_polar_translatev2:1.0 axi_polar_translatev2_0 ]

  # Create instance: axi_prediction_V2_0, and set properties
  set axi_prediction_V2_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_prediction_V2:1.0 axi_prediction_V2_0 ]

  # Create instance: axi_scale_0, and set properties
  set axi_scale_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_scale:1.0 axi_scale_0 ]

  # Create instance: axi_stream_norm_0, and set properties
  set axi_stream_norm_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_stream_norm:1.0 axi_stream_norm_0 ]

  # Create instance: axi_tremor_amp_0, and set properties
  set axi_tremor_amp_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_tremor_amp:1.0 axi_tremor_amp_0 ]

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_0

  # Create instance: butterworth_double_0, and set properties
  set butterworth_double_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:butterworth_double:1.0 butterworth_double_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {650} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {108} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {108} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {108} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {108} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {108} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {108} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {108} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {26} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CLK0_FREQ {100000000} \
   CONFIG.PCW_CLK1_FREQ {10000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1300} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {21} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1050} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x1FFFFFFF} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {4} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {4} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {ERR: 1600  | 1600} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {32} \
   CONFIG.PCW_S_AXI_HP1_DATA_WIDTH {32} \
   CONFIG.PCW_S_AXI_HP2_DATA_WIDTH {32} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {525} \
   CONFIG.PCW_USE_M_AXI_GP1 {1} \
   CONFIG.PCW_USE_S_AXI_HP0 {1} \
   CONFIG.PCW_USE_S_AXI_HP1 {1} \
   CONFIG.PCW_USE_S_AXI_HP2 {0} \
 ] $processing_system7_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $ps7_0_axi_periph

  # Create instance: ps7_0_axi_periph_1, and set properties
  set ps7_0_axi_periph_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph_1 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $ps7_0_axi_periph_1

  # Create instance: rst_ps7_0_100M, and set properties
  set rst_ps7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_100M ]

  # Create instance: xfft_0, and set properties
  set xfft_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_0 ]
  set_property -dict [ list \
   CONFIG.aresetn {true} \
   CONFIG.data_format {floating_point} \
   CONFIG.implementation_options {radix_4_burst_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {0} \
   CONFIG.output_ordering {natural_order} \
   CONFIG.phase_factor_width {25} \
   CONFIG.target_clock_frequency {100} \
 ] $xfft_0

  # Create instance: xfft_1, and set properties
  set xfft_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_1 ]
  set_property -dict [ list \
   CONFIG.aresetn {true} \
   CONFIG.data_format {floating_point} \
   CONFIG.implementation_options {radix_4_burst_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {0} \
   CONFIG.output_ordering {natural_order} \
   CONFIG.phase_factor_width {25} \
   CONFIG.target_clock_frequency {100} \
 ] $xfft_1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_WIDTH {16} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {16} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXI_Real2Complex_0_out_data_V [get_bd_intf_pins AXI_Real2Complex_0/out_data_V] [get_bd_intf_pins axi_add_zeroes_0/in_data_V]
  connect_bd_intf_net -intf_net axi_N_zeroes_0_out_data_V [get_bd_intf_pins axi_N_zeroes_0/out_data_V] [get_bd_intf_pins axi_fir_0/in_data_V]
  connect_bd_intf_net -intf_net axi_N_zeroes_1_out_data_V [get_bd_intf_pins axi_N_zeroes_1/out_data_V] [get_bd_intf_pins axi_fir_1/in_data_V]
  connect_bd_intf_net -intf_net axi_amplitude_0_out_amplitude_data_V [get_bd_intf_pins axi_amplitude_0/out_amplitude_data_V] [get_bd_intf_pins butterworth_double_0/in_amplitude_data_V]
  connect_bd_intf_net -intf_net axi_cut_N_0_out_cut_data_V [get_bd_intf_pins axi_amplitude_0/in_modulus_data_V] [get_bd_intf_pins axi_cut_N_0/out_cut_data_V]
  connect_bd_intf_net -intf_net axi_cut_N_1_out_cut_data_V [get_bd_intf_pins axi_amplitude_0/in_phase_data_V] [get_bd_intf_pins axi_cut_N_1/out_cut_data_V]
  connect_bd_intf_net -intf_net axi_cut_zeroes_0_out_cut_data_V [get_bd_intf_pins axi_cut_zeroes_0/out_cut_data_V] [get_bd_intf_pins axi_tremor_amp_0/in_data_V]
  connect_bd_intf_net -intf_net axi_deescalate_0_out_data_V [get_bd_intf_pins axi_N_zeroes_0/in_data_V] [get_bd_intf_pins axi_deescalate_0/out_data_V]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXIS_MM2S [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_MM2S [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins axi_mem_intercon/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_S2MM [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon/S01_AXI]
  connect_bd_intf_net -intf_net axi_dma_1_M_AXI_MM2S [get_bd_intf_pins axi_dma_1/M_AXI_MM2S] [get_bd_intf_pins axi_mem_intercon_1/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_1_M_AXI_S2MM [get_bd_intf_pins axi_dma_1/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon_1/S01_AXI]
  connect_bd_intf_net -intf_net axi_fir_0_out_fir_data_V [get_bd_intf_pins axi_cut_N_0/in_data_V] [get_bd_intf_pins axi_fir_0/out_fir_data_V]
  connect_bd_intf_net -intf_net axi_fir_1_out_fir_data_V [get_bd_intf_pins axi_cut_N_1/in_data_V] [get_bd_intf_pins axi_fir_1/out_fir_data_V]
  connect_bd_intf_net -intf_net axi_mean_0_out_mean_data_V [get_bd_intf_pins axi_mean_0/out_mean_data_V] [get_bd_intf_pins axi_stream_norm_0/in_mean_data_V]
  connect_bd_intf_net -intf_net axi_mean_0_out_rect_data_V [get_bd_intf_pins axi_mean_0/out_rect_data_V] [get_bd_intf_pins axi_stream_norm_0/in_rect_data_V]
  connect_bd_intf_net -intf_net axi_mem_intercon_1_M00_AXI [get_bd_intf_pins axi_mem_intercon_1/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP1]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_mv_0_out_mv_data_V [get_bd_intf_pins axi_mean_0/in_mv_data_V] [get_bd_intf_pins axi_mv_0/out_mv_data_V]
  connect_bd_intf_net -intf_net axi_polar_translatev2_0_out_modulus_V [get_bd_intf_pins axi_deescalate_0/in_modulus_scale_data_V] [get_bd_intf_pins axi_polar_translatev2_0/out_modulus_V]
  connect_bd_intf_net -intf_net axi_polar_translatev2_0_out_phase_V [get_bd_intf_pins axi_N_zeroes_1/in_data_V] [get_bd_intf_pins axi_polar_translatev2_0/out_phase_V]
  connect_bd_intf_net -intf_net axi_prediction_V2_0_out_current_tremor [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM] [get_bd_intf_pins axi_prediction_V2_0/out_current_tremor]
  connect_bd_intf_net -intf_net axi_prediction_V2_0_out_predict_tremor [get_bd_intf_pins axi_dma_1/S_AXIS_S2MM] [get_bd_intf_pins axi_prediction_V2_0/out_predict_tremor]
  connect_bd_intf_net -intf_net axi_scale_0_out_scale_data_V [get_bd_intf_pins axi_polar_translatev2_0/in_data_V] [get_bd_intf_pins axi_scale_0/out_scale_data_V]
  connect_bd_intf_net -intf_net axi_stream_norm_0_out_norm_data_V [get_bd_intf_pins AXI_Real2Complex_0/in_data_V] [get_bd_intf_pins axi_stream_norm_0/out_norm_data_V]
  connect_bd_intf_net -intf_net axi_tremor_amp_0_out_amp_data_V [get_bd_intf_pins axi_prediction_V2_0/in_amp_data_V] [get_bd_intf_pins axi_tremor_amp_0/out_amp_data_V]
  connect_bd_intf_net -intf_net axi_tremor_amp_0_out_max_data_V [get_bd_intf_pins axi_prediction_V2_0/in_max_data_V] [get_bd_intf_pins axi_tremor_amp_0/out_max_data_V]
  connect_bd_intf_net -intf_net axi_tremor_amp_0_out_tremor_data_V [get_bd_intf_pins axi_prediction_V2_0/in_data_V] [get_bd_intf_pins axi_tremor_amp_0/out_tremor_data_V]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins axi_mv_0/in_raw_data_V] [get_bd_intf_pins axis_data_fifo_0/M_AXIS]
  connect_bd_intf_net -intf_net butterworth_double_0_out_iir_data_V [get_bd_intf_pins axi_cut_zeroes_0/in_data_V] [get_bd_intf_pins butterworth_double_0/out_iir_data_V]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP1 [get_bd_intf_pins processing_system7_0/M_AXI_GP1] [get_bd_intf_pins ps7_0_axi_periph_1/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_1_M00_AXI [get_bd_intf_pins axi_dma_1/S_AXI_LITE] [get_bd_intf_pins ps7_0_axi_periph_1/M00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_dma_0/S_AXI_LITE] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]

  # Create port connections
  connect_bd_net -net axi_add_zeroes_0_out_data_V_TDATA [get_bd_pins axi_add_zeroes_0/out_data_V_TDATA] [get_bd_pins xfft_0/s_axis_data_tdata]
  connect_bd_net -net axi_add_zeroes_0_out_data_V_TVALID [get_bd_pins axi_add_zeroes_0/out_data_V_TVALID] [get_bd_pins xfft_0/s_axis_data_tvalid]
  connect_bd_net -net axi_analytic_fft_0_in_data_V_TREADY [get_bd_pins axi_analytic_fft_0/in_data_V_TREADY] [get_bd_pins xfft_0/m_axis_data_tready]
  connect_bd_net -net axi_analytic_fft_0_out_data_V_TDATA [get_bd_pins axi_analytic_fft_0/out_data_V_TDATA] [get_bd_pins xfft_1/s_axis_data_tdata]
  connect_bd_net -net axi_analytic_fft_0_out_data_V_TVALID [get_bd_pins axi_analytic_fft_0/out_data_V_TVALID] [get_bd_pins xfft_1/s_axis_data_tvalid]
  connect_bd_net -net axi_config_0_out_stream_TDATA [get_bd_pins axi_config_0/out_stream_TDATA] [get_bd_pins xfft_0/s_axis_config_tdata]
  connect_bd_net -net axi_config_0_out_stream_TVALID [get_bd_pins axi_config_0/out_stream_TVALID] [get_bd_pins xfft_0/s_axis_config_tvalid]
  connect_bd_net -net axi_config_1_out_stream_TDATA [get_bd_pins axi_config_1/out_stream_TDATA] [get_bd_pins xfft_1/s_axis_config_tdata]
  connect_bd_net -net axi_config_1_out_stream_TVALID [get_bd_pins axi_config_1/out_stream_TVALID] [get_bd_pins xfft_1/s_axis_config_tvalid]
  connect_bd_net -net axi_scale_0_in_ifft_data_V_TREADY [get_bd_pins axi_scale_0/in_ifft_data_V_TREADY] [get_bd_pins xfft_1/m_axis_data_tready]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins AXI_Real2Complex_0/ap_clk] [get_bd_pins axi_N_zeroes_0/ap_clk] [get_bd_pins axi_N_zeroes_1/ap_clk] [get_bd_pins axi_add_zeroes_0/ap_clk] [get_bd_pins axi_amplitude_0/ap_clk] [get_bd_pins axi_analytic_fft_0/ap_clk] [get_bd_pins axi_config_0/ap_clk] [get_bd_pins axi_config_1/ap_clk] [get_bd_pins axi_cut_N_0/ap_clk] [get_bd_pins axi_cut_N_1/ap_clk] [get_bd_pins axi_cut_zeroes_0/ap_clk] [get_bd_pins axi_deescalate_0/ap_clk] [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins axi_dma_1/m_axi_mm2s_aclk] [get_bd_pins axi_dma_1/m_axi_s2mm_aclk] [get_bd_pins axi_dma_1/s_axi_lite_aclk] [get_bd_pins axi_fir_0/ap_clk] [get_bd_pins axi_fir_1/ap_clk] [get_bd_pins axi_mean_0/ap_clk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon_1/ACLK] [get_bd_pins axi_mem_intercon_1/M00_ACLK] [get_bd_pins axi_mem_intercon_1/S00_ACLK] [get_bd_pins axi_mem_intercon_1/S01_ACLK] [get_bd_pins axi_mv_0/ap_clk] [get_bd_pins axi_polar_translatev2_0/ap_clk] [get_bd_pins axi_prediction_V2_0/ap_clk] [get_bd_pins axi_scale_0/ap_clk] [get_bd_pins axi_stream_norm_0/ap_clk] [get_bd_pins axi_tremor_amp_0/ap_clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins butterworth_double_0/ap_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/M_AXI_GP1_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP1_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins ps7_0_axi_periph_1/ACLK] [get_bd_pins ps7_0_axi_periph_1/M00_ACLK] [get_bd_pins ps7_0_axi_periph_1/S00_ACLK] [get_bd_pins rst_ps7_0_100M/slowest_sync_clk] [get_bd_pins xfft_0/aclk] [get_bd_pins xfft_1/aclk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_100M/ext_reset_in]
  connect_bd_net -net rst_ps7_0_100M_peripheral_aresetn1 [get_bd_pins AXI_Real2Complex_0/ap_rst_n] [get_bd_pins axi_N_zeroes_0/ap_rst_n] [get_bd_pins axi_N_zeroes_1/ap_rst_n] [get_bd_pins axi_add_zeroes_0/ap_rst_n] [get_bd_pins axi_amplitude_0/ap_rst_n] [get_bd_pins axi_analytic_fft_0/ap_rst_n] [get_bd_pins axi_config_0/ap_rst_n] [get_bd_pins axi_config_1/ap_rst_n] [get_bd_pins axi_cut_N_0/ap_rst_n] [get_bd_pins axi_cut_N_1/ap_rst_n] [get_bd_pins axi_cut_zeroes_0/ap_rst_n] [get_bd_pins axi_deescalate_0/ap_rst_n] [get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins axi_dma_1/axi_resetn] [get_bd_pins axi_fir_0/ap_rst_n] [get_bd_pins axi_fir_1/ap_rst_n] [get_bd_pins axi_mean_0/ap_rst_n] [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon_1/ARESETN] [get_bd_pins axi_mem_intercon_1/M00_ARESETN] [get_bd_pins axi_mem_intercon_1/S00_ARESETN] [get_bd_pins axi_mem_intercon_1/S01_ARESETN] [get_bd_pins axi_mv_0/ap_rst_n] [get_bd_pins axi_polar_translatev2_0/ap_rst_n] [get_bd_pins axi_prediction_V2_0/ap_rst_n] [get_bd_pins axi_scale_0/ap_rst_n] [get_bd_pins axi_stream_norm_0/ap_rst_n] [get_bd_pins axi_tremor_amp_0/ap_rst_n] [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins butterworth_double_0/ap_rst_n] [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins ps7_0_axi_periph_1/ARESETN] [get_bd_pins ps7_0_axi_periph_1/M00_ARESETN] [get_bd_pins ps7_0_axi_periph_1/S00_ARESETN] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] [get_bd_pins xfft_0/aresetn] [get_bd_pins xfft_1/aresetn]
  connect_bd_net -net xfft_0_m_axis_data_tdata [get_bd_pins axi_analytic_fft_0/in_data_V_TDATA] [get_bd_pins xfft_0/m_axis_data_tdata]
  connect_bd_net -net xfft_0_m_axis_data_tvalid [get_bd_pins axi_analytic_fft_0/in_data_V_TVALID] [get_bd_pins xfft_0/m_axis_data_tvalid]
  connect_bd_net -net xfft_0_s_axis_config_tready [get_bd_pins axi_config_0/out_stream_TREADY] [get_bd_pins xfft_0/s_axis_config_tready]
  connect_bd_net -net xfft_0_s_axis_data_tready [get_bd_pins axi_add_zeroes_0/out_data_V_TREADY] [get_bd_pins xfft_0/s_axis_data_tready]
  connect_bd_net -net xfft_1_m_axis_data_tdata [get_bd_pins axi_scale_0/in_ifft_data_V_TDATA] [get_bd_pins xfft_1/m_axis_data_tdata]
  connect_bd_net -net xfft_1_m_axis_data_tvalid [get_bd_pins axi_scale_0/in_ifft_data_V_TVALID] [get_bd_pins xfft_1/m_axis_data_tvalid]
  connect_bd_net -net xfft_1_s_axis_config_tready [get_bd_pins axi_config_1/out_stream_TREADY] [get_bd_pins xfft_1/s_axis_config_tready]
  connect_bd_net -net xfft_1_s_axis_data_tready [get_bd_pins axi_analytic_fft_0/out_data_V_TREADY] [get_bd_pins xfft_1/s_axis_data_tready]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins axi_config_0/in_config] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins axi_config_1/in_config] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins AXI_Real2Complex_0/ap_start] [get_bd_pins axi_N_zeroes_0/ap_start] [get_bd_pins axi_N_zeroes_1/ap_start] [get_bd_pins axi_add_zeroes_0/ap_start] [get_bd_pins axi_amplitude_0/ap_start] [get_bd_pins axi_analytic_fft_0/ap_start] [get_bd_pins axi_config_0/ap_start] [get_bd_pins axi_config_1/ap_start] [get_bd_pins axi_cut_N_0/ap_start] [get_bd_pins axi_cut_N_1/ap_start] [get_bd_pins axi_cut_zeroes_0/ap_start] [get_bd_pins axi_deescalate_0/ap_start] [get_bd_pins axi_fir_0/ap_start] [get_bd_pins axi_fir_1/ap_start] [get_bd_pins axi_mean_0/ap_start] [get_bd_pins axi_mv_0/ap_start] [get_bd_pins axi_polar_translatev2_0/ap_start] [get_bd_pins axi_prediction_V2_0/ap_start] [get_bd_pins axi_scale_0/ap_start] [get_bd_pins axi_stream_norm_0/ap_start] [get_bd_pins axi_tremor_amp_0/ap_start] [get_bd_pins butterworth_double_0/ap_start] [get_bd_pins xlconstant_2/dout]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x08000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] -force
  assign_bd_address -offset 0x08000000 -range 0x08000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] -force
  assign_bd_address -offset 0x10000000 -range 0x04000000 -target_address_space [get_bd_addr_spaces axi_dma_1/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP1/HP1_DDR_LOWOCM] -force
  assign_bd_address -offset 0x40400000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0x80400000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_1/S_AXI_LITE/Reg] -force

  # Exclude Address Segments
  exclude_bd_addr_seg -offset 0x14000000 -range 0x04000000 -target_address_space [get_bd_addr_spaces axi_dma_1/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP1/HP1_DDR_LOWOCM]


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


