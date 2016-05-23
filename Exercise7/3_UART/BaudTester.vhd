----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BaudTester is
	port (	CLOCK_50	: in std_logic;
				KEY		: in std_logic_vector(3 downto 0);
				LEDR		: out std_logic_vector(0 downto 0)
	);
end BaudTester;

architecture test of BaudTester is
begin
gen	: entity work.BaudRateGenerator		port map (clk => CLOCK_50, reset => KEY(0), clk_baud => LEDR(0));
end test;