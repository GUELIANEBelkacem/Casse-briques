-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:game_gen:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_game_gen_0_0 IS
  PORT (
    taille : IN STD_LOGIC;
    speed : IN STD_LOGIC;
    press : IN STD_LOGIC;
    an0 : OUT STD_LOGIC;
    an1 : OUT STD_LOGIC;
    an2 : OUT STD_LOGIC;
    an3 : OUT STD_LOGIC;
    an4 : OUT STD_LOGIC;
    an5 : OUT STD_LOGIC;
    an6 : OUT STD_LOGIC;
    an7 : OUT STD_LOGIC;
    ca : OUT STD_LOGIC;
    cb : OUT STD_LOGIC;
    cc : OUT STD_LOGIC;
    cd : OUT STD_LOGIC;
    ce : OUT STD_LOGIC;
    cf : OUT STD_LOGIC;
    cg : OUT STD_LOGIC;
    dp : OUT STD_LOGIC;
    SYSCLK : IN STD_LOGIC;
    RESET : IN STD_LOGIC;
    SCLK : OUT STD_LOGIC;
    MOSI : OUT STD_LOGIC;
    MISO : IN STD_LOGIC;
    SS : OUT STD_LOGIC;
    red : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    green : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    blue : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    Hsync : OUT STD_LOGIC;
    Vsync : OUT STD_LOGIC;
    scr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END design_1_game_gen_0_0;

ARCHITECTURE design_1_game_gen_0_0_arch OF design_1_game_gen_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_game_gen_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT game_gen IS
    PORT (
      taille : IN STD_LOGIC;
      speed : IN STD_LOGIC;
      press : IN STD_LOGIC;
      an0 : OUT STD_LOGIC;
      an1 : OUT STD_LOGIC;
      an2 : OUT STD_LOGIC;
      an3 : OUT STD_LOGIC;
      an4 : OUT STD_LOGIC;
      an5 : OUT STD_LOGIC;
      an6 : OUT STD_LOGIC;
      an7 : OUT STD_LOGIC;
      ca : OUT STD_LOGIC;
      cb : OUT STD_LOGIC;
      cc : OUT STD_LOGIC;
      cd : OUT STD_LOGIC;
      ce : OUT STD_LOGIC;
      cf : OUT STD_LOGIC;
      cg : OUT STD_LOGIC;
      dp : OUT STD_LOGIC;
      SYSCLK : IN STD_LOGIC;
      RESET : IN STD_LOGIC;
      SCLK : OUT STD_LOGIC;
      MOSI : OUT STD_LOGIC;
      MISO : IN STD_LOGIC;
      SS : OUT STD_LOGIC;
      red : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      green : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      blue : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      Hsync : OUT STD_LOGIC;
      Vsync : OUT STD_LOGIC;
      scr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT game_gen;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_game_gen_0_0_arch: ARCHITECTURE IS "game_gen,Vivado 2018.3";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_game_gen_0_0_arch : ARCHITECTURE IS "design_1_game_gen_0_0,game_gen,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_game_gen_0_0_arch: ARCHITECTURE IS "design_1_game_gen_0_0,game_gen,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=game_gen,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_game_gen_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF RESET: SIGNAL IS "XIL_INTERFACENAME RESET, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF RESET: SIGNAL IS "xilinx.com:signal:reset:1.0 RESET RST";
BEGIN
  U0 : game_gen
    PORT MAP (
      taille => taille,
      speed => speed,
      press => press,
      an0 => an0,
      an1 => an1,
      an2 => an2,
      an3 => an3,
      an4 => an4,
      an5 => an5,
      an6 => an6,
      an7 => an7,
      ca => ca,
      cb => cb,
      cc => cc,
      cd => cd,
      ce => ce,
      cf => cf,
      cg => cg,
      dp => dp,
      SYSCLK => SYSCLK,
      RESET => RESET,
      SCLK => SCLK,
      MOSI => MOSI,
      MISO => MISO,
      SS => SS,
      red => red,
      green => green,
      blue => blue,
      Hsync => Hsync,
      Vsync => Vsync,
      scr => scr
    );
END design_1_game_gen_0_0_arch;
