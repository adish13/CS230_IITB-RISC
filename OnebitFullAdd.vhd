library ieee;
use ieee.std_logic_1164.all;

entity OnebitFullAdd is
	port ( 
		a, b, cin: in std_logic;
		sum, cout: out std_logic
	);
end entity;

architecture full_add_arch of OnebitFullAdd is
	component half_adder is 
		port (
			a, b: in std_logic;
			sum, carry: out std_logic
		);
	end component;
	
	component or_gate is 
		port (
			a, b: in std_logic;
			c: out std_logic
		);
	end component;
	
	signal inter_sum, carry1, carry2: std_logic;
begin
	HA1: half_adder 
		port map (a=>a, b=>b, sum=>inter_sum, carry=>carry1);
		
	HA2: half_adder 
		port map (a=>inter_sum, b=>cin, sum=>sum, carry=>carry2);
	
	OR1: or_gate 
		port map (a=>carry1, b=>carry2, c=>cout);
end architecture;