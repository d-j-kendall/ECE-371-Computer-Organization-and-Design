library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity PriorityEncoder is

port( A : in std_logic_vector(7 downto 0);
		Y : out std_logic_vector(2 downto 0);
		n : out std_logic);
		
end PriorityEncoder;

architecture behavioral of PriorityEncoder is
signal O : std_logic_vector(3 downto 0);
begin
	O<= 
	"0111" when (A(7)='1') else
	"0110" when (A(6)='1') else
	"0101" when (A(5)='1') else
	"0100" when (A(4)='1') else
	"0011" when (A(3)='1') else
	"0010" when (A(2)='1') else
	"0001" when (A(1)='1') else
	"0000" when (A(0)='1') else
	"1000";
	n<=O(3);
	Y<=O(2 downto 0);
	
end behavioral;