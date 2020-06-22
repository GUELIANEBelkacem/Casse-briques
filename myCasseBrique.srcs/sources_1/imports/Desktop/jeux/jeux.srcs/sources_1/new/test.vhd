library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity playacc is
port
(
   SYSCLK     : in STD_LOGIC; -- System Clock
   RESET      : in STD_LOGIC;

   -- Accelerometer data signals


   --SPI Interface Signals
   SCLK       : out STD_LOGIC;
   MOSI       : out STD_LOGIC;
   MISO       : in STD_LOGIC;
   SS         : out STD_LOGIC;
   gauche     : out STD_LOGIC; 
   droite     : out STD_LOGIC
   );
end playacc;

architecture Behavioral of playacc is
 signal a,b,c,e : STD_LOGIC_VECTOR(11 downto 0);
 signal d: STD_LOGIC;
 signal res : STD_LOGIC;
begin
res<=not(RESET);
    

acc : entity work.ADXL362Ctrl(Behavioral)
      port map (SYSCLK => SYSCLK, RESET => res, MISO => MISO, ACCEL_X => b, ACCEL_Y => a, ACCEL_Z => c, MOSI => MOSI, SS  => SS , SCLK => SCLK, ACCEL_TMP => e, Data_Ready=> d);
gauche <= not(a(11)) and (a(10) or a(9)or a(8)) ; 
droite <= a(11) and (not(a(10)) or not(a(9)) or not(a(8))) ; 


end Behavioral;