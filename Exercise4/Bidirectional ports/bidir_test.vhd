library ieee;
use ieee.std_logic_1164.all;

entity bidir_test is
	port(	KEY		: in std_logic_vector(1 downto 0);
			SW			: in std_logic_vector(0 downto 0);
			LEDR		: out std_logic_vector(1 downto 0);
			GPIO_1	: inout std_logic_vector(1 downto 0));
end bidir_test;

architecture bidir of bidir_test is
begin

end bidir;