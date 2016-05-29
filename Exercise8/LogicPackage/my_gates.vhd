----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;
package my_gates is
 function function_xor(signal a,b : in std_logic) return std_logic;	--declration
 procedure procedure_and_or(signal a,b : in std_logic; 
							signal and_out, or_out : out std_logic);
end my_gates;


package body my_gates is
function function_xor(signal a,b : in std_logic) return std_logic is
  -- Declarative items (constants, variables, etc.)
begin
  -- Function body.
  return a xor b;
end function;
procedure procedure_and_or(a,b  : in std_logic;
							signal and_out, or_out : out std_logic
							) is
  -- Declarative items (constants, variables, etc.)
begin
  -- Procedure body.
  and_out <= a and b;
  or_out <= a or b;
end procedure;
end my_gates;






















