----- Libraries -----
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entity----
entity multiplication is
	port(
	SW		:	in std_logic_vector(199 downto 0);
	LEDR	:	out std_logic_vector(199 downto 0)
	);
end multiplication;

----Architecture-----
architecture multiplier of multiplication is
begin
	LEDR(199 downto 0) <= std_logic_vector(unsigned(SW(199 downto 100)) * unsigned(SW(99 downto 0)));
end multiplier;