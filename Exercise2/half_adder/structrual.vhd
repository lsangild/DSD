----------------- structrual_HA -----------------------
 -------------- Library statements -------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration half_adder--
entity structural is
	port (a, b : in std_logic;
			sum, carry  : out std_logic
			);
end structural;

-- architecture structrual --
architecture struct of structural is
begin
u1: entity work.and_2 port map(a ,b , carry);
u2: entity work.xor_2 port map(a, b, sum);
end struct;