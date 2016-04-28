----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity view is
	port(	sec_1, sec_10, min_1, min_10, hrs_1, hrs_10,
			min_1a, min_10a, hrs_1a, hrs_10a: in std_logic_vector(6 downto 0);
			check : in std_logic;
			show : out std_logic_vector(41 downto 0)
	);
end view;

-----Architecture-----
architecture viewer of view is
begin
process(check)
begin
	if check = '1' then
		show <= hrs_10 & hrs_1 & min_10 & min_1 & sec_10 & sec_1;
	else
		show <= hrs_10a & hrs_1a & min_10a & min_1a & "1111111" & "1111111";
	end if;
end process;	
end viewer;