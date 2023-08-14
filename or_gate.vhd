library ieee;
use ieee.std_logic_1164.all;

entity or_gate is 
	port(
		a, b: in std_logic;
		c: out std_logic
	);
end entity;

architecture or_arch of or_gate is
begin
	c <= a or b;
end architecture;