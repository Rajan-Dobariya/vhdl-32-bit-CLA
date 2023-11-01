library ieee; use ieee.std_logic_1164.all;

entity DFFNR is
	generic (RN_delay : time := 225 ps; 	
			QN_delay : time := 326 ps; 		
			CKN_delay : time := 396 ps 		
			);
	port ( D, CKN, RN : in std_logic;
			Q, QN : out std_logic
		);
end entity;

architecture df of DFFNR is
begin
	process (CKN , RN)
	begin
		if(RN = '0') then
			Q <= '0' after RN_delay;
		elsif falling_edge(CKN) then
			Q <= D after CKN_delay;
		end if;
	end process;
	QN <= not Q after QN_delay;
end df;
