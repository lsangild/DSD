------------------------ four bit adder --------------------------------------
-------------- Library statements -------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration four_bit_adder--
entity four_bit_adder is
	port (cin : in std_logic;
			A, B  : in std_logic_vector(3 downto 0);
			sum : out std_logic_vector(3 downto 0);
			cout : out std_logic;
			c1, c2, c3 : buffer std_logic
			);
end four_bit_adder;


architecture fba of four_bit_adder is
begin
fa1: entity work.full_adder port map(FAa=>A(0), FAb=>B(0), FAcin => cin, FAsum => sum(0), FAcout => c1);
fa2: entity work.full_adder port map(FAa=>A(1), FAb=>B(1), FAcin => c1, FAsum => sum(1), FAcout => c2);
fa3: entity work.full_adder port map(FAa=>A(2), FAb=>B(2), FAcin => c2, FAsum => sum(2), FAcout => c3);
fa4: entity work.full_adder port map(FAa=>A(3), FAb=>B(3), FAcin => c3, FAsum => sum(3), FAcout => cout);


end fba;