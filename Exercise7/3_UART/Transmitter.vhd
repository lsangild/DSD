----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;

entity Transmitter is
	port (	reset, txdata, txvalid, clk_baud	: in std_logic;
				txd										: out std_logic
				);
end Transmitter

architecture send of Transmitter is
type state is (idle, sending, stopping)
signal present_state, next_state : state;

begin

state_reg : process(clk_baud, reset)
begin
		if reset = '0' then
			present_state <= idle;
		elsif rising_edge(clk) then
			present_state <= next_state;
		end if;
end process;

nxt_state : process(present_state, clk_baud)
variable bit_cnt : int;
begin
	next_state <= present_state;
	case present_state is
		when idle =>
			bit_cnt <= 0;
			if txvalid = '0' then
				next_state <= sending;
			end if;
		when sending =>
			if bit_cnt < 7 then
				bit_cnt <= bit_cnt + 1;
			else
				next_state <= stopping;
			end if;
		when stopping =>
			txd = '1';
			next_state <= idle
		when others
			next_state <= idle;
		end case;
end process;

output : process(present_state)
	case present_state is
		when idle =>
			txd <= '1';
			if txvalid = '0' then
				txd <= '0';
			end if;
		when sending =>
			txd <= txdata(bit_cnt);
		when stopping
			txd <= '1';
	end case;
end process;

end Transmitter;