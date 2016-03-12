-----------------------Implementation of a Full adder ---------------

-------------- Library statements -------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration full_adder--
entity full_adder is
	port (FAa, FAb, FAcin : in std_logic;
			FAsum, FAcout : out std_logic;
			FAc1, FAc2, s1 : buffer std_logic
			);
end full_adder;


architecture FA of full_adder is

begin
h1: entity work.half_adder_dataflow port map(a=>FAa,b=>FAb,sum=>s1,carry=>FAc1);
h2: entity work.half_adder_dataflow port map(a=>s1,b=>FAcin,sum=>FAsum,carry=>FAc2);
FAcout <= FAc1 or FAc2;
end FA;