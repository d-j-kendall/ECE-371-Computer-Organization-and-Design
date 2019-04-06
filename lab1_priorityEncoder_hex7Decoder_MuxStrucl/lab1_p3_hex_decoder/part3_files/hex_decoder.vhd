library ieee;
use ieee.std_logic_1164.all;


entity hex_decoder is

port(
		D : in std_logic_vector(3 downto 0);
		S : out std_logic_vector( 6 downto 0));
		
end hex_decoder;

architecture behavior of hex_decoder is

begin

with D select
	S <= "0111111" when x"0",
		  "0000110" when x"1",
		  "1011011" when x"2",
		  "1001111" when x"3",
		  "1100110" when x"4",
		  "1101101" when x"5",
		  "1111101" when x"6",
		  "0000111" when x"7",
		  "1111111" when x"8",
		  "1100111" when x"9",
		  "1110111" when x"a",
		  "1111100" when x"b",
		  "0011001" when x"c",
		  "0111110" when x"d",
		  "1111001" when x"e",
		  "1110001" when x"f",
		"0000000" when others;

end behavior;
		