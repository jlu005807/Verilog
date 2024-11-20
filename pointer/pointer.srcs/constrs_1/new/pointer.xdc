#DPY0
set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS33} [get_ports {num_seg7[0]}]
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {num_seg7[5]}]
set_property -dict {PACKAGE_PIN B21 IOSTANDARD LVCMOS33} [get_ports {num_seg7[4]}]
set_property -dict {PACKAGE_PIN A19 IOSTANDARD LVCMOS33} [get_ports {num_seg7[3]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {num_seg7[6]}]
set_property -dict {PACKAGE_PIN C19 IOSTANDARD LVCMOS33} [get_ports {num_seg7[7]}]
set_property -dict {PACKAGE_PIN B17 IOSTANDARD LVCMOS33} [get_ports {num_seg7[2]}]
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {num_seg7[1]}]


set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports {button_clk}]
set_property ClOCK_DEDICATED_ROUTE FALSE [get_nets button_clk_IBUF]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {swl_reset}]
set_property -dict {PACKAGE_PIN B24 IOSTANDARD LVCMOS33} [get_ports {led_c}]
