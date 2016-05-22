----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;

entity Transmitter is
	port (	reset, txvalid, clk_baud	: in std_logic;
				txdata							: in std_logic_vector(7 downto 0);
				txd								: out std_logic
				);
end Transmitter;

architecture send of Transmitter is
type state is (idle, sending, stopping);
type state2 is (idle, send0, send1, send2, send3, send4, send5,send6, send7);
signal present_state, next_state : state;
signal send_present_state, send_next_state : state2;

begin

state_reg : process(clk_baud, reset)
begin
		if reset = '0' then
			present_state <= idle;
		elsif rising_edge(clk_baud) then
			present_state <= next_state;
		end if;
end process;

send_reg : process(clk_baud, reset)
begin
		if reset = '0' then
			send_present_state <= idle;
		elsif rising_edge(clk_baud) then
			send_present_state <= send_next_state;
		end if;
end process;

nxt_state : process(present_state, clk_baud)
begin
	next_state <= present_state;
	case present_state is
		when idle =>
			if txvalid = '0' then
				next_state <= sending;
			end if;
		when sending =>
			if send_present_state = send7 then
				next_state <= stopping;

			end if;
		when stopping =>
			next_state <= idle;
		when others =>
			next_state <= idle;
		end case;
end process;

send_nxt_state : process(present_state, clk_baud)
begin
	send_next_state <= send_present_state;
	if present_state = sending then
		case send_present_state is
			when send0 =>
				send_next_state <= send1;
			when send1 =>
				send_next_state <= send2;
			when send2 =>
				send_next_state <= send3;
			when send3 =>
				send_next_state <= send4;
			when send4 =>
				send_next_state <= send5;
			when send5 =>
				send_next_state <= send6;
			when send6 =>
				send_next_state <= send7;
			when send7 =>
				send_next_state <= send0;
			when others =>
				send_next_state <= send0;
		end case;
	end if;
end process;

send_output : process(present_state, send_present_state)
begin
	if present_state = sending then
		case send_present_state is
			when send0 =>
				txd <= txdata(0);
			when send1 =>
				txd <= txdata(1);
			when send2 =>
				txd <= txdata(2);
			when send3 =>
				txd <= txdata(3);
			when send4 =>
				txd <= txdata(4);
			when send5 =>
				txd <= txdata(5);
			when send6 =>
				txd <= txdata(6);
			when send7 =>
				txd <= txdata(7);
			when others =>
				txd <= '1';
		end case;
	else
		txd <= '1';
	end if;
end process;

end send;