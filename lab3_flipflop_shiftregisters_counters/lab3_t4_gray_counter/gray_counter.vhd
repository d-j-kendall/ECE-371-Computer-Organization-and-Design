library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray_counter is
generic( N : positive := 3);
port( UP, rst, clk : in std_logic;
		G : out std_logic_vector(N-1 downto 0));
end entity;

architecture behavioral of gray_counter is

signal uA : unsigned(N-1 downto 0);
signal bA: std_logic_vector(N-1 downto 0);

begin

process(clk , rst) begin

if rst = '1' then
	uA <= (N-1 downto 0 => '0');
elsif rising_edge(clk) then
	if UP='1' then
		uA<=uA+1;
	else
		uA<=uA-1;
	end if;
end if;
end process;

bA<=std_logic_vector(uA);

bin_2_gray: entity work.bin_2_gray(dataflow)
generic map(N=>N)
port map( B=>bA, G=>G);


end architecture behavioral;