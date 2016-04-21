----- Libraries ------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


----- Entity ------
entity Counter is
	port(
			SW			: in std_logic_vector(17 downto 16);
			KEY0, KEY3	: in std_logic;
			LEDR		: out std_logic_vector(0 downto 0);
			HEX0		: out std_logic_vector(6 downto 0)
	);
end entity;

----- Architecture -----
architecture multi_counter of Counter is
  -- declare signals, components here...
  signal clk, reset, cout	: std_logic;
  signal mode				: unsigned(1 downto 0) := (others => '0');
  signal count				: unsigned(3 downto 0) := (others => '0');
begin
  -- architecture body...
  process(reset, clk)
  begin
	if(reset = '0') then		
	elsif (rising_edge(clk)) then
		case (mode) is 
		when "00" => 
		  -- count from 0-9
			if count < X"9" then
			  count <= count + "1";
			  cout <= "00";
			  else
			  count <= "0000";
			  cout <= "01";
			end if;
			
		when "01" =>
		  -- count from 0-5
			if count < X"5" then
			  count <= count + "1";
			  cout <= "00";
			  else
			  count <= "0000";
			  cout <= "01";
			end if;
		when others =>
		  -- count from 0-2
		  if count<2 then
			count <= count + "1";
			cout <= "00";
			else
			count <= "00";
			cout <= "01";
		  end if;		  
		end case;			
	end if;
  end process;
end architecture;