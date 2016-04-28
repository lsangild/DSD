----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity Tester is
	port( KEY			: in std_logic_vector(3 downto 0);
			SW         	: in std_logic_vector(17 downto 16);
			HEX0       	: out std_logic_vector(6 downto 0);
			LEDR      	: out std_logic_vector(0 downto 0)
	);
end Tester;

-----Architecture-----
architecture countTester of Tester is
signal toHex : std_logic_vector(3 downto 0);
begin
counter : entity work.GrimTester port map(clk => KEY(0), reset => KEY(3), mode => SW, 
										count => toHex, cout => LEDR);
show    : entity work.Binary_7_Segment port map(num => toHex, vis => HEX0);

end countTester;