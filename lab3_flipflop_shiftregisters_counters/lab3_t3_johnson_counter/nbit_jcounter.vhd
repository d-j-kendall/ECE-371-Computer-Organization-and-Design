library ieee;
use ieee.std_logic_1164.all;

entity nbit_jcounter is
generic(N: positive:=3);
port( rst,clk: in std_logic;
		Sout : out std_logic_vector(N-1 downto 0));

end entity;


architecture structural of nbit_jcounter is

signal s : std_logic_vector(N downto 0);


begin

s(N) <= not s(0);

nBitShift: entity work.shift_register(seq)
	generic map
	(
		N => N
	)
	port map 
	(
		Sin => S(N),
		Sout(0 to  N-1) => S(N-1 downto 0) ,
		clk => clk,
		rst => rst
	);
 Sout <= S(N downto 1);


end architecture structural;