----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;

-- instance of mygates used as entity
entity my_gates_ent	is
	port(	signal a,b						: in std_logic;
			signal xor_out, and_out, or_out : out std_logic
	);
end entity;


architecture gates of my_gates_ent is
-- the function
function function_xor(signal a,b : in std_logic) return std_logic is
begin
	return a xor b;
end function;

-- the procedure
procedure procedure_and_or(a,b  : in std_logic;
							signal and_out, or_out : out std_logic
							) is
begin
	and_out <= a and b;
	or_out <= a or b;
end procedure;
--begin the real program
begin
	xor_out <= function_xor(a,b);
	procedure_and_or(a,b,and_out,or_out);
end architecture;
