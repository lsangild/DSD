----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;

entity BaudTester is
	port (	CLOCK_50	: in std_logic;
				KEY		: in std_logic_vector(3 downto 0);
				LEDR		: out std_logic_vector(0 downto 0)
	);
end BaudTester;

architecture test of BaudTester is
signal clk_115200 : std_logic;
begin
gen	: entity work.BaudRateGenerator		port map (clk => CLOCK_50, reset => KEY(0), clk_baud => clk_115200);
LEDR(0) <= clk_115200;
end test;