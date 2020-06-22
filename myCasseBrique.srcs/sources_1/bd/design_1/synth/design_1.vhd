--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Sat May  4 18:41:30 2019
--Host        : DESKTOP-5M3N59B running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_game_gen_0_0 is
  port (
    taille : in STD_LOGIC;
    speed : in STD_LOGIC;
    press : in STD_LOGIC;
    an0 : out STD_LOGIC;
    an1 : out STD_LOGIC;
    an2 : out STD_LOGIC;
    an3 : out STD_LOGIC;
    an4 : out STD_LOGIC;
    an5 : out STD_LOGIC;
    an6 : out STD_LOGIC;
    an7 : out STD_LOGIC;
    ca : out STD_LOGIC;
    cb : out STD_LOGIC;
    cc : out STD_LOGIC;
    cd : out STD_LOGIC;
    ce : out STD_LOGIC;
    cf : out STD_LOGIC;
    cg : out STD_LOGIC;
    dp : out STD_LOGIC;
    SYSCLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    SCLK : out STD_LOGIC;
    MOSI : out STD_LOGIC;
    MISO : in STD_LOGIC;
    SS : out STD_LOGIC;
    red : out STD_LOGIC_VECTOR ( 3 downto 0 );
    green : out STD_LOGIC_VECTOR ( 3 downto 0 );
    blue : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Hsync : out STD_LOGIC;
    Vsync : out STD_LOGIC;
    scr : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_game_gen_0_0;
  component design_1_playacc_0_1 is
  port (
    SYSCLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    SCLK : out STD_LOGIC;
    MOSI : out STD_LOGIC;
    MISO : in STD_LOGIC;
    SS : out STD_LOGIC;
    gauche : out STD_LOGIC;
    droite : out STD_LOGIC
  );
  end component design_1_playacc_0_1;
  signal NLW_game_gen_0_Hsync_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_MOSI_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_SCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_SS_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_Vsync_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_an0_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_an1_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_an2_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_an3_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_an4_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_an5_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_an6_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_an7_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_ca_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_cb_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_cc_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_cd_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_ce_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_cf_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_cg_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_dp_UNCONNECTED : STD_LOGIC;
  signal NLW_game_gen_0_blue_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_game_gen_0_green_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_game_gen_0_red_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_game_gen_0_scr_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_playacc_0_MOSI_UNCONNECTED : STD_LOGIC;
  signal NLW_playacc_0_SCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_playacc_0_SS_UNCONNECTED : STD_LOGIC;
  signal NLW_playacc_0_droite_UNCONNECTED : STD_LOGIC;
  signal NLW_playacc_0_gauche_UNCONNECTED : STD_LOGIC;
begin
game_gen_0: component design_1_game_gen_0_0
     port map (
      Hsync => NLW_game_gen_0_Hsync_UNCONNECTED,
      MISO => '0',
      MOSI => NLW_game_gen_0_MOSI_UNCONNECTED,
      RESET => '0',
      SCLK => NLW_game_gen_0_SCLK_UNCONNECTED,
      SS => NLW_game_gen_0_SS_UNCONNECTED,
      SYSCLK => '0',
      Vsync => NLW_game_gen_0_Vsync_UNCONNECTED,
      an0 => NLW_game_gen_0_an0_UNCONNECTED,
      an1 => NLW_game_gen_0_an1_UNCONNECTED,
      an2 => NLW_game_gen_0_an2_UNCONNECTED,
      an3 => NLW_game_gen_0_an3_UNCONNECTED,
      an4 => NLW_game_gen_0_an4_UNCONNECTED,
      an5 => NLW_game_gen_0_an5_UNCONNECTED,
      an6 => NLW_game_gen_0_an6_UNCONNECTED,
      an7 => NLW_game_gen_0_an7_UNCONNECTED,
      blue(3 downto 0) => NLW_game_gen_0_blue_UNCONNECTED(3 downto 0),
      ca => NLW_game_gen_0_ca_UNCONNECTED,
      cb => NLW_game_gen_0_cb_UNCONNECTED,
      cc => NLW_game_gen_0_cc_UNCONNECTED,
      cd => NLW_game_gen_0_cd_UNCONNECTED,
      ce => NLW_game_gen_0_ce_UNCONNECTED,
      cf => NLW_game_gen_0_cf_UNCONNECTED,
      cg => NLW_game_gen_0_cg_UNCONNECTED,
      dp => NLW_game_gen_0_dp_UNCONNECTED,
      green(3 downto 0) => NLW_game_gen_0_green_UNCONNECTED(3 downto 0),
      press => '0',
      red(3 downto 0) => NLW_game_gen_0_red_UNCONNECTED(3 downto 0),
      scr(15 downto 0) => NLW_game_gen_0_scr_UNCONNECTED(15 downto 0),
      speed => '0',
      taille => '0'
    );
playacc_0: component design_1_playacc_0_1
     port map (
      MISO => '0',
      MOSI => NLW_playacc_0_MOSI_UNCONNECTED,
      RESET => '0',
      SCLK => NLW_playacc_0_SCLK_UNCONNECTED,
      SS => NLW_playacc_0_SS_UNCONNECTED,
      SYSCLK => '0',
      droite => NLW_playacc_0_droite_UNCONNECTED,
      gauche => NLW_playacc_0_gauche_UNCONNECTED
    );
end STRUCTURE;
