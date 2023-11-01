library ieee; use ieee.std_logic_1164.all;


entity fa is
	generic (S0_delay : time := 90 ps; -- 0.54/6 = 0.09
				CO_delay: time := 65 ps ); -- 0.385/6 = 0.064166ns
	port ( A0, B0, CI: in std_logic;
			S0, CO :  out std_logic
			);
end entity;

architecture dataflow of fa is 
begin 
	S0 <= A0 xor B0 xor CI after S0_delay ;
	CO <= (A0 and B0) or (A0 and CI) or (B0 and CI) after CO_delay;
end dataflow;
