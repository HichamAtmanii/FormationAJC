-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon May 22 14:12:22 2023
-- Host        : LAPTOP-RHNTID5O running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top FIFO_Code_Couleur -prefix
--               FIFO_Code_Couleur_ FIFO_Code_Couleur_stub.vhdl
-- Design      : FIFO_Code_Couleur
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FIFO_Code_Couleur is
  Port ( 
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 1 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end FIFO_Code_Couleur;

architecture stub of FIFO_Code_Couleur is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,srst,din[1:0],wr_en,rd_en,dout[1:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_2_5,Vivado 2020.2";
begin
end;
