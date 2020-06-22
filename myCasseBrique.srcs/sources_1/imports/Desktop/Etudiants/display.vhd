----------------------------------------------------------------------------------
-- Company: UPMC
-- Engineer: Julien Denoulet
-- 
--	Selection des Couleurs des Pixels a Afficher
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.pong_pack.ALL;

entity display is
    Port ( pad : in  STD_LOGIC;			-- Pixel Courant = Raquette
           wall : in  STD_LOGIC;			-- Pixel Courant = Mur
           bluebox : in  STD_LOGIC;		-- Pixel Courant = Case Bleue
           ball : in  STD_LOGIC;			-- Pixel Courant = Balle
           brick : in  tableau;			-- Pixel Courant = Brique
           win : in  STD_LOGIC;			-- Partie Gagnee
           miss : in  STD_LOGIC;			-- Partie Perdue
           red : out  STD_LOGIC;			-- Commande Affichage Rouge
           green : out  STD_LOGIC;		-- Commande Affichage Vert
           blue : out  STD_LOGIC);		-- Commande Affichage Bleu
end display;

architecture Behavioral of display is

begin

	process (pad,wall,bluebox,ball,brick,win,miss)

	begin

		-- LE PIXEL COURAT APPARTIENT AU DECOR

		-- Si le Pixel Courant Appartient a un Mur
		--	Couleur = Blanc
		if wall = '1' then
			red <= '1'; green <= '1'; blue <= '1'; 
	
		-- Sinon, si le Pixel Courant Appartient a une case Bleue du Decor
		--	Couleur = Bleu
		elsif bluebox = '1' then
			red <= '0'; green <= '0'; blue <= '1'; 
		
		else
		-- Sinon, le Pixel Courant Est Noir S'Il Fait Partie du Decor
		--	Couleur = Bleu
			red <= '0'; green <= '0'; blue <= '0'; 
		end if;


		-- LE PIXEL COURANT EST UNE BRIQUE

		-- Couleur = Blanc
		for i in 0 to 1 loop
			for j in 0 to 8 loop
				if brick(i)(j)='1' then 
					red<='1'; green<='1'; blue<='1'; 
				end if;
			end loop;
		end loop;

		-- LE PIXEL COURANT APPARTIENT A LA BALLE OU LA RAQUETTE

		-- Couleur = Jaune
		if (pad or ball) = '1' then 
			red <= '1'; green <= '1'; blue <= '0'; 
		end if;

		-- PARTIE GAGNEE -> Couleur Vert
		-- PARTIE PERDUE -> Couleur Rouge
	
		if win = '1' then 
			red <= '0'; green <= '1'; blue <= '0'; 
		elsif miss='1' then 
			red <= '1'; green <= '0'; blue <= '0'; 
		end if;

end process;


end Behavioral;

