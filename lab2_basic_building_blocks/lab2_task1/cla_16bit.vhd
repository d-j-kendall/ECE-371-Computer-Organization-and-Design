library ieee;
use ieee.std_logic_1164.all;

entity cla_16bit is

port( A, B : in std_logic_vector(15 downto 0);
		Cin  : in std_logic;
		S	  : out std_logic_vector (15 downto 0);
		Cout : out std_logic);
end entity;

architecture struct of cla_16bit is
signal carries :  std_logic_vector(4 downto 0);

begin

cla_4:
for i in 0 to 3 generate
cla_4bit : entity work.cla_4bit(struct)
port map( A(i*4+3 downto i*4), B(i*4+3 downto i*4), carries(i), S(i*4+3 downto i*4), carries(i+1));

end generate;
Cout<= Carries(4);
Carries(0)<=Cin;



end struct;