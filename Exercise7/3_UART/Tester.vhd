----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Tester is
	port (	CLOCK_50	: in std_logic;
				KEY		: in std_logic_vector(3 downto 0);
				--SW			: in std_logic_vector(7 downto 0);
				LEDR		: out std_logic_vector(7 downto 0);
				GPIO_0	: in std_logic_vector(0 downto 0)
				--GPIO_1	: out std_logic_vector(0 downto 0)
	);
end Tester;

architecture test of Tester is
signal clk_115200, rxvalid	: std_logic;
signal indata					: std_logic_vector(7 downto 0);
begin
gen	: entity work.BaudRateGenerator		port map (clk => CLOCK_50, reset => KEY(0), clk_baud => clk_115200);
rec	: entity work.Receiver					port map (rxd => GPIO_0(0), reset => KEY(0), clk_baud => clk_115200, rxdata => indata, rxvalid => rxvalid);
--tran	: entity work.Transmitter				port map (txdata => SW, reset => KEY(0), txvalid => KEY(3), clk_baud => clk_115200, txd => GPIO_1(0));
process(rxvalid)
begin
	if rxvalid = '1' then
		LEDR <= indata;
	else	LEDR <= "00000000";
	end if;
end process;

end test;