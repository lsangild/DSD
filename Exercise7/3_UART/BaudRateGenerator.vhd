----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BaudRateGenerator is
	port (	clk, reset	: in std_logic;
				clk_baud		: out std_logic
				);
end BaudRateGenerator;

architecture Gen115200 of BaudRateGenerator is
begin

process(clk, reset)
variable clk_count : integer;
begin
--clk_baud <= '0';
	if reset = '0' then
		clk_count := 0;
	elsif rising_edge(clk) then
		clk_count := clk_count + 1;
	else
		null;
	end if;
	-- if clk_count rem 434 = 0 then -- Possible horrible way to implement this. What happens when the clk_count register is full?
	case clk_count is
		when 433 =>
			clk_baud <= '1';
		when 434 =>
			clk_count := 0;
		when others =>
		clk_baud <= '0';
	end case;
end process;

end Gen115200;