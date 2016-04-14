-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entity-----
entity tester is
	port(	SW	: in std_logic_vector(3 downto 0);
			HEX1	: out std_logic_vector(6 downto 0)
	);
end tester;

-----Architecture-----
architecture TEST of tester is
begin
B2S		: entity work.Decode port map (bin => SW, seg => HEX1);
end TEST;