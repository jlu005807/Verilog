#LEDS
set_property -dict {PACKAGE_PIN B24 IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN E21 IOSTANDARD LVCMOS33} [get_ports {leds[1]}]


#DP
set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS33} [get_ports {dpy0[0]}]
#C
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {dpy0[5]}]
#D
set_property -dict {PACKAGE_PIN B21 IOSTANDARD LVCMOS33} [get_ports {dpy0[4]}]
#E
set_property -dict {PACKAGE_PIN A19 IOSTANDARD LVCMOS33} [get_ports {dpy0[3]}]
#B
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {dpy0[6]}]
#A
set_property -dict {PACKAGE_PIN C19 IOSTANDARD LVCMOS33} [get_ports {dpy0[7]}]
#F
set_property -dict {PACKAGE_PIN B17 IOSTANDARD LVCMOS33} [get_ports {dpy0[2]}]
#G
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {dpy0[1]}]


#DIP_SW
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports {data_in[0]}]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {data_in[1]}]
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports {data_in[2]}]
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {data_in[3]}]

set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports {addr[0]}]
set_property -dict {PACKAGE_PIN N6 IOSTANDARD LVCMOS33} [get_ports {addr[1]}]

set_property -dict {PACKAGE_PIN M5 IOSTANDARD LVCMOS33} [get_ports {reset}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {reset_IBUF}]

set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports {r_en}]
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports {ram_en}]
set_property -dict {PACKAGE_PIN L2 IOSTANDARD LVCMOS33} [get_ports {rowl_clk}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {rowl_clk_IBUF}]