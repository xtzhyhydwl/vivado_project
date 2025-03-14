vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v2_0_1
vlib riviera/axi_vip_v1_1_1
vlib riviera/processing_system7_vip_v1_0_3
vlib riviera/lib_pkg_v1_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_iic_v2_0_18
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
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_iic_v2_0_18 riviera/axi_iic_v2_0_18
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_1 riviera/fifo_generator_v13_2_1
vmap axi_data_fifo_v2_1_14 riviera/axi_data_fifo_v2_1_14
vmap axi_register_slice_v2_1_15 riviera/axi_register_slice_v2_1_15
vmap axi_protocol_converter_v2_1_15 riviera/axi_protocol_converter_v2_1_15

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"K:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"K:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"K:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"K:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_1  -sv2k12 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_1  -sv2k12 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_3  -sv2k12 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/8e66/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_iic_v2_0_18 -93 \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/4185/hdl/axi_iic_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_iic_0_0/sim/design_1_axi_iic_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_50M_0/sim/design_1_rst_ps7_0_50M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_1 -93 \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_14  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_15  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_15  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../barometer_sensor.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+K:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

