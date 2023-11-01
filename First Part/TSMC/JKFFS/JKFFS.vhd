library ieee; use ieee.std_logic_1164.all;
entity  JKFFS is
 Port 
 ( J, K, SN, CK: in std_logic;
 	Q, QN : out std_logic
 );
 constant SNDelay : time := 158 ps;
 constant delay : time := 381 ps;
 constant invDelay : time := 287 ps;
end entity;


architecture df of JKFFS is
	signal temp : std_logic;
	signal inp : std_logic_vector (1 downto 0);
begin
	inp <= J & K;
	process(CK, SN)
	begin
		if (SN = '0') then
			temp <= '1' after SNDelay;
		elsif rising_edge(CK) then
			if (inp = "00") then
				temp <= temp;
			elsif (inp = "01") then
				temp <= '0';
			elsif (inp = "10") then
				temp <= '1';
			else 
				temp <= not temp;
			end if;

		end if;
	end process;
	Q <= temp;
	QN <= not Q after invDelay;
	
end df;






--architecture dataFlow of JKFFS is 
--	signal nxt_state , prv_state : std_logic;
--	signal inp : std_logic_vector (1 downto 0);
--begin
--	inp <= J & K;	
-- process (SN, CK)
-- begin
--   if(SN = '0') then
--   		nxt_state <= prv_state;
--   elsif rising_edge(CK) then
--   		case (inp) is
--        when “10” => nxt_state <= ‘1’;
--        when “01” => nxt_state <= ‘0’;
--        when “00” => nxt_state <= prv_state;
--        when “11” => nxt_state <= not prv_state;
--       when others => nxt_state <= prv_state;
--       end case;
--       end if;
--   end process;
--   Q <= nxt_state;
--   Qn <= not Q;
--   prv_state <= nxt_state;   
--end dataFlow;
 
 
 
 
 
 
 
