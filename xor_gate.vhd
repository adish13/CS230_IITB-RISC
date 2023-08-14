library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is 
	port (
		a, b: in std_logic;
		c: out std_logic
	);
end entity;

architecture xor_arch of xor_gate is 
	signal na, nb, x, y: std_logic;
	component and_gate is 
		port (
			a, b: in std_logic;
			c: out std_logic
		);
	end component;
	
	component or_gate is 
		port (
			a, b: in std_logic;
			c: out std_logic
		);
	end component;
	
	component not_gate is 
		port (
			a: in std_logic;
			b: out std_logic
		);
	end component;
begin 
	NOT1: not_gate 
		port map(a=>a, b=>na);
	NOT2: not_gate 
		port map(a=>b, b=>nb);
	AND1: and_gate 
		port map(a=>na, b=>b, c=>x);
	AND2: and_gate
		port map(a=>a, b=>nb, c=>y);
	OR1: or_gate
		port map(a=>x, b=>y, c=>c);
end architecture;