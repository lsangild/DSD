----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity clock_gen is
	port( clk     : in std_logic;
		   speed   : in std_logic;
			reset   : in std_logic;
			clk_out : out std_logic
			);
end clock_gen;

-----Architecture-----
architecture clock of clock_gen is
begin
po : process(clk, reset)
variable clk_count : integer;
begin
	if reset = '0' then
		clk_out <= '0';
	elsif rising_edge(clk) then
		if speed = '1' then
			clk_count := clk_count + 1;
		else
			clk_count := clk_count + 200;
		end if;
	else
		null;
	end if;
	if clk_count = 50000000 then
		clk_out <= '1';
		clk_count := 0;
	else
		null;
	end if;
end process po;
end clock;