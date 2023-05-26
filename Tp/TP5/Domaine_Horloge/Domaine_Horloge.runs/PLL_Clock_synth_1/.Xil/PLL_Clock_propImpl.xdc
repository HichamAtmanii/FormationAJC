set_property SRC_FILE_INFO {cfile:c:/Users/hicha/OneDrive/Bureau/TP05/Domaine_Horloge/Domaine_Horloge.gen/sources_1/ip/PLL_Clock/PLL_Clock.xdc rfile:../../../Domaine_Horloge.gen/sources_1/ip/PLL_Clock/PLL_Clock.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_100MHz]] 0.1
