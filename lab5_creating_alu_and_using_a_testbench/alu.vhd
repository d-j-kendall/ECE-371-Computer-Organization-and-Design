library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
port(
			A, B : in std_logic_vector(31 downto 0);
			alu_ctl: in std_logic_vector(1 downto 0);
			result : out std_logic_vector( 31 downto 0);
			alu_flgs: out std_logic_vector( 3 downto 0));
end entity alu;

architecture behavior of alu is

signal intern_result: std_logic_vector(31 downto 0);
signal zero : std_logic_vector(31 downto 0);
signal sA : signed(31 downto 0);
signal sB : signed(31 downto 0);
signal c31: std_logic;
signal cout: std_logic;

begin
zero <= (31 downto 0 => '0');
sA <=signed(A);
sB <=signed(B);
alu: with alu_ctl select
	intern_result <= std_logic_vector(sA+sB) when "00", -- alu ADD
				std_logic_vector(sA-sB) when "01",			-- alu SUB
				(A and B) when "10",								-- alu AND	
				(A or B) when "11",								--alu OR
				x"--------" when others;							
				
process(intern_result)
begin
		
if (intern_result(31)='1') then
	alu_flgs(3)<='1';
else
	alu_flgs(3)<='0';
end if;


if (intern_result = zero) then
	alu_flgs(2)<='1';
else
	alu_flgs(2)<='0';
end if;

if(alu_ctl="00" or alu_ctl="01") then
alu_flgs(1)<= cout;
alu_flgs(0)<= cout xor c31 ; -- signed overflow flag
end if;

end process;

c31<=(intern_result(31) xor ( A(31) xor B(31)));
cout<=(c31 and A(31)) or (c31 and B(31)) or (A(31) and B(31));
result <= intern_result;


end architecture behavior;