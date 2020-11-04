library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter8 is
	port(
		clk: in std_logic;
		counter_out: out std_logic_vector(2 downto 0)
	);
end entity counter8;

architecture behave of counter8 is
	signal tmp_count: integer range 0 to 7;
begin

	process(clk)
	begin
		if(clk'event and clk='1') then
			if(tmp_count=7) then
				tmp_count<=0;
			else
				tmp_count<=tmp_count+1;
			end if;
		end if;
	end process;
	
	process(tmp_count)
	begin
		case tmp_count is
			when 0=>counter_out<="000";
			when 1=>counter_out<="001";
			when 2=>counter_out<="010";
			when 3=>counter_out<="011";
			when 4=>counter_out<="100";
			when 5=>counter_out<="101";
			when 6=>counter_out<="110";
			when 7=>counter_out<="111";
		end case;
	end process;
	
end behave;
