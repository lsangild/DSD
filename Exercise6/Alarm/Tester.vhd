----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity Tester is
	port( CLOCK_50		: in std_logic;
			KEY			: in std_logic_vector(3 downto 0);
			HEX0, HEX1,
			HEX2, HEX3,
			HEX4, HEX5,
			HEX6, HEX7	: out std_logic_vector(6 downto 0);
			SW				: in std_logic_vector(15 downto 0);
			LEDR			: out std_logic_vector(0 downto 0)
	);
end Tester;

-----Architecture-----
architecture watch_tester of Tester is
signal time_watch, time_alarm : std_logic_vector(15 downto 0) := "0000000000000000";--(others => '0');
signal watch						: std_logic_vector(41 downto 0) := (others => '0');
signal alarm						: std_logic_vector(27 downto 0) := (others => '0');

begin
HEX0 <= "1111111";
HEX1 <= "1111111";
w  : entity work.watch port map (	clk => CLOCK_50, speed => KEY(0), reset => KEY(3), sec_1 => watch(6 downto 0),
												sec_10 => watch(13 downto 7), min_1 => watch(20 downto 14), min_10 => watch(27 downto 21),
												hrs_1 => watch(34 downto 28), hrs_10 => watch(41 downto 35), time => time_watch);
a  : entity work.Alarm port map ( bin_min1 => SW(3 downto 0), bin_min10 => SW(7 downto 4), bin_hrs1 => SW(11 downto 8), bin_hrs10 => SW(15 downto 12),
											 time_alarm => time_alarm);
c  : entity work.Compare port map (alarm => LEDR(0), time_watch => time_watch, time_alarm => time_alarm);
b1 : entity work.Binary_7_Segment port map (bin => time_alarm(3 downto 0), seg => alarm(6 downto 0));
b2 : entity work.Binary_7_Segment port map (bin => time_alarm(7 downto 4), seg => alarm(13 downto 7));
b3 : entity work.Binary_7_Segment port map (bin => time_alarm(11 downto 8), seg => alarm(20 downto 14));
b4 : entity work.Binary_7_Segment port map (bin => time_alarm(15 downto 12), seg => alarm(27 downto 21));
v  : entity work.view port map (	sec_1 => watch(6 downto 0) , sec_10 => watch(13 downto 7), min_1 => watch(20 downto 14), min_10 => watch(27 downto 21),
											hrs_1 => watch(34 downto 28), hrs_10 => watch(41 downto 35),
											min_1a => alarm(6 downto 0) , min_10a => alarm(13 downto 7),
											hrs_1a => alarm(20 downto 14), hrs_10a => alarm(27 downto 21), check => KEY(2),
											show(6 downto 0) => HEX2, show(13 downto 7) => HEX3, show(20 downto 14) => HEX4, show(27 downto 21) => HEX5,
											show(34 downto 28) => HEX6, show(41 downto 35) => HEX7);
											
end watch_tester;