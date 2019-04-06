library ieee;
use ieee.std_logic_1164.all;


entity shift_register is 
generic(N : positive := 4);
port(	Sin,clk,rst : in std_logic;
		Sout : out std_logic_vector(N-1 downto 0)
		);
end entity;

architecture seq of shift_register is
signal s : std_logic_vector(N-1 downto 0);
begin

process(clk,rst)

begin

if rst='1' then
	s<= (N-1 downto 0 =>'0');

elsif rising_edge(clk) then
	s(0)<=Sin;
	
	for i in 1 to N-1 loop
		S(i)<=S(i-1);
	end loop;
	
end if;

end process;

Sout<=S;

end architecture seq;
		