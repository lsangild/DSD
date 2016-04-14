-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entity-----
entity tester is
	port(	SW						: in std_logic_vector(3 downto 0);
			HEX0, HEX1, HEX2, HEX3	: out std_logic_vector(6 downto 0)
	);
end tester;

-----Architecture-----
architecture TEST of tester is
constant turnOff : std_logic_vector(6 downto 0) := "1111111";
begin
HEX1 <= turnOff;
HEX2 <= turnOff;
HEX3 <= turnOff;
B2S		: entity work.SevenSegCase port map (bin => SW, seg => HEX0);
end TEST;