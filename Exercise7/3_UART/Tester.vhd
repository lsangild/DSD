----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;

entity Tester is
	port (	KEY		: in std_logic_vector(3 downto 0);
				SW			: in std_logic_vector(7 downto 0);
				LEDR		: out std_logic_vector(7 downto 0);
				GPIO_0	: in std_logic_vector(0 downto 0);
				GPIO_1	: out std_logic_vector(0 downto 0);
				CLOCK_50	: in std_logic
	);
end Tester;

architecture test of Tester is
signal clk_baud, rxvalid	: std_logic;
signal indata					: std_logic_vector(7 downto 0);
begin
gen	: entity work.BaudRateGenerator		port map (clk => CLOCK_50, reset => KEY(0), clk_baud => clk_baud);
rec	: entity work.Receiver					port map (rxd => GPIO_0(0), reset => KEY(0), clk_baud => clk_baud, rxdata => indata, rxvalid => rxvalid);
tran	: entity work.Transmitter				port map (txdata => SW, reset => KEY(0), txvalid => KEY(3), clk_baud => clk_baud, txd => GPIO_1(0));

end test;