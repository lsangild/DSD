------------------ Dataflow_HA ------------------------
 -------------- Library statements -------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration half_adder_dataflow --
entity half_adder_dataflow is
	port (a, b : in std_logic;
			sum, carry  : out std_logic
			);
end half_adder_dataflow;


-- Architecture dataflow --
architecture dataflow of half_adder_dataflow is
begin
	sum <= a xor b;
	carry <= a and b;

end dataflow;