library ieee; use ieee.std_logic_1164.all;

entity And4 is
	generic (delay : time := 151 ps);
	port ( A, B, C, D: in std_logic;
			Y: out std_logic
			);
end entity;

architecture dataflow of and4 is 
begin 
	Y <= A and B and C and D after delay ;
end dataflow;
