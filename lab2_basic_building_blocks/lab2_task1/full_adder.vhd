library ieee;
use ieee.std_logic_1164.all;

entity full_adder is

port( A,B, Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic
		);
		
end entity;

architecture functional of full_adder is

signal intermOUT : std_logic;

begin
S <= Cin xor (A xor B);
Cout <= (A and B) or (A and Cin) or (B and Cin);

end functional;

		