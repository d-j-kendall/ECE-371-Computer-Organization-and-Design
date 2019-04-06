library ieee;
use ieee.std_logic_1164.all;

entity t_ff is 
port( clk,T : in std_logic;
		Q, Qbar : out std_logic);
end entity;

architecture struct of t_ff is

begin

jk: entity work.jk_flip(sequential)
port map( J=>T, K=>T,clk=>clk,Q=>Q, Qbar=>Qbar);

end architecture struct;