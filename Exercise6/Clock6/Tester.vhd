----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity Tester is
	port( CLOCK_50		: in std_logic;
			KEY			: in std_logic_vector(3 downto 0);
			HEX0, HEX1,
			HEX2, HEX3,
			HEX4, HEX5,
			HEX6, HEX7	: out std_logic_vector(6 downto 0)
	);
end Tester;

-----Architecture-----
architecture watch_tester of Tester is
begin
HEX0 <= "1111111";
HEX1 <= "1111111";
w : entity work.watch port map (	clk => CLOCK_50, speed => KEY(0), reset => KEY(3), sec_1 => HEX2, sec_10 => HEX3, min_1 => HEX4, min_10 => HEX5,
											hrs_1 => HEX6, hrs_10 => HEX7);
end watch_tester;