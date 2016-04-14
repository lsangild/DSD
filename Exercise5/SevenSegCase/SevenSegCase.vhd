-----LIBRARIES-----
library ieee;
use ieee.std_logic_1164.all;

-----ENTITY-----
entity SevenSegCase is
  port (
    -- Inputs, outputs, inouts go here...
	bin : in std_logic_vector(3 downto 0);
	seg : out std_logic_vector(6 downto 0)
  );
end entity;

-----Architecture-----

architecture Decode of SevenSegCase is
  -- declare signals, components here...
begin
  -- architecture body...
  process(bin)
  begin
  case(bin) is
	when "0000" => seg <= "1000000"; --0
	when "0001" => seg <= "0100100"; --1
	when "0010" => seg <= "0100100"; --2
	when "0011" => seg <= "0110000"; --3
	when "0100" => seg <= "0011001"; --4
	when "0101" => seg <= "0010010"; --5
	when "0110" => seg <= "0000010"; --6
	when "0111" => seg <= "1111000"; --7
	when "1000" => seg <= "0000000"; --8
	when "1001" => seg <= "0011000"; --9
	when "1010" => seg <= "0001000"; --A
	when "1011" => seg <= "0000011"; --b
	when "1100" => seg <= "1000110"; --C
	when "1101" => seg <= "0100001"; --d
	when "1110" => seg <= "0000110"; --E
	when "1111" => seg <= "0001110"; --F
	when others => seg <= "1111111";
	end case;
	end process;

end architecture;
