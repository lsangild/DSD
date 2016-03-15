----- Libraries -----
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entity----
entity multiplication is
	port(
	SW		:	in std_logic_vector(7 downto 0);
	LEDR	:	out std_logic_vector(11 downto 0)
	);
end multiplication;

----Architecture-----
architecture multiplier of multiplication is
constant tal : integer := 4;
begin
	LEDR <= std_logic_vector(unsigned(SW) * TO_UNSIGNED(tal,4));
end multiplier;