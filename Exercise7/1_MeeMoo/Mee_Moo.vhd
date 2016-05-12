----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;


entity Mee_Moo is
	port(	inp:			in std_logic_vector(1 downto 0);
			reset:		in std_logic;
			clk:			in std_logic;
			moo_out:		out std_logic;
			mea_out:		out std_logic
			);
end Mee_Moo;

architecture TPT of Mee_Moo is
type state is (idle, init, active);
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

nxt_state: process(present_state, inp)
begin
	next_state <= present_state;
	case present_state is
		when idle =>
			if inp(1) = '1' then
				next_state <= init;
			end if;
		when init =>
			if inp = "01" then
				next_state <= active;
			elsif inp = "00" then
				next_state <= idle;
			end if;
		when active =>
			next_state <= idle;
		when others =>
			next_state <= idle;
	end case;
end process;

moo_outputs: process(present_state)
begin
	case present_state is
		when active | init =>
			moo_out <= '1';
		when idle =>
			moo_out <= '0';
	end case;
end process;

mea_outputs: process(present_state, inp)
begin
case present_state is
	when idle =>
		mea_out <= '0';
	when init =>
		if inp = "11" then
			mea_out <= '1';
		else
			mea_out <= '0';
		end if;
	when others =>
		mea_out <= '0';
	end case;
end process;

end TPT;