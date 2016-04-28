----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity watch is
	port (	clk, speed, reset : in std_logic;
				sec_1, sec_10,
				min_1, min_10,
				hrs_1, hrs_10		: out std_logic_vector(6 downto 0);
				time					: out std_logic_vector(15 downto 0)
	);
end watch;

-----Architecture-----
architecture watch_tester of watch is
signal clocker : std_logic_vector(5 downto 0) := "000000";
signal counter : std_logic_vector(23 downto 0) := "000000000000000000000000";
signal sclk 	: std_logic := '0';

begin
clo	 : entity work.clock_gen port map (clk => clk, speed => speed, reset => reset, clk_out => sclk);
sec1   : entity work.multi_counter port map (	clk => sclk, reset => reset, count => counter(3 downto 0),
																cout => clocker(0), mode => "00");				-- til 9
hexs1  : entity work.Binary_7_segment port map (bin => counter(3 downto 0), seg => sec_1);
sec10  : entity work.multi_counter port map (	clk => clocker(0), reset => reset, count => counter(7 downto 4),
																cout => clocker(1), mode => "01");	-- til 5
hexs10 : entity work.Binary_7_segment port map (bin => counter(7 downto 4), seg => sec_10);
min1   : entity work.multi_counter port map (	clk => clocker(1), reset => reset, count => counter(11 downto 8),
																cout => clocker(2), mode => "00");	-- til 9
hexm1  : entity work.Binary_7_segment port map (bin => counter(11 downto 8), seg => min_1);
min10  : entity work.multi_counter port map (	clk => clocker(2), reset => reset, count => counter(15 downto 12),
																cout => clocker(3), mode => "01");	-- til 5
hexm10 : entity work.Binary_7_segment port map (bin => counter(15 downto 12), seg => min_10);
hrs1   : entity work.multi_counter port map (	clk => clocker(3), reset => reset, count => counter(19 downto 16),
																cout => clocker(4), mode => "00");	-- til 9
hexh1  : entity work.Binary_7_segment port map (bin => counter(19 downto 16), seg => hrs_1);
hrs10  : entity work.multi_counter port map (	clk => clocker(4), reset => reset, count => counter(23 downto 20),
																cout => clocker(5), mode => "10");	-- til 2
hexh10 : entity work.Binary_7_segment port map (bin => counter(23 downto 20), seg => hrs_10);

time <= counter(23 downto 8);
end watch_tester;