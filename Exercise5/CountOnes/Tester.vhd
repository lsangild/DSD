-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entities-----
entity countOnesTester is
	port( SW    : in std_logic_vector(7 downto 0);
			HEX0	: out std_logic_vector(6 downto 0)
	);
end countOnesTester;

-----Architectures-----
architecture Tester of countOnesTester is
signal toHex : std_logic_vector(3 downto 0);
begin
counter  : entity work.Counter port map(A => SW, ones => toHex);
toHex : entity work.binToHex port map(num => toHex, vis => HEX0);
end Tester;