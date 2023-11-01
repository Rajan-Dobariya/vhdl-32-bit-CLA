library ieee; use ieee.std_logic_1164.all;

entity DLatch_tb is
end;

architecture tb of DLatch_tb is 
component DLatch is
 port (D, RN, G: in std_logic; 
 Q : out std_logic
 );
end component;
	 signal D : std_logic := '0';
	 signal RN : std_logic := '0';
	 signal G : std_logic := '0';
	 signal Q : std_logic; 
	 constant period: time := 4 ns;
begin 
uut: DLatch
	port map( D => D, RN => RN, G => G, Q => Q);
	
	G <= not G after period/2;
	RN <= '1', '0' after 2 ns, '1' after 6 ns ;
	D <= '0', '1' after 4 ns, '0' after 8 ns, '1' after 12 ns, '0' after 16 ns;

timeBomb: process
	begin
	wait for 40 ns;
	assert false 
	report "Simulation ended by Dobariya at "& time 'image (now)
	severity failure;
end process;
end tb;
