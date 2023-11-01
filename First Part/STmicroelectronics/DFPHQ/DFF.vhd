library ieee; use ieee.std_logic_1164.all; 

entity DFFR is
	port
 	(D, CK, E: in std_logic; 
 	Q : out std_logic
 	);
	constant delay: time:= 742 ps; 
end entity;

architecture dataFlow of DFFR is
begin
process (CK, E) begin
	if (E = '0') then 
	Q <= '0';
	elsif rising_edge (CK) then
    Q <= D after delay;
    end if;
    end process;

end dataFlow;
