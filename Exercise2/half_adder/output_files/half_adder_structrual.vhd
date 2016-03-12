----------------- half_adder_structrual -----------------------
 -------------- Library statements -------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration half_adder--
entity half_adder_structrual is
	port (A, B : in std_logic;
			SUM, CARRY  : out std_logic
			);
end half_adder_structrual;

-- architecture structrual --
architecture structrual of half_adder_structrual is
begin
u1: entity work.and_2 port map(a=>A ,b=>B, carryS=>CARRY);
u2: entity work.xor_2 port map(a=>A, b=>B, sum=>SUM);
end structrual;