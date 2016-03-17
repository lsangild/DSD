-----LIBRARIES-----
library ieee;
use ieee.std_logic_1164.all;

-----ENTITY-----
entity Demultiplexer is
	port(	data_in					: in std_logic_vector(20 downto 0);
			disp0, disp1, disp2	: out std_logic_vector(6 downto 0)
			);
end Demultiplexer;

-----Architecture-----
architecture demuxer of Demultiplexer is
begin
disp0 <= data_in(20 downto 14);
disp1 <= data_in(13 downto 7);
disp2 <= data_in(6 downto 0);
end demuxer;