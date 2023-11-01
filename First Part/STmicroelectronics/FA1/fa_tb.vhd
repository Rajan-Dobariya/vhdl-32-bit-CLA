library ieee; use ieee.std_logic_1164.all;

entity fa_tb is
end;

architecture tb of fa_tb is
component fa is
	port ( A0, B0, CI: in std_logic;
			S0, CO :  out std_logic
			);
end component;

	signal A: std_logic := '0';
	signal B: std_logic := '0';
	signal Cin: std_logic := '0';
	signal Sum: std_logic;
	signal Cout: std_logic;
	begin
	uut : fa 
		port map (A0 => A, B0 => B, CI => Cin, S0 => Sum, CO => Cout);
		A <= not A after 2 ns;
		B <= not B after 4 ns;
		Cin <= not Cin after 6 ns;
		
		timeBomb : process
		begin
			wait for 30 ns;
			assert false
				report "Simulation ended by Dobariya at " & time'image(now)
				severity failure;
		end process;
end architecture tb;
