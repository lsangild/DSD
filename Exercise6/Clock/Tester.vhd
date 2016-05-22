----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity Tester is
	port( CLOCK_50 : in std_logic;
			KEY      : in std_logic_vector(3 downto 0);
			SW       : in std_logic_vector(17 downto 16);
			HEX0		: out std_logic_vector(6 downto 0);
			LEDR		: out std_logic_vector(0 downto 0)
			);
end Tester;

-----Architecture-----
architecture clock_test of Tester is
signal clocker : std_logic;
signal tal		: std_logic_vector(3 downto 0);
begin
clock : entity work.clock_gen port map (clk => CLOCK_50, speed => KEY(0), reset => KEY(3), clk_out => clocker);
count : entity work.multi_counter port map (clk => clocker, mode => SW, reset => KEY(3), count => tal, cout => LEDR);
hex   : entity work.Binary_7_Segment port map (num => tal, vis => HEX0);
end clock_test;