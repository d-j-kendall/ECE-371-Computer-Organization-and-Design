library ieee;
use ieee.std_logic_1164.all;


entity muxes is

port( S : in std_logic_vector(2 downto 0);
		X : in std_logic_vector(7 downto 0);
		f : out std_logic);
		

		
end muxes;


architecture struct of muxes is

constant four : positive :=3;
signal output : std_logic;

begin

bit4Mux : entity work.n_select_mux(behavior)
generic map(four) port map(S,X,output);

f<=output;

end struct;