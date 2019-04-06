library ieee;
use ieee.std_logic_1164.all;


entity mux8to1 is

port(
		s : in std_logic_vector(2 downto 0);
		x : in std_logic_vector(7 downto 0);
		y : out std_logic);

end entity;

architecture behavior of mux8to1 is
alias x1 is x(3 downto 0);
alias x2 is x(7 downto 4);
signal muxO : std_logic_vector(1 downto 0);


begin

mux1: entity work.mux4to1(behavior)
port map(s(1 downto 0), x1, muxO(0));

mux2: entity work.mux4to1(behavior)
port map(s(1 downto 0), x2, muxO(1));

mux3: entity work.mux2to1(behavior)
port map(s(2), muxO, y=>y);

end behavior;