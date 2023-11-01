library ieee; use ieee.std_logic_1164.all;

entity MX4_tb is
end;

architecture tb of MX4_tb is
component MX4 is
	port ( A, B, C, D : in std_logic;
			S0, S1 : in std_logic;
		   Y: out std_logic
		   );
end component;

	signal A: std_logic := '0';
	signal B: std_logic := '1';
	signal C: std_logic := '0';
	signal D: std_logic := '1';
	signal S0: std_logic := '0';
	signal S1: std_logic := '0';
	signal Y: std_logic;
	begin
	uut : MX4 
		port map (A , B ,C, D, S0, S1, Y);
		--A <= not A after 2 ns;
		S0 <= not S0 after 2 ns;
		s1 <= not S1 after 4 ns;
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
