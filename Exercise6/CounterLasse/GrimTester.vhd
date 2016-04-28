----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity GrimTester is
	port( clk, reset        : in std_logic;
			count       : out std_logic_vector(3 downto 0);
			cout		  : out std_logic_vector(0 downto 0);
			mode	        : in std_logic_vector(17 downto 16)
	);
end GrimTester;

-----Architecture-----
architecture multi_counter of GrimTester is
signal num : unsigned(3 downto 0) := "0000";
begin
po: process(clk, reset)
begin
	if reset = '0' then
		num <= "0000";
		cout <= "0";
	elsif rising_edge(clk) then
		case mode is
			when "00" =>
				if num < "1001" then
					num <= num + "0001";
					cout <= "0";
				else
					num <= "0000";
					cout <= "1";
				end if;
			when "01" =>
				if num < "0101" then
					num <= num + "0001";
					cout <= "0";
				else
					num <= "0000";
					cout <= "1";
				end if;
			when others =>
				if num < "0010" then
					num <= num + "0001";
					cout <= "0";
				else
					num <= "0000";
					cout <= "1";
				end if;
		end case;
	else
	null;
	end if;
end process po;
count <= std_logic_vector(num);
end multi_counter;