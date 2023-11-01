library ieee; use ieee.std_logic_1164.all;
entity haoi22 is
 generic(delay: time:= 26 ps);
 port
  ( A,B,C,D: in std_logic;
   Z: out std_logic
  );
end entity;

architecture dataflow of haoi22 is 
begin
 Z <= not ((A and B) or (C and D))after delay;
end dataflow;
