library ieee;
use ieee.std_logic_1164.all;


entity cla_4bit is

port( A, B : in std_logic_vector(3 downto 0);
		Cin  : in std_logic;
		S	  : out std_logic_vector (3 downto 0);
		Cout : out std_logic);
end entity;

architecture struct of cla_4bit is
signal G : std_logic_vector(3 downto 0);
signal P : std_logic_vector(3 downto 0);
signal Carries: std_logic_vector( 4 downto 1);

begin


G_Psigs:--Generate and Propogate signals
for i in 0 to 3 generate
G(i)<= A(i) and B(i);
P(i)<= A(i) xor B(i);
end generate;

Carries(1) <= G(0) or (Cin and(A(0) xor B(0))); -- first carries

carry_sig: -- all carries
for i in 3 downto 1 generate
Carries(i+1)<= G(i) or (Carries(i) and P(i));
end generate;

FA0 : entity work.full_adder(functional)
port map(A(0),B(0), Cin, S(0), Cout => open);

full_adders:
for i in 3 downto 1 generate 

FA : entity work.full_adder(functional)
port map(A(i), B(i), Carries(i),S(i), Cout => open);
end generate;

Cout<=Carries(4);

end struct;