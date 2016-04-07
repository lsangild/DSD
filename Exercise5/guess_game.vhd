-----Library statements -----
library ieee;
use ieee.std_logic_1164.all;

-----Entity declaration -----
entity guess_game is
	port(
	inputs 	: in std_logic_vector(7 downto 0);
	set		: in std_logic; -- set predefined value
	show	: in std_logic; -- Show predefined value
	try		: in std_logic; -- Evaluate guess
	hex1	: in std_logic_vector(6 downto 0); -- 7seg ones
	hex10	: in std_logic_vector(6 downto 0); -- 7seg tens
	);
	
end guess_game;


architecture guessing of guess_game is
  -- declare signals, components here...
  signal inValue : unsigned(7 downto 0);
begin
  -- architecture body...
  process(show, set, try)
	begin
	if (set = 0) then
		inValue <= inputs;
	elsif (show = 0) then
		
	elsif (try = 0) then
	
	else
	
	
	end if;
	
  
  end process;
  
end architecture;
