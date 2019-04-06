library ieee;
use ieee.std_logic_1164.all;

entity turn_signals is
port( clk,l,r : in std_logic;
		lSignal, rSignal : out std_logic_vector(2 downto 0));
end entity;

architecture fsm of turn_signals is

type lightState is ( three, two, one, off);
signal lps, lns, rps, rns : lightState;



begin

process(clk)


begin

if(rising_edge(clk)) then
	if( r = '1' and l = '1') then
		lns <= off;
		rns <= off;
	elsif(l = '1' and lps = off) then
		lns <= one;
		rns <=off;
	elsif(lps=one) then
		lns <= two;
		rns <=off;
	elsif(lps=two) then
		lns <= three;
		rns <= off;
	elsif(lps=three) then 
		lns<= off;
		rns <= off;
	elsif(r = '1' and rps= off) then
		rns<= one;
		lns<=off;
	elsif(rps=one) then
		rns <= two;
		lns <= off;
	elsif(rps=two) then
		rns <= three;
		lns <= off;
	elsif(rps = three) then 
		rns<= off;
		lns <= off;
	else
		rns <= off;
		lns <= off;
	end if;
end if;

end process;
lps <= lns;
rps <= rns;

leftLight: with lps select
	lSignal <= "000" when off,
				"001" when one,
				"011" when two,
				"111" when three;

rightLight: with rps select
	rSignal <= "000" when off,
				"001" when one,
				"011" when two,
				"111" when three;

end architecture fsm;
	
	
	