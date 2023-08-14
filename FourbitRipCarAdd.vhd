library ieee;
use ieee.std_logic_1164.all;

entity FourbitRipCarAdd is
	port ( 
		a, b : in std_logic_vector (3 downto 0);
		cin: in std_logic;
		sum : out std_logic_vector (3 downto 0);
		cout: out std_logic
	);
end entity;

architecture four_bit_adder_arch of FourbitRipCarAdd is 
	signal carry: std_logic_vector (2 downto 0);
	
	component OnebitFullAdd is 
		port (
			a, b, cin: in std_logic;
			sum, cout: out std_logic
		);
	end component;
begin 
	FULL0: OnebitFullAdd
		port map (a=>a(0), b=>b(0), cin=>cin, sum=>sum(0), cout=>carry(0));
		
	FULL1: OnebitFullAdd
		port map(a=>a(1), b=>b(1), cin=>carry(0), sum=>sum(1), cout=>carry(1));
	
	FULL2: OnebitFullAdd
		port map(a=>a(2), b=>b(2), cin=>carry(1), sum=>sum(2), cout=>carry(2));
		
	FULL3: OnebitFullAdd
		port map(a=>a(3), b=>b(3), cin=>carry(2), sum=>sum(3), cout=>cout);
end architecture;