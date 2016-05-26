----- Libraries -----
library ieee;
use ieee.std_logic_1164.all;

entity Receiver is
	port (	rxd, reset, clk_baud	: in std_logic;
				rxdata					: out std_logic_vector(7 downto 0);
				rxvalid					: out std_logic
			);
end Receiver;

architecture Rec of Receiver is
type state is (idle, reading, stopping, latchData);
type state2 is (idle, cnt0, cnt1, cnt2, cnt3, cnt4, cnt5, cnt6, cnt7);
signal present_state, next_state : state;
signal cnt_present_state, cnt_next_state : state2;

begin

state_reg : process(clk_baud, reset)
begin
	if reset = '0' then
		present_state <= idle;
	elsif rising_edge(clk_baud) then
		present_state <= next_state;
	end if;
end process;

cnt_reg : process(clk_baud, reset)
begin
	if reset = '0' then
		cnt_present_state <= idle;
	elsif rising_edge(clk_baud) then
		cnt_present_state <= cnt_next_state;
	end if;
end process;

nxt_state : process(present_state, clk_baud)
begin
	next_state <= present_state;
	case present_state is
		when idle =>
			if rxd = '0' then
				next_state <= reading;
			end if;
		when reading =>
			if cnt_present_state = cnt7 then
				next_state <= stopping;
			else
				null;
			end if;
		when stopping =>
			if rxd = '1' then
				next_state <= latchData;
			else
				next_state <= idle;
			end if;
		when latchData =>
			next_state <= idle;
		when others =>
			next_state <= idle;
		end case;
end process;

cnt_nxt : process(present_state, clk_baud)
begin
cnt_next_state <= cnt_present_state;
if	present_state = reading then
	case cnt_present_state is
		when idle =>
			cnt_next_state <= cnt0;
		when cnt0 =>
			cnt_next_state <= cnt1;
		when cnt1 =>
			cnt_next_state <= cnt2;
		when cnt2 =>
			cnt_next_state <= cnt3;
		when cnt3 =>
			cnt_next_state <= cnt4;
		when cnt4 =>
			cnt_next_state <= cnt5;
		when cnt5 =>
			cnt_next_state <= cnt6;
		when cnt6 =>
			cnt_next_state <= cnt7;
		when cnt7 =>
			cnt_next_state <= idle;
		when others =>
		 cnt_next_state <= idle;
	end case;
	else
		null;
end if;
end process;

output : process(present_state)
begin
	case present_state is
		when latchData =>
			rxvalid <= '1';
		when others	=>
			rxvalid <= '0';
	end case;
end process;

cnt_output : process(cnt_present_state)
begin
if falling_edge(clk_baud) then
	case cnt_present_state is
		when cnt0 =>
			rxdata(0) <= rxd;
		when cnt1 =>
			rxdata(1) <= rxd;
		when cnt2 =>
			rxdata(2) <= rxd;
		when cnt3 =>
			rxdata(3) <= rxd;
		when cnt4 =>
			rxdata(4) <= rxd;
		when cnt5 =>
			rxdata(5) <= rxd;
		when cnt6 =>
			rxdata(6) <= rxd;
		when cnt7 =>
			rxdata(7) <= rxd;
		when others =>
			null;
	end case;
else
	null;
end if;
end process;

end Rec;