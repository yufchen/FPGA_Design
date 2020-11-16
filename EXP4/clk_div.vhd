library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity clk_div is
	port(
		clk: in std_logic;
		clk_out: out std_logic
	);
end entity clk_div;

architecture behave of clk_div is
	signal count: integer range 0 to 999;
	signal tmp_clk: std_logic :='0';

begin
	clk_out<=tmp_clk;
	process(clk, tmp_clk,count)
	begin
		if(clk'event and clk='1') then
			if(count=999) then
				count<=0;
				tmp_clk <= not tmp_clk;
			else
				count<=count+1;
			end if;
		end if;
	end process;
end behave;
