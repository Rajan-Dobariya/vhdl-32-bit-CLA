library ieee; use ieee.std_logic_1164.all;

use ieee.std_logic_unsigned. all; 
entity reg_mux_tb is 
	generic (tp : time:= 10 ns);

end entity; 

architecture testbench of reg_mux_tb is
	component reg_mux is 
		port (a,b,c,d: in std_logic_vector (3 downto 0); 
		sel: in std_logic_vector (1 downto 0); 
		clk: in std_logic;
		x, y: out std_logic_vector(3 downto 0));
	end component;

signal a_tb: std_logic_vector (3 downto 0) := "0010";
signal b_tb: std_logic_vector (3 downto 0) := "0100";
signal c_tb: std_logic_vector (3 downto 0) := "0110";
signal d_tb: std_logic_vector (3 downto 0) := "1000";
signal sel_tb: std_logic_vector (1 downto 0) := "00";
signal clk_tb: std_logic := '0';
signal x_tb: std_logic_vector(3 downto 0);
signal y_tb: std_logic_vector(3 downto 0); 
signal expected: std_logic_vector(3 downto 0) := "0000";

begin
dut: reg_mux port map (a_tb, b_tb, c_tb, d_tb, sel_tb, clk_tb, x_tb, y_tb);

clk_tb <= not clk_tb after 40 ns;
a_tb <= "0011" after 80 ns, "0000" after 640 ns;
b_tb <= "0101" after 240 ns; 
c_tb <= "0111" after 400 ns;
d_tb <= "1001" after 560 ns;
sel_tb <= "01" after 160 ns, "10" after 320 ns,
		  "11" after 480 ns, "00" after 640 ns;

expected <= "0010" after 40 ns + tp,
 "0011" after 120 ns + tp,
 "0100" after 200 ns + tp,
 "0101" after 280 ns + tp,
 "0111" after 360 ns + tp, --"0110" after 440 ns + tp,
 "0111" after 440 ns + tp, 
 "1000" after 520 ns + tp,
 "1001" after 600 ns + tp, 
 "0000" after 680 ns + tp;
 
process begin 
wait for tp;
 if (now < 800 ns) then 
 	assert (y_tb = expected)
 		report " Mismatch at t= " & time'image(now)
--to_string(now) & 
 		--"y_tb=" & to_string(t_tb) &
 		--"y_exp=" & to_string(expected)
 	severity failure;
else
	assert false
		report "No error found (t=" 
--to_string(now) & ") " 
		severity note;
	end if;
end process; 
end architecture;
