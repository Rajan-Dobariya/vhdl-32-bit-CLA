library ieee; use ieee.std_logic_1164.all;

entity bin_to_gray is
	generic (N: natural := 3 );
	port ( bin : in std_logic_vector(n-1 downto 0);
			gray: out std_logic_vector (n-1 downto 0)
			);
end entity;

architecture bin of bin_to_gray is
begin
	gray (N-1) <= bin(N-1);
	gen : for i in 1 to N-1 generate
		gray(N-1-i) <= bin(N-i) xor bin(N-1-i);
	end generate;
end architecture;

