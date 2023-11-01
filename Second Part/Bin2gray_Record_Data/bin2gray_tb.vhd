library ieee; use ieee.std_logic_1164.all;
--use std_logic_textio.all;

entity bin_to_gray_tb is
	generic (period: time := 100 ns;
			tp: time := 15 ns);
end entity;

architecture tb of bin_to_gray_tb is

component bin_to_gray is
	port ( bin : in std_logic_vector(2 downto 0);
			gray: out std_logic_vector (2 downto 0)
		   );
end component;

signal b: std_logic_vector (2 downto 0);
signal g: std_logic_vector (2 downto 0);

type data_pair is record
	col1: std_logic_vector (2 downto 0);
	col2: std_logic_vector (2 downto 0);
end record;

type table is array(1 to 8) of data_pair;
constant templates : table := (("000", "111"), ("001","101") ,("010","010"), ("011","010"), ("100","100"), ("101","111"), ("110","101"),("111","100"));
begin
	dut : bin_to_gray port map (bin => b, gray => g);
	process begin
		for i in table 'range loop
			b <= templates(i).col1;
			wait for tp;
			assert (g = templates(i).col2);
				report "Mismatch at iteration = " & integer 'image(i)
				severity failure;
			wait for period - tp;
		end loop;
		assert FALSE
			report "No error found"
			severity note;
	end process;
end architecture;

