----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity Tester is
	port( KEY0, KEY3 : in std_logic;
			SW         : in std_logic_vector(17 downto 16);
			HEX0       : out std_logic_vector(6 downto 0);
			LEDR0      : out std_logic
	);
end Tester;

-----Architecture-----
architecture countTester of Tester is
signal toHex : std_logic_vector(3 downto 0) := "0000";
begin
counter : entity work.Counter port map(clk => KEY0, reset => KEY3, mode => SW, count => toHex, cout => LEDR0);
show    : entity work.Binary_7_Segment port map(num => toHex, vis => Hex0);

end countTester;
