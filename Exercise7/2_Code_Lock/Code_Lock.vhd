----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;


entity Code_Lock is
	port(	clk	:	in std_logic;
			reset	:	in std_logic;
			code	:	in std_logic_vector(3 downto 0);
			enter	:	in std_logic;
			lock	:	out std_logic
			);
end Code_Lock;

architecture simple of Code_Lock is
type state is (idle, eval1, get2, eval2, unlocked, going_idle);
signal present_state, next_state : state;
begin

state_reg: process(clk, reset)
begin
	if reset = '0' then
		present_state <= idle;
	elsif rising_edge(clk) then
		present_state <= next_state;
	end if;
end process;

nxt_state: process(present_state, enter)
begin
	next_state <= present_state;
	case present_state is
		when idle =>
			if enter = '0' then
				next_state <= eval1;
			end if;
		when eval1 =>
			if (enter = '1' and code = "1001") then
				next_state <= get2;
			elsif (enter = '1' and code /= "1001") then
				next_state <= idle;
			end if;
		when get2 =>
			if enter = '0' then
				next_state <= eval2;
			end if;
		when eval2 =>
			if (enter = '1' and code = "1110") then
				next_state <= unlocked;
			elsif (enter = '1' and code /= "1110") then
				next_state <= idle;
			end if;
		when unlocked =>
			if enter = '0' then
				next_state <= going_idle;
			end if;
		when going_idle =>
			if enter = '1' then
				next_state <= idle;
			end if;
		when others =>
			next_state <= idle;
	end case;
end process;

outputs: process(present_state)
begin
	case present_state is
		when unlocked =>
			lock <= '0';
		when others =>
			lock <= '1';
		end case;
end process;

end simple;