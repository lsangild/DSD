----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;


entity Tester is
	port(	LEDR	:	out std_logic_vector(1 downto 0);
			KEY	:	in std_logic_vector(1 downto 0);
			SW		:	in std_logic_vector(1 downto 0)
			);
end Tester;

architecture State of Tester is
begin
sm1	:	entity work.Mee_Moo port map(moo_out => LEDR(0), mea_out => LEDR(1), clk => KEY(0), reset => KEY(1), inp => SW);
end State;