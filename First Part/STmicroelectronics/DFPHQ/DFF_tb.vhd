library ieee; use ieee.std_logic_1164.all;

entity DFFR_tb is
end;

architecture tb of DFFR_tb is 
component DFFR is
 port (D, CK, E: in std_logic; 
 Q : out std_logic
 );
end component;
	 signal D : std_logic := '0';
	 signal CK : std_logic := '0';
	 signal Q : std_logic; 
	 signal E : std_logic := '0';
	 constant period: time := 4 ns;
begin 
uut: DFFR
	port map( D => D, CK => CK, E => E, Q => Q);
	
	CK <= not CK after period/2;
	E <= '0', '1' after 4 ns;
	D <= '0', '1' after 4 ns, '0' after 8 ns, '1' after 12 ns, '0' after 16 ns;

timeBomb: process
	begin
	wait for 40 ns;
	assert false 
	report "Simulation ended by Dobariya at "& time 'image (now)
	severity failure;
end process;
end tb;
