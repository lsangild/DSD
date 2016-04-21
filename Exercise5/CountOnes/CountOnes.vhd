-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----Entities-----
entity CountOnes is
	port( A : in std_logic_vector(7 downto 0);
			ones : out std_logic_vector(3 downto 0)
	);
end CountOnes;

-----Architectures-----
architecture Counter of CountOnes is
begin
po: process(A)
	variable count : std_logic_vector(3 downto 0);
	begin
	count:= "0000";
	for index in 7 downto 0 loop
		count := std_logic_vector(unsigned(count) + resize(unsigned(A(index),4)));
	end loop;
	ones <= count;
end process;
end Counter;