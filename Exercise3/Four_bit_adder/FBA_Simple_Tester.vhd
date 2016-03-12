----- Tester class -----

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity FBA_Simple_Tester is
	port( 
		 SW				: in std_logic_vector(16 downto 0);
		 LEDR 			: out std_logic_vector(5 downto 0)
	);
end FBA_Simple_Tester;

architecture test of FBA_Simple_Tester is
signal	sum_1, sum_2	: std_logic_vector(3 downto 0);
signal	c1, c2			: std_logic_vector(0 downto 0);
signal	c1_5b, c2_5b	:	std_logic_vector(4 downto 0);
constant	nul_4b			:	std_logic_vector(3 downto 0) := "0000";
begin
	--FA1: entity work.four_bit_adder_simple(unsigned_impl) port map(A(0)=>a(0), B(0)=>b(0), sum(0)=>sum(0));
	--FA2: entity work.four_bit_adder_simple(unsigned_impl) port map(A(1)=>a(1), B(1)=>b(1), sum(1)=>sum(1));
	--FA3: entity work.four_bit_adder_simple(unsigned_impl) port map(A(2)=>a(2), B(2)=>b(2), sum(2)=>sum(2));	
	--FA4: entity work.four_bit_adder_simple(unsigned_impl) port map(A(3)=>a(3), B(3)=>b(3), sum(3)=>sum(3));
	i1:  entity work.four_bit_adder_simple(unsigned_impl) 	port map(
																	cin => SW(0),
																	A => SW(4 downto 1), 
																	B => SW(8 downto 5), 
																	sum => sum_1,
																	cout => c1(0));
	i2:	entity work.four_bit_adder_simple(unsigned_impl)	port map(
																	cin => '0',
																	A => SW(12 downto 9),
																	B => SW(16 downto 13),
																	sum => sum_2,
																	cout => c2(0));
	-- Omregning af c1 til 5_bit som MSB
	c1_5b <= c1 & nul_4b;
	c2_5b <= c2 & nul_4b;
	-- 4 + 4 bit giver max 5 bit, 4 + 4 + 4 + 4 bit giver max 6 bit.
	LEDR(5 downto 0) <= std_logic_vector(resize(unsigned(sum_1),6) + resize(unsigned(sum_2),6) + resize(unsigned(c2_5b),6) + resize(unsigned(c1_5b),6));
end test;