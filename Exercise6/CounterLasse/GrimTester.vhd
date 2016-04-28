----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity GrimTester is
	port( KEY        : in std_logic_vector(1 downto 0);
			LEDR       : out std_logic_vector(3 downto 0);
			SW	        : in std_logic_vector(17 downto 16)
	);
end GrimTester;

-----Architecture-----
architecture multi_counter of GrimTester is
signal num : unsigned(3 downto 0) := "0000";
begin
po: process(KEY)
begin
	if KEY(1) = '0' then
		num <= "0000";
	elsif rising_edge(KEY(0)) then
		case SW is
			when "00" =>
				if num < "1001" then
					num <= num + "0001";
				else
					num <= "0000";
				end if;
			when "01" =>
				if num < "0101" then
					num <= num + "0001";
				else
					num <= "0000";
				end if;
			when others =>
				if num < "0010" then
					num <= num + "0001";
				else
					num <= "0000";
				end if;
		end case;
	else
	null;
	end if;
end process po;
LEDR <= std_logic_vector(num);
end multi_counter;