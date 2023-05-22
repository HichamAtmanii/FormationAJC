// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri May 19 15:24:09 2023
// Host        : DESKTOP-AD02GFS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/utilisateur/Documents/TP/TP04 -
//               Part2/LedDriver_Fifo/LedDriver/LedDriver.gen/sources_1/ip/FIFO_Code_Couleur/FIFO_Code_Couleur_stub.v}
// Design      : FIFO_Code_Couleur
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *)
module FIFO_Code_Couleur(clk, srst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[1:0],wr_en,rd_en,dout[1:0],full,empty" */;
  input clk;
  input srst;
  input [1:0]din;
  input wr_en;
  input rd_en;
  output [1:0]dout;
  output full;
  output empty;
endmodule
