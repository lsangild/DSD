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
	GPIO_1(0)	<= NOT KEY(0)	when SW(0) = '0' else 'Z';
	LEDR(0)		<= NOT KEY(0)	when SW(0) = '0' else 'Z';
	LEDR(1)		<= GPIO_1(1) 	when SW(0) = '0' else 'Z';
	GPIO_1(1)	<= KEY(1)		when SW(0) = '1' else 'Z';
	LEDR(1)		<= KEY(1)		when SW(0) = '1' else 'Z';
	LEDR(0)		<= GPIO_1(0)	when SW(0) = '1' else 'Z';
end bidir;