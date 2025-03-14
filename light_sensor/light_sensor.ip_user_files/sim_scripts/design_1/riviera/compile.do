vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v2_0_1
vlib riviera/axi_vip_v1_1_1
vlib riviera/processing_system7_vip_v1_0_3
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_12
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/fifo_generator_v13_2_1
vlib riviera/axi_data_fifo_v2_1_14
vlib riviera/axi_register_slice_v2_1_15
vlib riviera/axi_protocol_converter_v2_1_15

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_1 riviera/axi_protocol_checker_v2_0_1
vmap axi_vip_v1_1_1 riviera/axi_vip_v1_1_1
vmap processing_system7_vip_v1_0_3 riviera/processing_system7_vip_v1_0_3
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_1 riviera/fifo_generator_v13_2_1
vmap axi_data_fifo_v2_1_14 riviera/axi_data_fifo_v2_1_14
vmap axi_register_slice_v2_1_15 riviera/axi_register_slice_v2_1_15
vmap axi_protocol_converter_v2_1_15 riviera/axi_protocol_converter_v2_1_15

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"K:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"K:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"K:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"K:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_1  -sv2k12 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_1  -sv2k12 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_3  -sv2k12 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_conv_funs_pkg.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_proc_common_pkg.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_ipif_pkg.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_family_support.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_family.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_soft_reset.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_pselect_f.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_address_decoder.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_slave_attachment.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_interrupt_control.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_1_xadc_wiz_0_0_axi_lite_ipif.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/design_1_xadc_wiz_0_0_xadc_core_drp.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/design_1_xadc_wiz_0_0_axi_xadc.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/design_1_xadc_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_50M_0/sim/design_1_rst_ps7_0_50M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_1 -93 \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_14  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_15  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_15  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../light_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

