-------------- Library statements -------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration half_adder--
entity half_adder is
	port (a, b : in std_logic;
			sumD, carryD, sumB, carryB, sumS, carryS  : out std_logic
			);
end half_adder;

-------------- Library statements and_2 ------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration and_2--
entity and_2 is
	port(a, b : in std_logic;
			carryS : out std_logic);
end and_2;
-- architecture declaration and_2--
architecture andX of and_2 is
begin
	carryS <= a and b;
end andX;

------------- Library statements xor_2 -------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration xor_2--
entity xor_2 is
	port(a, b : in std_logic;
			sum : out std_logic);
end xor_2;
-- architecture xorX --
architecture xorX of xor_2 is
begin
	sum <= a xor b;
end xorX;
