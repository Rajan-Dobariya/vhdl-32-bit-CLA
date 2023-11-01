library ieee; use ieee.std_logic_1164.all;

entity And4_tb is
end;

architecture tb of And4_tb is
component And4 is
	port ( A, B, C, D: in std_logic;
		   Y: out std_logic
		   );
end component;

	signal A: std_logic := '0';
	signal B: std_logic := '0';
	signal C: std_logic := '0';
	signal D: std_logic := '0';
	signal Y: std_logic;
	begin
	uut : And4 
		port map (A => A, B => B,C => C, D => D, Y => Y);
		--A <= not A after 2 ns;
		A <= not A after 2 ns;
		B <= not B after 4 ns;
		C <= not C after 6 ns;
		D <= not D after 8 ns;
		timeBomb : process
		begin
			wait for 40 ns;
			assert false
				report "Simulation ended by Dobariya at " & time'image(now)
				severity failure;
		end process;
end architecture tb;
