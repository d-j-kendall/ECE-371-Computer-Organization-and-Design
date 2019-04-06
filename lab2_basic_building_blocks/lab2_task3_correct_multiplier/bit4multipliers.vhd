library ieee;
use ieee.std_logic_1164.all;


entity bit4multipliers is

port( A,B : in std_logic_vector(3 downto 0);
		P   : out std_logic_vector(7 downto 0));
		
end entity;


architecture structure of bit4multipliers is

type std_logic_vector4by4 is array(3 downto 0) of std_logic_vector( 3 downto 0);
type sum_signals is array(2 downto 0) of std_logic_vector(4 downto 0);
signal BA : std_logic_vector4by4;
signal S : sum_signals;

begin

BA(0)<=A and (B(0)&B(0)&B(0)&B(0));
BA(1)<=A and (B(1)&B(1)&B(1)&B(1));
BA(2)<=A and (B(2)&B(2)&B(2)&B(2));
BA(3)<=A and (B(3)&B(3)&B(3)&B(3));

P(0)<=BA(0)(0);

bit4adder1: entity work.cla_4bit(struct)
port map(A(2 downto 0)=>BA(0)(3 downto 1),A(3)=>BA(2)(2),B(0)=>BA(1)(0),B(1)=>BA(1)(1),B(2)=>BA(1)(2),B(3)=>BA(1)(3), Cin => '0', Cout=>S(0)(4), S=>S(0)(3 downto 0));

bit4adder2: entity work.cla_4bit(struct)
    port map(A(3 downto 0)=>BA(2)(3)&S(0)(3 downto 1),B(3 downto 0)=>BA(3)(2 downto 1)&Ba(2)( 1 downto 0),cin=>'0', cout=>S(1)(4),S=>S(1)(3 downto 0));

bit4adder3: entity work.cla_4bit(struct)
    port map(A(3 downto 0)=>S(1)(4)&S(0)(4)&'0'&BA(3)(0),B(3 downto 0)=>BA(3)(3)&S(1)(3 downto 1),cin =>'0', S=>S(2)(3 downto 0), cout=>S(2)(4));

P(7 downto 3)<=S(2);
P(2 downto 1)<=S(1)(0)&S(0)(0);








end architecture structure;