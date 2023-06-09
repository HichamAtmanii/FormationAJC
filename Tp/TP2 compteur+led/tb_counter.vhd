library ieee;
use ieee.std_logic_1164.all;

entity tb_counter is
end tb_counter;

architecture behavioral of tb_counter is

    signal resetn      : std_logic := '0';
    signal clk         : std_logic := '0';
    signal End_Counter : std_logic := '0';
    signal restart     : std_logic := '0';

    constant nb_loop : integer := 2300;

    -- Les constantes suivantes permette de definir la frequence de l'horloge 
    constant hp : time := 5 ns;      --demi periode de 5ns
    constant period : time := 2*hp;  --periode de 10ns, soit une frequence de 100MHz

    --Declaration de l'entite a tester
    component counter_unit 
        port ( 
            clk            : in std_logic; 
            resetn        : in std_logic; 
            restart      : in std_logic;
            End_Counter : out std_logic
         );
    end component;


begin

    --Affectation des signaux du testbench avec ceux de l'entite a tester
    uut: counter_unit
        port map (
            clk => clk, 
            resetn => resetn,
            restart => restart,
            End_Counter => End_Counter
        );

    --Simulation du signal d'horloge en continue

process
    begin

       -- TESTS A EFFECTUER

       -- Compteur jusqu'�  2 seconde avec Reset active

       for k in 1 to 4 loop
        if (k>=2) then
        restart<='1';
        end if;
        resetn <= '0';
        for i in 1 to nb_loop loop
              clk <= not clk;
              wait for hp;
             if (nb_loop = 400) then
                     assert End_Counter = '0'
                     report "End_Counter : test failed, End_coder=0" severity failure;
              end if;
           end loop;

       -- Compteur jusqu'�  2 seconde avec Reset non active
       resetn <= '1';


       for j in 1 to nb_loop loop
            clk <= not clk;
            wait for hp;
                 assert End_Counter = '1'
                 report "End_Counter : test failed, End_coder=1" severity error;
        end loop;
       end loop;


    end process;
end behavioral;