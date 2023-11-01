library ieee; use ieee.std_logic_1164.all;
use std.textio.all;

entity bin_to_gray_tb is
	generic (period: time := 100 ns;
			tp: time := 15 ns);
end entity;

architecture testbench of bin_to_gray_tb is

component bin_to_gray is
	port ( bin : in std_logic_vector(2 downto 0);
			gray: out std_logic_vector (2 downto 0)
		   );
end component;

signal b: std_logic_vector (2 downto 0);
signal g, gtest: std_logic_vector (2 downto 0);
file f: text open read_mode is "template.txt";

begin 
	dut : bin_to_gray port map (bin => b, gray => g);
	
	process
		variable l: line;
		variable good_value: boolean;
		variable space: character;
		variable bfile, gfile: bit_vector(2 downto 0);
	begin
		while not endfile (f) loop
			readline (f, l);
			read (l, bfile, good_value);
			assert (good_value);
				report "Improper value for 'bin' in file!"
				severity failure;
			b <= to_stdlogicvector(bfile);
			read (l, space);
			read (l, gfile, good_value);
			report "Improper value for 'gray' in file!"
			severity failure;
			gtest <= to_stdlogicvector(gfile);
			wait for tp;
			assert (gtest = g)
				report "Data mismatch!"
				severity failure;
				wait for period-tp;
			end loop;
			assert false
				report "No error found!"
				severity note;
			wait;
	end process;
end architecture;
