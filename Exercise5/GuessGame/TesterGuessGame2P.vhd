-----Library statements -----
library ieee;
use ieee.std_logic_1164.all;

-----Entity declaration -----
entity TesterGuessGame2P is
	port(	SW												: in std_logic_vector(8 downto 0);
			HEX0, HEX1, HEX2, HEX3, HEX4, HEX5	: out std_logic_vector(6 downto 0);
			KEY											: in std_logic_vector(2 downto 0)
	);	
end TesterGuessGame2P;


architecture guessing of TesterGuessGame2P is
-- declare signals, components here...
constant turnOff : std_logic_vector(6 downto 0) := "1111111";
constant P		 : std_logic_vector(6 downto 0) := "0001100";
signal p1Hex1, p1Hex10, p2Hex1, p2Hex10 : std_logic_vector(6 downto 0);
signal p1Code, p2Code : std_logic_vector(7 downto 0);
begin
HEX2 <= turnOff;
HEX3 <= turnOff;
HEX5 <= P;
-- architecture body...
P1: entity work.GuessGame port map (	inputs => p1Code, set => KEY(0), 
										show => KEY(1), try => KEY(2), 
										hex1 => p1Hex1, hex10 => p1Hex10);

P2: entity work.GuessGame port map (	inputs => p2Code, set => KEY(0), 
										show => KEY(1), try => KEY(2), 
										hex1 => p2Hex1, hex10 => p2Hex10);

process(SW(8))
begin
	if (SW(8) = '0') then
	  -- Player 1...
		HEX4 <= "1111001";
		HEX0 <= p1Hex1;
		HEX1 <= p1Hex10;
		p1Code <= SW(7 downto 0);
	  elsif (SW(8) = '1') then
	  -- Player 2
		HEX4 <= "0100100";
		HEX0 <= p2Hex1;
		HEX1 <= p2Hex10;
		p2Code <= SW(7 downto 0);
	  else
	  --go die --
		HEX4 <= turnOff;
	end if;
	
end process;

end architecture;