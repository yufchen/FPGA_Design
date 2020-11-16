library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter03 is 
	port(
		clk_in: in std_logic;
		counter_out: out std_logic_vector(1 downto 0)
	);
end entity counter03;

architecture behave of counter03 is
	signal tmp_cnt: integer range 0 to 3;
begin
	process(clk_in)
	begin 
		if(clk_in'event and clk_in='1') then
			if(tmp_cnt=3) then
				tmp_cnt<=0;
			else
				tmp_cnt<=tmp_cnt+1;
			end if;
		end if;
	end process;
	
	process(tmp_cnt)
	begin
		case tmp_cnt is
			when 0=>counter_out<="00";
			when 1=>counter_out<="01";
			when 2=>counter_out<="10";
			when 3=>counter_out<="11";
		end case;
	end process;
end behave;