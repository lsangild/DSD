----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Code_Lock is
	port(	clk, reset, enter	:	in std_logic;
			code	:	in std_logic_vector(3 downto 0);
			lock	:	out std_logic;
			err	:	out std_logic_vector(1 downto 0)
			);
end Code_Lock;

architecture simple of Code_Lock is
type state is (idle, eval1, get2, eval2, unlocked, going_idle, wcode, permlock);
subtype state2 is std_logic_vector (1 downto 0);
signal present_state, next_state : state;
signal code_lock_present_state, code_lock_next_state : state2 := "00";
constant Err_0: state2 := "00";
constant Err_1: state2 := "01";
constant Err_2: state2 := "10";
constant Err_3: state2 := "11";

begin

state_reg: process(clk, reset)
begin
	if reset = '0' then
		present_state <= idle;
	elsif rising_edge(clk) then
		present_state <= next_state;
	end if;
end process;

lock_reg: process(clk, reset)
begin
	if reset = '0' then
		code_lock_present_state <= Err_0;
	elsif rising_edge(clk) then
		code_lock_present_state <= code_lock_next_state;
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
				next_state <= wcode;
			end if;
		when get2 =>
			if enter = '0' then
				next_state <= eval2;
			end if;
		when eval2 =>
			if (enter = '1' and code = "1110") then
				next_state <= unlocked;
			elsif (enter = '1' and code /= "1110") then
				next_state <= wcode;
			end if;
		when unlocked =>
			if enter = '0' then
				next_state <= going_idle;
			end if;
		when going_idle =>
			if enter = '1' then
				next_state <= idle;
			end if;
		when wcode =>
			if code_lock_next_state = Err_3 then
				next_state <= permlock;
			else
				next_state <= going_idle;
			end if;
		when permlock =>
			null;
		when others =>
			next_state <= idle;
	end case;
end process;

wrongcode: process(present_state)
begin
if present_state = wcode then
	case code_lock_present_state is
		when Err_0 =>
			code_lock_next_state <= Err_1;
		when Err_1 =>
			code_lock_next_state <= Err_2;
		when Err_2 =>
			code_lock_next_state <= Err_3;
		when Err_3 =>
			code_lock_next_state <= Err_0;
		when others =>
			code_lock_next_state <= Err_0;
	end case;
end if;
end process;

lock_out: process(code_lock_present_state)
begin
	err <= code_lock_present_state;
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