----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity Compare is
	port(	time_alarm, time_watch : in std_logic_vector(15 downto 0);
			alarm : out std_logic
	);
end Compare;

-----Architecture-----
architecture comp of Compare is
begin
process(time_watch, time_alarm)
begin
	if time_alarm = time_watch then
		alarm <= '1';
	else
		alarm <= '0';
	end if;
end process;	
end comp;