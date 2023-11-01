library ieee; use ieee.std_logic_1164.all;
entity  JKFFS_tb is
end;

architecture tb of JKFFS_tb is 
component JKFFS is 
 port
 ( J, K, SN, CK: in std_logic;
   Q, QN: out std_logic
 );
end component;
  signal J : std_logic := '0';
  signal K : std_logic := '0';
  signal Q, QN : std_logic;
  signal SN : std_logic := '0';
  signal CK : std_logic := '0';
  constant period:time := 4 ns; 
begin
uut : JKFFS
  port map ( J => J, K => K,  SN => SN, CK => CK, Q => Q, QN => QN);
  
  CK <= not CK after period/2;
  SN <= '1', '0' after 6 ns, '1' after 10 ns;
  J <= not J after 2 ns;
  K <= not K after 4 ns;
  
  timebomb : process
  begin
  wait for 30 ns;
  assert false
  report " Simulation ended by Dobariya at " & time'image(now)
  severity failure;
 end process;
end tb;
  
  

