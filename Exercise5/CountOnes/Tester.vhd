-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entities-----
entity Tester is
	port( SW    : in std_logic_vector(7 downto 0);
			HEX0	: out std_logic_vector(6 downto 0)
	);
end Tester;

-----Architectures-----
architecture countOnesTester of Tester is
signal toHex : std_logic_vector(3 downto 0);
begin
counter  : entity work.CountOnes port map(A => SW, ones => toHex);
bintoHex : entity work.Binary_7_Segment port map(num => toHex, vis => HEX0);
end countOnesTester;