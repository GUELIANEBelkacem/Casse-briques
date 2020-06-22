library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.pong_pack.ALL;


entity game_gen is
  Port (

  taille     : in STD_LOGIC; 
  speed     : in STD_LOGIC;
  press     : in STD_LOGIC;
  an0,an1,an2,an3,an4,an5,an6,an7,ca,cb,cc,cd,ce,cf,cg,dp : out STD_LOGIC;
  
  SYSCLK     : in STD_LOGIC;
  RESET     : in STD_LOGIC;
  SCLK       : out STD_LOGIC;
  MOSI       : out STD_LOGIC;
  MISO       : in STD_LOGIC;
  SS         : out STD_LOGIC;
  
  
  red     : out STD_LOGIC_vector(3 downto 0);
  green     : out STD_LOGIC_vector(3 downto 0); 
  blue     : out STD_LOGIC_vector(3 downto 0); 
  Hsync     : out STD_LOGIC;
  Vsync     : out STD_LOGIC;
  scr:  out std_logic_vector(15 downto 0)
  );
end game_gen;

architecture Behavioral of game_gen is
signal go,dr,clk25,clk5,bottom,wall,pad,briquecasse,ball,bluebox,visible,endframe,freeze,win_out,miss_out: STD_LOGIC;
signal brick,brick_bounce : tableau;
signal r,g,b : std_logic_vector(3 downto 0);
signal xpos,ypos: std_logic_vector(9 downto 0);
signal miss_timer: std_logic_vector(5 downto 0);
signal countofscore,cclk : integer := 0;
signal sw : STD_LOGIC;



begin

r(3)<='0';
r(2)<='0';
r(1)<='0';
g(3)<='0';
g(2)<='0';
g(1)<='0';
b(3)<='0';
b(2)<='0';
b(1)<='0';


acc : entity work.playacc(Behavioral)
      port map(SYSCLK => SYSCLK, RESET => RESET, MISO => MISO, MOSI => MOSI, SS  => SS , SCLK => SCLK, gauche => go, droite => dr );

getclk25 : entity work.ClkDiv(Behavioral)
      port map(clk100 => SYSCLK, RESET => RESET, clk25 => clk25);
      
getclk5 : entity work.ClkDiv_5Hz(Behavioral)
      port map(CLK => SYSCLK, RST => RESET, CLKOUT => clk5);
      
vga : entity work.VGA(archi)
      port map(clk25 => clk25, reset => reset, r => r, g => g, b => b, red => red, green => green, blue => blue, Hsync => Hsync, Vsync => Vsync, visible => visible, endframe => endframe, xpos => xpos, ypos => ypos   );
      
Objects : entity work.objects(Behavioral)
      port map(clk25 => clk25, clk5Hz => clk5, reset => RESET, rot_left => go, rot_right => dr, taille => taille, speed => speed, bluebox => bluebox, bottom => bottom, wall => wall, pad => pad, brick => brick, brick_bounce => brick_bounce, briquecasse => briquecasse, ball => ball, visible => visible, endframe => endframe, xpos => xpos, ypos => ypos, miss_timer => miss_timer, freeze => freeze   );
 
 
Game : entity work.game(Behavioral)
      port map(clk25 => clk25, reset => RESET, press => press, bluebox => bluebox, bottom => bottom, wall => wall, pad => pad, brick => brick, brick_bounce => brick_bounce, ball => ball, miss_timer => miss_timer, freeze => freeze, visible => visible, endframe => endframe, red => r(0), green => g(0), blue => b(0), win_out=> win_out, miss_out => miss_out); 
      
      

--         miss_out : out std_logic;				-- Partie Perdue
--         win_out  : out std_logic;                -- Partie Gagnee




 counter : process
 begin

 --if (countofscore = 0) then scr(0)<='0'; scr(1)<='0'; scr(2)<='0'; scr(3)<='0'; scr(4)<='0'; scr(5)<='0'; scr(6)<='0'; scr(7)<='0'; scr(8)<='0';scr(9)<='0';scr(10)<='0';scr(11)<='0';scr(12)<='0'; scr(13)<='0';scr(14)<='0'; scr(15)<='0';  end if;
 if(briquecasse = '0') then sw<='0'; end if; 
 if  (briquecasse = '1' and sw = '0') then countofscore <= countofscore+1; sw<='1'; end if;
 if  (countofscore = 0) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '0';
