library ieee;
use ieee.std_logic_1164.all;

entity adder is 
	port (
		a, b: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		c: out std_logic_vector(15 downto 0);
		cout: out std_logic
	);
end entity;

architecture adder_arch of adder is 
	component FourbitRipCarAdd is 
		port ( 
			a, b : in std_logic_vector (3 downto 0);
			cin: in std_logic;
			sum : out std_logic_vector (3 downto 0);
			cout: out std_logic
		);
	end component;
	
	signal carry: std_logic_vector(2 downto 0);
begin 
	Three_to_Zero: FourbitRipCarAdd
	port map (
		a=>a(3 downto 0), b=>b(3 downto 0), cin=>cin, sum=>c(3 downto 0), cout=>carry(0)
	);
	
	Seven_to_Four: FourbitRipCarAdd
	port map (
		a=>a(7 downto 4), b=>b(7 downto 4), cin=>carry(0), sum=>c(7 downto 4), cout=>carry(1)
	);
	
	Eleven_to_Eight: FourbitRipCarAdd
	port map(
		a=>a(11 downto 8), b=>b(11 downto 8), cin=>carry(1), sum=>c(11 downto 8), cout=>carry(2)
	);
	
	Fifteen_to_Twelve: FourbitRipCarAdd
	port map (
		a=>a(15 downto 12), b=>b(15 downto 12), cin=>carry(2), sum=>c(15 downto 12), cout=>cout
	);
end architecture;