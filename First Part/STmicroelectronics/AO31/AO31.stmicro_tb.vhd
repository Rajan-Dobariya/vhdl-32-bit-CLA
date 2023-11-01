library ieee; use ieee.std_logic_1164.all;
entity ao31_tb is 
end;

architecture tb of ao31_tb is 
component ao31
   port 
   ( A,B,C,D: in std_logic;
    Z: out std_logic
    );
end component;
  signal A,B,C,D: std_logic := '0';
  signal Z: std_logic;
begin 

uut :ao31
   port map(A=>A,B=>B,C=>C,D=>D,Z=>Z);
   A<= not A after 2 ns;
   B<= not B after 4 ns;
   C<= not C after 6 ns;
   D<= not D after 8 ns;
   
timebomb: process
begin 
    wait for 34ns;
    assert false 
       report "Simulation ended by Dobariya at" & time'image(now)
       severity failure;
end process;
end tb; 