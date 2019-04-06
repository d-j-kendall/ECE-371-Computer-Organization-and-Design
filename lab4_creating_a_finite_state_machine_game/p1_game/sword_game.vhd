library ieee;
use ieee.std_logic_1164.all;

entity sword_game is
port( d,a,s,w, clk, rst : in std_logic;
		roomBits : out std_logic_vector(6 downto 0);
		winLose : out std_logic_vector( 1 downto 0);
		swordBit : out std_logic);
--		<!-- Vectores from 6 to 0 indicate the present state of your rooms-->
--		<!-- 9 indicats win-->
--		<!-- 8 indicates lose-->
--		<!-- 7 indicates-->
end entity sword_game;

architecture behavior of sword_game is
type room is (cc, tt, rr, ss, dd, vv, gg);
type sword is (notHave, have);
signal pState: room;
signal nState: room;
signal hasSword : sword;

begin

	roomTracking:
	process(clk,rst)

	begin

		if(rst = '1') then
			nState <= cc;
			hasSword <= notHave;
			roomBits <= ( 6 => '1', 5 downto 0 => '0' );
			winLose <=( 1 downto 0 => '0');
			swordBit <= '0';

		elsif(rising_edge(clk)) then

			if((pState = cc) and d = '1') then
				nState <= tt;
				roomBits <= ( 6 => '0', 5 => '1', 4 downto 0 => '0');
			
			elsif (pState = tt and a = '1') then 
				nState <= cc;
				roomBits <= ( 6 => '1', 5 downto 0 => '1' );
			elsif (pState = tt and s = '1') then
				nState <= rr;
				roomBits <= (6 downto 5 => '0',4 => '1', 3 downto 0 => '0');
			elsif (pState = rr and w = '1') then
				nState <= tt;
				roomBits <= ( 6 => '0', 5 => '1', 4 downto 0 => '0');
			elsif(pState = rr and a = '1') then
				nState <= ss;
				roomBits <= ( 6 downto 4 => '0' , 3 =>  '1', 2 downto 0 => '0');
			elsif(pState = ss and d = '1') then
				nState <= rr;
				roomBits <= (6 downto 5 => '0',4 => '1', 3 downto 0 => '0');
				hasSword <= have;
				swordBit <= '1';
			elsif( pState = rr and d = '1') then
				nState <= dd;
				roomBits <= (6 downto 3 => '0', 2 => '1', 1 downto 0 => '0');
			elsif(pState = dd and d = '1') then
				if(hasSword = have) then
					nState <= vv;
					winLose<= "10";
					roomBits<= "0000010";
				else
					nState <= gg;
					winLose <= "01";
					roomBits<= "0000001";
				end if;
			else
				nState<= pState;
			end if;
			
		end if;
	end process roomTracking;
	pState <= nState;

end architecture behavior;	
		