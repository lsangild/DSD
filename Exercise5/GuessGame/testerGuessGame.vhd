-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entity-----
entity testerGuessGame is
	port(	SW						: in std_logic_vector(7 downto 0);
			HEX0, HEX1, HEX2, HEX3	: out std_logic_vector(6 downto 0);
			KEY						: in std_logic_vector(2 downto 0)
	);
end testerGuessGame;

-----Architecture-----
architecture TEST of testerGuessGame is
constant turnOff : std_logic_vector(6 downto 0) := "1111111";
begin
HEX2 <= turnOff;
HEX3 <= turnOff;
B2S		: entity work.GuessGame port map (	inputs => SW, set => KEY(0), 
											show => KEY(1), try => KEY(2), 
											hex1 => HEX0, hex10 => HEX1);
end TEST;