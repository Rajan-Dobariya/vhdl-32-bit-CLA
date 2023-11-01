library ieee; use ieee.std_logic_1164.all;
entity ao31 is
 generic(delay: time:= 52 ps);
 port
  ( A,B,C,D: in std_logic;
   Z: out std_logic
  );
end entity;

architecture dataflow of ao31 is 
begin
 Z <=( (A and B and C) or D ) after delay;
end dataflow;