ce<= '0';
cf<= '0';
cg<= '1';
dp <= '0';
end if;
if  (countofscore = 1) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if  (countofscore = 2) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '0';
cb<= '0';
cc<= '1';
cd<= '0';
ce<= '0';
cf<= '1';
cg<= '0';
dp <= '0';
end if;
if  (countofscore = 3) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '0';
ce<= '1';
cf<= '1';
cg<= '0';
dp <= '0';
end if;
if  (countofscore = 4) then an0 <= '1';
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
if  (countofscore = 5) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '0';
cb<= '1';
cc<= '0';
cd<= '0';
ce<= '1';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
if  (countofscore = 6) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '0';
cb<= '1';
cc<= '0';
cd<= '0';
ce<= '0';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
if  (countofscore = 7) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if  (countofscore = 8) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '0';
ce<= '0';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
if  (countofscore = 9) then 
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '0';
ce<= '1';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
if  (countofscore = 10) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '0';
ce<= '0';
cf<= '0';
cg<= '1';
dp <= '0';
end if;
end if;

if  (countofscore = 11) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
end if;

if  (countofscore = 12) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '0';
cb<= '0';
cc<= '1';
cd<= '0';
ce<= '0';
cf<= '1';
cg<= '0';
dp <= '0';
end if;
end if;

if  (countofscore = 13) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '0';
ce<= '1';
cf<= '1';
cg<= '0';
dp <= '0';
end if;
end if;

if  (countofscore = 14) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
end if;

if  (countofscore = 15) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '0';
cb<= '1';
cc<= '0';
cd<= '0';
ce<= '1';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
end if;

if  (countofscore = 16) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '0';
cb<= '1';
cc<= '0';
cd<= '0';
ce<= '0';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
end if;

if  (countofscore = 17) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
end if;

if  (countofscore = 18) then 
if clk5 = '0' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '1';
an7 <= '0';
ca<= '1';
cb<= '0';
cc<= '0';
cd<= '1';
ce<= '1';
cf<= '1';
cg<= '1';
dp <= '0';
end if;
if clk5 = '1' then
an0 <= '1';
an1 <= '1';
an2 <= '1';
an3 <= '1';
an4 <= '1';
an5 <= '1';
an6 <= '0';
an7 <= '1';
ca<= '0';
cb<= '0';
cc<= '0';
cd<= '0';
ce<= '0';
cf<= '0';
cg<= '0';
dp <= '0';
end if;
end if;





-- if (countofscore = 17) then countofscore <=1; end if;
-- if  (countofscore = 1) then scr(0)<='1'; end if;
-- if  (countofscore = 2) then scr(1)<='1'; end if;
-- if  (countofscore = 3) then scr(2)<='1'; end if ;
-- if  (countofscore = 4) then scr(3)<='1'; end if;
-- if  (countofscore = 5) then scr(4)<='1'; end if;
-- if  (countofscore = 6) then scr(5)<='1'; end if;
-- if  (countofscore = 7) then scr(6)<='1'; end if;
-- if  (countofscore = 8) then scr(7)<='1'; end if;
-- if  (countofscore = 9) then scr(8)<='1'; end if;
-- if  (countofscore = 10) then scr(9)<='1'; end if;
-- if  (countofscore = 11) then scr(10)<='1'; end if;
-- if  (countofscore = 12) then scr(11)<='1'; end if;
-- if  (countofscore = 13) then scr(12)<='1'; end if;
-- if  (countofscore = 14) then scr(13)<='1'; end if;
-- if  (countofscore = 15) then scr(14)<='1'; end if;
-- if  (countofscore = 16) then scr(15)<='1'; end if;
 
 end process;
--countofscore <= countofscore+1 when  briquecasse = '1'; 
--scr(0)<='1' when  briquecasse = '1' and countofscore = 1;
--scr(1)<='1' when  briquecasse = '1' and countofscore = 2;
--scr(2)<='1' when  briquecasse = '1' and countofscore = 3;
--scr(3)<='1' when  briquecasse = '1' and countofscore = 4;
--scr(4)<='1' when  briquecasse = '1' and countofscore = 5;
--scr(5)<='1' when  briquecasse = '1' and countofscore = 6;
--scr(6)<='1' when  briquecasse = '1' and countofscore = 7;
--scr(7)<='1' when  briquecasse = '1' and countofscore = 8;
--scr(8)<='1' when  briquecasse = '1' and countofscore = 9;
--scr(9)<='1' when  briquecasse = '1' and countofscore = 10;
--scr(10)<='1' when  briquecasse = '1' and countofscore = 11;
--scr(11)<='1' when  briquecasse = '1' and countofscore = 12;
--scr(12)<='1' when  briquecasse = '1' and countofscore = 13;
--scr(13)<='1' when  briquecasse = '1' and countofscore = 14;
--scr(14)<='1' when  briquecasse = '1' and countofscore = 15;
--scr(15)<='1' when  briquecasse = '1' and countofscore = 16;



end Behavioral;
