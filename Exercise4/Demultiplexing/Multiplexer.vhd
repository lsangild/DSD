-----LIBRARIES-----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----ENTITY-----
entity Multiplexer is
	port( data		: out std_logic_vector(20 downto 0);
			bin_in	: in std_logic_vector(11 downto 0);
			ab			: in std_logic_vector(1 downto 0)
	);
end Multiplexer;

-----ARCHITECTURE-----
architecture Mu_test of Multiplexer is
--signal data : std_logic_vector(11 downto 0) := "000000000000";
constant sig_On		: std_logic_vector(20 downto 0) := "111111101010111000000";
constant sig_Err		: std_logic_vector(20 downto 0) := "010111101011110000110";
signal	sig_val		: std_logic_vector(20 downto 0) := "111111111111111111111";
signal	sig_temp		: std_logic_vector(20 downto 0) := "111111111111111111111";
begin
sig_temp <= std_logic_vector(TO_UNSIGNED(sig_val(6 downto 0)) + 16 * TO_UNSIGNED(sig_val(13 downto 7)) + 256 * TO_UNSIGNED(sig_val(20 downto 14)));
val_1	:	entity work.bin2sevenseg port map(bin => bin_in(3 downto 0), seg => sig_temp(20 downto 14));
val_2	:	entity work.bin2sevenseg port map(bin => bin_in(7 downto 4), seg => sig_temp(13 downto 7));
val_3	:	entity work.bin2sevenseg port map(bin => bin_in(11 downto 8), seg => sig_temp(6 downto 0));
data <=	sig_On	when ab = "11" else	-- When no keys pushed show "On " ("11")
			sig_Err	when ab = "01" else	-- When Key1 is pushed show "Err" ("01")
			sig_val	when ab = "10";		-- When Key0 is pushed show value of SW(11 downto 0) ("10")
end Mu_test;