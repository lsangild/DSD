----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;
use work.my_gates.all;

----- Entity ------
entity tester is 
	port(	SW		:	in std_logic_vector(1 downto 0);
			LEDR	:	out std_logic_vector(5 downto 0)
	);
end tester;

-----Architecture-----
architecture arch of tester is
  -- declare signals, components here...
begin
  -- architecture body...
  LEDR(0) <= function_xor(SW(0), SW(1)); -- xor at ledr0
  procedure_and_or(	SW(0), SW(1), 
				LEDR(1), LEDR(2)); -- and at ledr1, or at ledr2

h1: entity work.my_gates_ent port map(SW(0), SW(1), LEDR(3), LEDR(4), LEDR(5));
end architecture;
