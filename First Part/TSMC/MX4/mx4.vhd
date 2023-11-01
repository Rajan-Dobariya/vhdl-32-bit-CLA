library ieee; use ieee.std_logic_1164.all;

-- delay = (2.6697/12 = 0.222475ns = 222.475 ps = 223ps)
entity MX4 is
	generic (delay : time := 223 ps);
	port ( A, B, C, D : in std_logic;
			S0, S1 : in std_logic;
			Y: out std_logic
			);
end entity;

architecture dataflow of MX4 is 
	signal s : std_logic_vector (1 downto 0);
begin 
	s <= S1 & S0;
	Y <= A after delay when s = "00" else
	     B after delay when s = "01"else
	     C after delay when s = "10" else
	     D after delay;
end dataflow;
