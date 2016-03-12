------------------ Behavioural_HA ---------------------
 -------------- Library statements -------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration half_adder--
entity half_adder_behavioural is
	port (a, b : in std_logic;
			sum, carry  : out std_logic
			);
end half_adder_behavioural;

-- architecture behavioural --
architecture behavioural of half_adder_behavioural is
begin
process(a,b)
begin
	if a = '1' then	
		if b = '1' then
			sum <= '0'; 
			carry <= '1';
		else
			sum <= '1'; 
			carry <= '0';
		end if;		
	else
		carry <= '0'; 
		sum <= b;
	end if;
end process;

end behavioural;

