----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;


entity Tester is
	port(	CLOCK_50	:	in std_logic;
			KEY		:	in std_logic_vector(3 downto 2);
			SW			:	in std_logic_vector(3 downto 0);
			LEDR		:	out std_logic_vector(2 downto 0)
			);
end Tester;

architecture Code_Test of Tester is
begin
cl :	entity work.Code_Lock port map (	clk => CLOCK_50, reset => KEY(2), enter => KEY(3), 
													code => SW, lock => LEDR(0), err => LEDR(2 downto 1));
end Code_Test;