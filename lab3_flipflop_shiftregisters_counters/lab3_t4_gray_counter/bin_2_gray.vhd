library ieee;
use ieee.std_logic_1164.all;

entity bin_2_gray is
generic( N : positive := 8);
port( B : in std_logic_vector(N-1 downto 0);
		G : out std_logic_vector(N-1 downto 0));
		
end entity;

architecture dataflow of bin_2_gray is

begin

G(N-1)<=B(N-1);
gray_code:
for i in N-2 downto 0 generate
	G(i)<= B(i) XOR B(i+1);
end generate;


end architecture dataflow;