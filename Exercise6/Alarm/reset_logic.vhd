----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity reset_logic is
	port( reset_in					: in std_logic;
			reset_out				: out std_logic;
			hrs_bin1, hrs_bin10	: in std_logic_vector(3 downto 0)
	);
end reset_logic;

-----Architecture-----
architecture resetter of reset_logic is
begin
process(reset_in, hrs_bin1, hrs_bin10)
begin
	if (reset_in = '0' or ((hrs_bin10 & hrs_bin1) > "00100011")) then
		reset_out <= '0';
	else
		reset_out <= '1';
	end if;
end process;
end resetter;