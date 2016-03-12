-- Library statements --
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration --
entity half_adder is
	port (a, b : in std_logic;
			sum, carry_out : out std_logic
			);
end dataflow_half_adder;

-- Architecture --
architecture dataflow of half_adder is
begin
		sum <= a xor b; 
		carry_out <= a and b;
end dataflow;