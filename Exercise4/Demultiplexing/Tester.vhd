-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entity-----
entity tester is
	port(	KEY						: in std_logic_vector(1 downto 0);
			SW						: in std_logic_vector(11 downto 0);
			HEX0, HEX1, HEX2, HEX3	: out std_logic_vector(6 downto 0)
	);
end tester;

-----Architecture-----
architecture TEST of tester is
signal data_val	:	std_logic_vector(20 downto 0) := "111111111111111111111";
begin
HEX3 <= "1111111";
MX		: entity work.Multiplexer		port map (data => data_val, bin_in => SW, ab => KEY);
DMX		: entity work.Demultiplexer		port map (data_in => data_val, disp0 => HEX0, disp1 => HEX1, disp2 => HEX2);
end TEST;