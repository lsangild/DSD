-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;

-----Entities-----
entity OinputNAND is
	port( a : in std_logic_vector(7 downto 0);
			y : out std_logic
	);
end oinputNAND;

-----Architectures-----
architecture oNAND of OinputNAND is
begin
po: process(a)
	variable equal : std_logic;
	begin
	equal:= '1';
	for index in 7 downto 0 loop
		equal := equal and a(index);
	end loop;
	y <= NOT equal;
end process;
end oNAND;