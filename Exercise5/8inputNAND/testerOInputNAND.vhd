-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;

-----Entities-----
entity testerOinputNAND is
	port( SW    : in std_logic_vector(7 downto 0);
			LEDR  : out std_logic_vector(0 downto 0)
	);
end testerOinputNAND;

-----Architecture-----
architecture tester of testerOinputNAND is
begin
O1 : entity work.oInputNAND port map (a => SW, y => LEDR(0));
end tester;