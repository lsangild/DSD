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
signal present_state, next_state : state;

begin

state_reg : process(clk_baud, reset)
begin
		if reset = '0' then
			present_state <= idle;
		elsif rising_edge(clk_baud) then
			present_state <= next_state;
		end if;
end process;

nxt_state : process(present_state, clk_baud)
variable bit_cnt : integer;
begin
	next_state <= present_state;
	case present_state is
		when idle =>
			if rxd = '0' then
				next_state <= reading;
			end if;
		when reading =>
			if bit_cnt <= 7 then
				rxdata(bit_cnt) <= rxd;
				bit_cnt := bit_cnt + 1;
			else
				next_state <= stopping;
			end if;
		when stopping =>
			bit_cnt := 0;
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

output : process(present_state)
begin
	case present_state is
		when latchData =>
			rxvalid <= '1';
		when others	=>
			rxvalid <= '0';
	end case;
end process;

end Rec;