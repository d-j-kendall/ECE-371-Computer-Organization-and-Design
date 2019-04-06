library ieee;
use ieee.std_logic_1164.all;


entity mux2to1 is

port(
		s : in std_logic;
		X : in std_logic_vector(1 downto 0);
		y : out std_logic);
		
end mux2to1;


architecture behavior of mux2to1 is 



begin

with s select
y<= X(0) when '0',
	X(1) when '1',
	'-' when others;

end behavior;