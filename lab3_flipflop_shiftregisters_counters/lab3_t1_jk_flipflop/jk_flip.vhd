library ieee;
use ieee.std_logic_1164.all;


entity jk_flip is 

port( J,K: in std_logic;
		clk: in std_logic;
		 Q, Qbar: out std_logic
		 );
end entity;


architecture sequential of jk_flip is

signal JK : std_logic_vector( 1 downto 0);


begin

JK<=J&K;

process(clk)

begin

if rising_edge(clk) then

--	with JK select Q<= '1' when "10",
--	'0' when "01",
--	(not Q) when "11",
--	Q when others;
	-- All choice expressions in a VHDL case statement must be constant
-- and unique.	Also, the case statement must be complete, or it must
-- include an others clause. 
case JK is
	when "10" =>
			Q<='1';
	when "01" =>
			Q<='0';
	when "11"=>
			Q<=Qbar;
	when others =>
			Q<=Q;			
end case;
		

end if;

end process;
Qbar<= not Q;

end architecture sequential; 