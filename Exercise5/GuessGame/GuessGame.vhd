-----Library statements -----
library ieee;
use ieee.std_logic_1164.all;

-----Entity declaration -----
entity GuessGame is
	port(
	inputs 	: in std_logic_vector(7 downto 0);
	set		: in std_logic; -- set predefined value
	show	: in std_logic; -- Show predefined value
	try		: in std_logic; -- Evaluate guess
	hex1	: out std_logic_vector(6 downto 0); -- 7seg ones
	hex10	: out std_logic_vector(6 downto 0)  -- 7seg tens
	);	
end GuessGame;


architecture guessing of GuessGame is
-- declare signals, components here...
signal setValue, dispValue : std_logic_vector(7 downto 0) := "00000000";
begin

ones: entity work.DecimalSeg port map(bin => dispValue(3 downto 0), seg => hex1);
tens: entity work.DecimalSeg port map(bin => dispValue(7 downto 4), seg => hex10);
-- architecture body...
process(show, set, try)
	begin
	if set = '0' then
		setValue <= inputs;
		dispValue <= setValue; -- to avoid inferred latch for dispValue
	elsif show = '0' then
		dispValue <= setValue;
	elsif try = '0' then
		if inputs < setValue then
			dispValue <= "10101011";
		  elsif inputs > setValue then
			dispValue <= "11001101";
		  else
			dispValue <= "11101110";
		end if;			
	else
		dispValue <= inputs;	
	end if;
end process;
end architecture;