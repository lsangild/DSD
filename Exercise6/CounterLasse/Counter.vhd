----- Libraries------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----- Entity ------
entity Counter is
	port( clk, reset : in std_logic;
			mode       : in std_logic_vector(1 downto 0);
			count      : out std_logic_vector(3 downto 0);
			cout       : out std_logic
	);
end Counter;

-----Architecture-----
architecture multi_counter of Counter is
begin
po: process(clk, reset)
variable num : unsigned(3 downto 0);
variable shift : std_logic;
begin
--	num := "0000";
--	shift := '0';
	if (reset = '0') then
		num := "0000";
		shift := '0';
	elsif (rising_edge(clk)) then
		case mode is
		  when "00" =>
			-- count from 0-9
			if num <= "1001" then
				num := num + "0001";
				shift := '0';
			else
				num := "0000";
				shift := '1';
			end if;			
		  when "01" =>
			-- count from 0-5
			if num <= "0101" then
				num := num + "0001";
				shift := '0';
			else
				num := "0000";
				shift := '1';
			end if;
						
		  when others =>
			-- count from 0-2
			if num <= "0010" then
				num := num + "0001";
				shift := '0';
			else
				num := "0000";
				shift := '1';
			end if;			
		end case;
	else
		NULL;
--	elsif mode = "00" and rising_edge(clk) and num <= "1001" then
--		num := num + "0001";
--		shift := '0';
--	elsif mode = "00" and rising_edge(clk) and num > "1001" then
--		num := "0000";
--		shift := '1';
--	elsif mode = "01" and rising_edge(clk) and num <= "0101" then
--		num := num + "0001";
--		shift := '0';
--	elsif mode = "01" and rising_edge(clk) and num > "0101" then
--		num := "0000";
--		shift := '1';
--	elsif rising_edge(clk) and num <= "0010" then
--		num := num + "0001";
--		shift := '0';
--	elsif rising_edge(clk) and num > "0010" then
--		num := "0000";
--		shift := '1';
--	else
--		null;
	end if;
	count <= std_logic_vector(num);
	cout <= shift;
end process po;
end multi_counter;