----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;

entity BaudGenerator is
	port (	clk, reset	: in std_logic;
				clk_baud		: out std_logic
				);
end BaudGenerator

architecture Gen115200 of BaudGenerator is
begin
process (clk, reset)
variable clk_count : integer;
	begin
	clk_baud <= '0';
		if reset = '0' then
			clk_count := 0;
		elsif rising_edge(clk) then
			clk_count := clk_count + 1;
		else
			null;
		end if;
		if clk_count >= 434 then
			clk_baud <= '1';
			clk_count := 0;
		else
			clk_baud <= '0';
		end if;
end process po;
end Gen115200