library ieee; use ieee.std_logic_1164.all;

entity DFFNR_tb is
end;

architecture tb of DFFNR_tb is
component DFFNR is
	port ( D, CKN, RN : in std_logic;
			Q, QN : out std_logic
		);
end component;

	signal D : std_logic := '0';
	signal RN : std_logic := '1';
	signal Q, QN : std_logic;
	-- Clock synchronisation
	signal CKN : std_logic := '1';
	constant period : time := 6 ns;
	
begin 
uut : DFFNR
	port map (D, CKN, RN, Q, QN);
	
	CKN <= not CKN after period/2;
	RN <= '1' , '0' after 7 ns, '1' after 8 ns, '0' after 22 ns, '1' after 23 ns;
	D <= '0' , '1' after 5 ns,'0' after 11 ns, '1' after 19 ns, '0' after 25 ns, '1' after 34 ns;

	timeBomb : process
	begin
		wait for 40 ns;
		assert false
			report " Simulation ended by Dobariya at " & time 'image(now)
			severity failure;
	end process;
end tb;

