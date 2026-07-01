#set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
#set_property SEVERITY {Warning} [get_drc_checks NSTD-1]


# Physical 100MHz Oscillator Clock Pin Connection on ZedBoard
set_property PACKAGE_PIN Y9 [get_ports HCLK]
set_property IOSTANDARD LVCMOS33 [get_ports HCLK]
create_clock -period 10.000 [get_ports HCLK]

# Tie HRESETn to physical Slider Switch 0 (SW0)
set_property PACKAGE_PIN F22 [get_ports HRESETn]
set_property IOSTANDARD LVCMOS33 [get_ports HRESETn]
set_property PULLUP true [get_ports HRESETn]

# Route state_led to Pmod JE1 (Pins 1, 2, 3, 4)
set_property PACKAGE_PIN V12 [get_ports {State_LED[0]}]
set_property PACKAGE_PIN W16 [get_ports {State_LED[1]}]
set_property PACKAGE_PIN J15 [get_ports {State_LED[2]}]
set_property PACKAGE_PIN H15 [get_ports {State_LED[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {State_LED[*]}]




# LEDs (APB slave output)
set_property PACKAGE_PIN T22 [get_ports {LED_OUT[0]}]
set_property PACKAGE_PIN T21 [get_ports {LED_OUT[1]}]
set_property PACKAGE_PIN U22 [get_ports {LED_OUT[2]}]
set_property PACKAGE_PIN U21 [get_ports {LED_OUT[3]}]
set_property PACKAGE_PIN V22 [get_ports {LED_OUT[4]}]
set_property PACKAGE_PIN W22 [get_ports {LED_OUT[5]}]
set_property PACKAGE_PIN U19 [get_ports {LED_OUT[6]}]
set_property PACKAGE_PIN U14 [get_ports {LED_OUT[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {LED_OUT[*]}]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list HCLK_IBUF]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/ahb_apb_bridge_0/inst/state[0]} {design_1_i/ahb_apb_bridge_0/inst/state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/ahb_apb_bridge_0_PWDATA[0]} {design_1_i/ahb_apb_bridge_0_PWDATA[1]} {design_1_i/ahb_apb_bridge_0_PWDATA[2]} {design_1_i/ahb_apb_bridge_0_PWDATA[3]} {design_1_i/ahb_apb_bridge_0_PWDATA[4]} {design_1_i/ahb_apb_bridge_0_PWDATA[5]} {design_1_i/ahb_apb_bridge_0_PWDATA[6]} {design_1_i/ahb_apb_bridge_0_PWDATA[7]} {design_1_i/ahb_apb_bridge_0_PWDATA[8]} {design_1_i/ahb_apb_bridge_0_PWDATA[9]} {design_1_i/ahb_apb_bridge_0_PWDATA[10]} {design_1_i/ahb_apb_bridge_0_PWDATA[11]} {design_1_i/ahb_apb_bridge_0_PWDATA[12]} {design_1_i/ahb_apb_bridge_0_PWDATA[13]} {design_1_i/ahb_apb_bridge_0_PWDATA[14]} {design_1_i/ahb_apb_bridge_0_PWDATA[15]} {design_1_i/ahb_apb_bridge_0_PWDATA[16]} {design_1_i/ahb_apb_bridge_0_PWDATA[17]} {design_1_i/ahb_apb_bridge_0_PWDATA[18]} {design_1_i/ahb_apb_bridge_0_PWDATA[19]} {design_1_i/ahb_apb_bridge_0_PWDATA[20]} {design_1_i/ahb_apb_bridge_0_PWDATA[21]} {design_1_i/ahb_apb_bridge_0_PWDATA[22]} {design_1_i/ahb_apb_bridge_0_PWDATA[23]} {design_1_i/ahb_apb_bridge_0_PWDATA[24]} {design_1_i/ahb_apb_bridge_0_PWDATA[25]} {design_1_i/ahb_apb_bridge_0_PWDATA[26]} {design_1_i/ahb_apb_bridge_0_PWDATA[27]} {design_1_i/ahb_apb_bridge_0_PWDATA[28]} {design_1_i/ahb_apb_bridge_0_PWDATA[29]} {design_1_i/ahb_apb_bridge_0_PWDATA[30]} {design_1_i/ahb_apb_bridge_0_PWDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/ahb_master_driver_0_HTRANS[0]} {design_1_i/ahb_master_driver_0_HTRANS[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/ahb_apb_bridge_0_PADDR[0]} {design_1_i/ahb_apb_bridge_0_PADDR[1]} {design_1_i/ahb_apb_bridge_0_PADDR[2]} {design_1_i/ahb_apb_bridge_0_PADDR[3]} {design_1_i/ahb_apb_bridge_0_PADDR[4]} {design_1_i/ahb_apb_bridge_0_PADDR[5]} {design_1_i/ahb_apb_bridge_0_PADDR[6]} {design_1_i/ahb_apb_bridge_0_PADDR[7]} {design_1_i/ahb_apb_bridge_0_PADDR[8]} {design_1_i/ahb_apb_bridge_0_PADDR[9]} {design_1_i/ahb_apb_bridge_0_PADDR[10]} {design_1_i/ahb_apb_bridge_0_PADDR[11]} {design_1_i/ahb_apb_bridge_0_PADDR[12]} {design_1_i/ahb_apb_bridge_0_PADDR[13]} {design_1_i/ahb_apb_bridge_0_PADDR[14]} {design_1_i/ahb_apb_bridge_0_PADDR[15]} {design_1_i/ahb_apb_bridge_0_PADDR[16]} {design_1_i/ahb_apb_bridge_0_PADDR[17]} {design_1_i/ahb_apb_bridge_0_PADDR[18]} {design_1_i/ahb_apb_bridge_0_PADDR[19]} {design_1_i/ahb_apb_bridge_0_PADDR[20]} {design_1_i/ahb_apb_bridge_0_PADDR[21]} {design_1_i/ahb_apb_bridge_0_PADDR[22]} {design_1_i/ahb_apb_bridge_0_PADDR[23]} {design_1_i/ahb_apb_bridge_0_PADDR[24]} {design_1_i/ahb_apb_bridge_0_PADDR[25]} {design_1_i/ahb_apb_bridge_0_PADDR[26]} {design_1_i/ahb_apb_bridge_0_PADDR[27]} {design_1_i/ahb_apb_bridge_0_PADDR[28]} {design_1_i/ahb_apb_bridge_0_PADDR[29]} {design_1_i/ahb_apb_bridge_0_PADDR[30]} {design_1_i/ahb_apb_bridge_0_PADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 2 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/ahb_master_driver_0_HADDR[0]} {design_1_i/ahb_master_driver_0_HADDR[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 3 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {design_1_i/ahb_master_driver_0_HWDATA[0]} {design_1_i/ahb_master_driver_0_HWDATA[1]} {design_1_i/ahb_master_driver_0_HWDATA[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {design_1_i/ahb_apb_bridge_0_PSEL[0]} {design_1_i/ahb_apb_bridge_0_PSEL[1]} {design_1_i/ahb_apb_bridge_0_PSEL[2]} {design_1_i/ahb_apb_bridge_0_PSEL[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/ahb_apb_bridge_0_HREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list design_1_i/ahb_apb_bridge_0_PENABLE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list design_1_i/ahb_apb_bridge_0_PWRITE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list design_1_i/ahb_master_driver_0_HSEL]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list design_1_i/ahb_master_driver_0_HWRITE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list design_1_i/apb_slave_regs_0_PREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list design_1_i/ahb_apb_bridge_0/HRESETn]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets HCLK_IBUF]
