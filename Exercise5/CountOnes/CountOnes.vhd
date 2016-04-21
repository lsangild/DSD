-----Libraries-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

-----Entities-----
entity CountOnes is
	port( A    : in std_logic_vector(7 downto 0);
			ones : out std_logic_vector(3 downto 0)
	);
end CountOnes;

-----Architectures-----
architecture Counter of CountOnes is
begin
po: process(A)
	variable count : std_logic_vector(3 downto 0) := "0000";
	begin
	for index in 7 downto 0 loop
		count := unsigned(count) + unsigned(A(index));
	end loop;
	ones <= count;
end process;
end Counter;