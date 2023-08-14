library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port (
		a, b: in std_logic;
		sum, carry: out std_logic
	);
end entity;

architecture half_adder_arch of half_adder is
	component xor_gate is
		port (
			a, b: in std_logic;
			c: out std_logic
		);
	end component;
	
	component and_gate is 
		port (
			a, b: in std_logic;
			c: out std_logic
		);
	end component;
begin 
	XOR1: xor_gate 
		port map (a=>a, b=>b, c=>sum);
	
	AND1: and_gate 
		port map (a=>a, b=>b, c=>carry);
end architecture;