library ieee; use ieee.std_logic_1164.all;

entity DLatch is
    Port ( RN : in  STD_LOGIC;
           D  : in  STD_LOGIC;
           G : in STD_LOGIC;
           Q  : out STD_LOGIC);
     --constant DQDelay : time := 684 ps;
 	 constant GQdelay : time := 775 ps;
     constant RNDelay : time := 613 ps;
end DLatch;

architecture dataFlow of DLatch is
begin

process (RN, D, G)
begin
    if (RN = '0') then
        Q <= '0' after RNDelay;
    elsif (G = '1') then
    	Q <= D after GQDelay;
    end if;
end process;

end dataFlow;
