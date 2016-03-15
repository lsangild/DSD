----- Libraries -----
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entity----
entity multiplication is
	port(
	SW		:	in std_logic_vector(3 downto 0);
	LEDR	:	out std_logic_vector(3 downto 0)
	);
end multiplication;

----Architecture-----
architecture multiplier of multiplication is
begin
	LEDR(3 downto 0) <= std_logic_vector(unsigned(SW(3 downto 2)) * unsigned(SW(1 downto 0)));
end multiplier;