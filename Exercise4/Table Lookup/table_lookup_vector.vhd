-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entity-----
entity table_lookup_vector is
	port (	SW		: in std_logic_vector(2 downto 0);
				LEDR0	: out std_logic
			);
end table_lookup_vector;

-----Architecture-----
architecture lookup of table_lookup_vector is
constant output	: std_logic_vector(0 to 7) := "11010--1";
begin
	LEDR0	<= output(to_integer(unsigned'(SW(2), SW(1), SW(0)))); --(a,b,c)
end lookup;