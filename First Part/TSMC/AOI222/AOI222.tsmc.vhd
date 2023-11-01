library ieee; use ieee.std_logic_1164.all;
entity aoi222 is
 generic(delay: time:= 112 ps);
 port
  ( A0,A1,B0,B1,C0,C1: in std_logic;
   Y: out std_logic
  );
end entity;

architecture dataflow of aoi222 is 
begin
 Y <= not( (A0 and A1) or (B0 and B1) or (C0 and C1) )after delay;
end dataflow;