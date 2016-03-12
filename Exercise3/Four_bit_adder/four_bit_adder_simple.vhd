----- Simple implementation of a four_bit_adder -----

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity four_bit_adder_simple is
	port(A,B 		: in std_logic_vector(3 downto 0);
		  sum			: out std_logic_vector(3 downto 0);
		  cout		: out std_logic;
		  cin 		: in std_logic);
end four_bit_adder_simple;

architecture unsigned_impl of four_bit_adder_simple is
-- create 5 bit signals to ensure correct addition --
signal sum_5b, cin_5b 	: std_logic_vector(4 downto 0); -- initialized to left most value hence both signals are 00000
constant sum_4b			: std_logic_vector(3 downto 0) := "0000";
begin
	cin_5b <= sum_4b & cin;
	sum_5b <= std_logic_vector(resize(unsigned(A),5) + resize(unsigned(B),5) + unsigned(cin_5b));
	sum <= sum_5b(3 downto 0);
	cout <= sum_5b(4);
end unsigned_impl;

architecture signed_impl of four_bit_adder_simple is
-- create 5 bit signals to ensure correct addition --
signal sum_5b, cin_5b 	: std_logic_vector(4 downto 0); -- initialized to left most value hence both signals are 00000
constant sum_4b			: std_logic_vector(3 downto 0) := "0000";
begin
	cin_5b <= sum_4b & cin;
	sum_5b <= std_logic_vector(resize(signed(A),5) + resize(signed(B),5) + signed(cin_5b));
	sum <= sum_5b(3 downto 0);
	cout <= sum_5b(4);
end signed_impl;