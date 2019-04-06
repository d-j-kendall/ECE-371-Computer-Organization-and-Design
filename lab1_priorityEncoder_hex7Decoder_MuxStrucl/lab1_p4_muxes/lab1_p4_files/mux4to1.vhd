library ieee;
use ieee.std_logic_1164.all;


entity mux4to1 is

port(
		s: in std_logic_vector(1 downto 0);
		x: in std_logic_vector(3 downto 0);
		y: out std_logic);
end mux4to1;


architecture behavior of mux4to1 is


begin
y<= x(3) when (s="11") else
	x(2) when (s="10")  else
	x(1) when (s="01")  else
	x(0) when (s="00")  else
	'-';




end behavior;