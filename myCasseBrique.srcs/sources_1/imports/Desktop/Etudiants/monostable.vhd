library ieee;
use ieee.std_logic_1164.all;

entity monostable is
port(clk, reset : in std_logic;
    commande : in std_logic;
    impulse : out std_logic);
end entity monostable;

architecture comport of monostable is
type Etat is (etat0, etat1, etat2);
signal EP,EF : Etat;
begin

    clocked : process(clk,reset)
              begin
                if (reset = '0') then
                    EP <= Etat0;
                elsif (clk'event and clk ='1') then
                    EP <= EF;
                end if;
           end process clocked;
    
    evol : process(EP,commande) is
           begin
            Case EP is
                when Etat0 =>
                    impulse <= '0';
                    if (commande = '1') then
                        EF <= Etat1;
                    else
                        EF <= Etat0;
                    end if;
                when Etat1 =>
                    impulse <= '1';
                    EF <= Etat2;
                when Etat2 =>
                    impulse <= '0';
                    if (commande = '0') then
                        EF <= Etat0;
                    else
                        EF <= Etat2;
                    end if;
                when others => NULL;
            end case;
         end process evol;
         
         
end architecture comport;
                