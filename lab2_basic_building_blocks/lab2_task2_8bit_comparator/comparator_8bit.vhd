library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity comparator_8bit is 

port(
		A, B: in std_logic_vector( 7 downto 0);
		G, L, E: out std_logic);
end comparator_8bit;


architecture behavior of comparator_8bit is

signal Au : unsigned(7 downto 0);
signal Bu : unsigned(7 downto 0);
signal outPut: std_logic_vector(2 downto 0);

begin

Au <= unsigned(A);
Bu <= unsigned(B);
outPut<=
		"100" when Au>Bu else
		"010" when Au<Bu else
		"001";
G<=outPut(2);
L<=outPut(1);
E<=outPut(0);



end behavior;