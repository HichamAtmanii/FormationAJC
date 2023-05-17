library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity Tp4_FSM is
    port ( 
		clk			: in std_logic; 
        resetn		: in std_logic;
		Bouton_0    : in std_logic;
		LED_0 : out std_logic_vector (1 downto 0)
     );
end Tp4_FSM;

architecture behavioral of Tp4_FSM is

    type state is (Etat_Eteint, Etat_Allume); 
    
    signal current_state : state;  --etat dans lequel on se trouve actuellement
    signal next_state : state;	   --etat dans lequel on passera au prochain coup d'horloge
    
    signal End_Counter  : std_logic;
    signal LED_Commande : std_logic := '1';
    signal S_LED_0 : std_logic_vector (1 downto 0) := "00";
    
	 -- Composant Counter_Unit
    component Counter_unit 
		port ( 
			clk         : in std_logic; 
            resetn      : in std_logic; 
            End_Counter : out std_logic
		 );
	end component;
	
	
	begin
    --Affectation des signaux du testbench avec ceux de l'entite a tester
	Compteur : Counter_unit
        port map (
            clk => clk, 
            resetn => resetn,
            End_Counter => End_Counter
        );
		
		-- Gestion du reset
		process(clk,resetn, END_Counter) 
		begin
            if(resetn = '1') then
                current_state <= Etat_Eteint; 
			elsif(rising_edge(END_Counter)) then
			    current_state <= next_state;
			end if;       
		end process;

        -- processe de la machine d'états
		process(current_state, next_state) -- Liste des signaux de sensibilité du processe
		begin 	
           case current_state is
                -- à remplir
                when Etat_Eteint =>
                    LED_Commande <= '0';
                    next_state <= Etat_Allume; 
                    
				-- à remplir
                when Etat_Allume =>
                    LED_Commande <= '1';
                    next_state <= Etat_Eteint; 

              end case;  
		end process;
    
        -- Gestion de la couleur en fonction de l'état du boutton. 
    	S_LED_0 <= "01" when (LED_Commande = '1' and Bouton_0 <= '0')
              else "10" when (LED_Commande = '1' and rising_edge(Bouton_0))
                else "01" when (LED_Commande = '1' and Bouton_0 <= '1')
                     else "00";      
		      
        LED_0 <= S_LED_0;
        
end behavioral;
