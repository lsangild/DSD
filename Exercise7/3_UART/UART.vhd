----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;

entity UART is
	port (	rxd, reset, clk, txvalid	: in std_logic;
				txdata							: in std_logic_vector(7 downto 0);
				txd, rxdata						: out std_logic;
				rxdata							: out std_logic_vector(7 downto 0)
	);
end UART;

architecture U of UART is
begin

end U;