library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity array_multiplier is 

port( A, B : in std_logic_vector(3 downto 0);
		o : out std_logic_vector(7 downto 0));
		
end entity array_multiplier;

architecture behavior of array_multiplier is

signal Au, Bu : unsigned( 3 downto 0 );


begin
Au<= unsigned(A);
Bu<= unsigned(B);
o<= std_logic_vector( Au*Bu);



end behavior;