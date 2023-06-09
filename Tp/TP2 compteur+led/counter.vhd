library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.NUMERIC_STD.ALL;

entity counter_unit is
    port ( 
        clk         : in std_logic;  --Cr�ation de ma clock
        resetn      : in std_logic;     --Cr�ation de mon reset
        restart     : in std_logic;     --Cr�ation de mon restart
        End_Counter : out std_logic;    --Cr�ation de ma sortie fin de comptage    
        LED_Output  : out std_logic        --Cr�ation de ma sortie pour l'allumage de notre LED
     );
end counter_unit;

architecture behavioral of counter_unit is

    --Declaration des signaux internes
    constant Cst : positive := 200000000; --200000000 --s_TimeOut_2s  
    signal D_out : positive range 0 to Cst ; --s_Counter_2s  --s_Counter_2s
    Signal Cmd   : std_logic := '0';    --Signal de commande en entr�e du multiplexer
    Signal s_LED_Output : std_logic := '0'; --Signal interne pour notre sortie Led

    begin

        --Partie sequentielle
        process(clk,resetn, restart)
        begin
            if(resetn = '1') then   --Condition si Reset actif
                D_out <= 0;         --Compteur D_out � 0
                s_LED_Output <= '0'; -- Signal de sortie de LED � 0
                 elsif(rising_edge(clk)) then 
                    if (restart = '1') then  --Condition pour le restart
                        D_out <= 0;           --Compteur � 0
                        s_LED_Output <= '0';    --Sorite led � 0
                    else
                        D_out <= D_out + 1 ;    --Incr�mentation du compteur
                        if (Cmd = '1') then     
                            D_out <= 0;         --Si la commande � 1 le compteur � 0
                            s_LED_Output <= not(s_LED_Output);  --Inversion de l'�tat de la led
                        end if;
                     end if;
            end if;
    end process;

    --Partie combinatoire
    Cmd <= '1'  when (D_out = Cst-1 ) --Quand on arrive � la fin du compteur Commande � 1
            else '0';
    End_Counter <= Cmd;                --End_counter prend la valeur de commande

    LED_Output <= s_LED_Output;         --Affectation de mon signal interne � ma sortie

end behavioral;