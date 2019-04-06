library ieee;
use ieee.std_logic_1164.all;

entity left_rotator is

port( r: in std_logic; -- r=1 => rotate right
		A: in std_logic_vector(3 downto 0);
      S: in std_logic_vector(1 downto 0);
      O: out std_logic_vector(3 downto 0));

end entity;

architecture behavior of left_rotator is



  begin
  with r&S select O<=
  A when "000",
  A(2 downto 0)&A(3) when "001",
  A(1 downto 0)&A(3 downto 2) when "010",
  A(0)&A(3 downto 1) when "011",
  A when "100",
  A(0)&A(3 downto 1) when "101",
  A(1 downto 0)&A(3 downto 2) when "110",
  A(2 downto 0)&A(3) when "111",
  "----" when others;

  end architecture behavior;
