library ieee; use ieee.std_logic_1164.all;
entity aoi222_tb is 
end;

architecture tb of aoi222_tb is 
component aoi222
   port 
   ( A0,A1,B0,B1,C0,C1: in std_logic;
    Y: out std_logic
    );
end component;
  signal A0,A1,B0,B1,C0,C1: std_logic := '0';
  signal Y:std_logic;
begin 

dut :aoi222
   port map(A0=>A0,A1=>A1,B0=>B0,B1=>B1,C0=>C0,C1=>C1,Y=>Y);
   A0<= not A0 after 2 ns;
   A1<= not A1 after 4 ns;
   B0<= not B0 after 6 ns;
   B1<= not B1 after 8 ns;
   C0<= not C0 after 10 ns;
   C1<= not C1 after 12 ns;
   
timebomb: process
begin 
    wait for 90ns;
    assert false 
       report "Simulation ended by Dobariya at" & time'image(now)
       severity failure;
end process;
end tb; 