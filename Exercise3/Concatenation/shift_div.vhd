----- LIBRARIES -----
LIBRARY ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity shift_div is
port (	SW						: in std_logic_vector(7 downto 0);
			LEDR					: out std_logic_vector(4 downto 0)
			);
end shift_div;

architecture shift of shift_div is
begin
--process(SW)
--	begin
--	if(SW(5) = '1')then		--Shift once to the left
--		LEDR(4 downto 0) <=	std_logic_vector(SW(3 downto 0) & '0');
--	elsif(SW(6) = '1')then	--Shift twice to the right
--		LEDR(4 downto 0) <=	std_logic_vector("00" & SW(4 downto 2));
--	elsif(SW(7) = '1')then	--Rotate thrice to the right
		LEDR(4 downto 0) <= SW(2) & SW(1) & SW(0) & SW(4) & SW(3);
--	else							--Show original input
--		LEDR(4 downto 0) <= SW(4 downto 0);
--	end if;
--end process;
end shift;