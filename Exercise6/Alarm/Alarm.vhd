----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity Alarm is
	port(	bin_min1, bin_min10, bin_hrs1, bin_hrs10 : in std_logic_vector(3 downto 0);
			time_alarm : out std_logic_vector(15 downto 0)
	);
end Alarm;

-----Architecture-----
architecture Alerter of Alarm is
begin
	time_alarm <= bin_hrs10 & bin_hrs1 & bin_min10 & bin_min1;
end Alerter;