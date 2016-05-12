----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;


entity Tester is
	port(	CLOCK_50	:	in std_logic;
			KEY		:	in std_logic_vector(1 downto 0);
			SW			:	in std_logic_vector(3 downto 0);
			LEDR		:	out std_logic_vector(0 downto 0)
			);
end Tester;

architecture Code_Test of Tester is
begin
cl :	entity work.Code_Lock port map (clk => CLOCK_50, reset => KEY(0), enter => KEY(1), code => SW, lock => LEDR(0));

end Code_Test;