library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
	port (
		A, B: in std_logic_vector(15 downto 0);
		control: in std_logic_vector(1 downto 0);
		ALU_out: out std_logic_vector(15 downto 0);
		carry, zero: out std_logic
	);
end entity;

architecture alu_arch of ALU is 
	component adder is 
		port (
			a, b: in std_logic_vector(15 downto 0);
			cin: in std_logic;
			c: out std_logic_vector(15 downto 0);
			cout: out std_logic
		);
	end component;
--	signal carry: std_logic;
	signal inverted_B, output_add, output_sub: std_logic_vector(15 downto 0);
	signal output_temp: std_logic_vector(15 downto 0);
	signal carry_temp_add, carry_temp_sub: std_logic;
begin 
	
	inverted_B <= B xor "1111111111111111";
	
	TEMP_ADDER: adder 
	port map (
		a=>A, b=>B, cin=>'0', c=>output_add, cout=>carry_temp_add
	);
	
	TEMP_SUB: adder 
	port map (
		a=>A, b=>inverted_B, cin=>'1', c=>output_sub, cout=>carry_temp_sub
	);
	
	process (A, B, control) 
	begin 
		if (control = "00") then
			output_temp <= output_add;
			carry <= carry_temp_add;
		elsif (control = "10") then
			output_temp <= A nand B;
		else 
			output_temp <= output_sub;
			carry <= carry_temp_sub;
		end if;
	end process;
	
	zero <= '1' when (to_integer(unsigned(output_temp)) = 0) else '0';
	
	ALU_out <= output_temp;
end architecture;