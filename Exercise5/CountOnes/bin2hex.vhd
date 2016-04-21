-----LIBRARIES-----
library ieee;
use ieee.std_logic_1164.all;

-----ENTITY-----
entity Binary_7_Segment is
	port (num : in std_logic_vector(3 downto 0);
			vis : out std_logic_vector(0 to 6)
	);
end Binary_7_Segment;
	
architecture Test of Binary_7_Segment is
begin
	with num select
	vis <=	"0000001" when "0000",  -- 0
				"1001111" when "0001",  -- 1
				"0010010" when "0010",  -- 2
				"0000110" when "0011",  -- 3
				"1001100" when "0100",  -- 4
				"0100100" when "0101",  -- 5
				"0100000" when "0110",  -- 6
				"0001111" when "0111",  -- 7
				"0000000" when "1000",  -- 8
				"0001100" when "1001",  -- 9
				"1111111" when others;
end Test;