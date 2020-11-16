library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity scancode_out is 
	port(
		clk: in std_logic;
		cnt_in: in std_logic_vector(1 downto 0);
		code_out: out std_logic_vector(3 downto 0)
	);
end entity scancode_out;

architecture behave of scancode_out is
begin
	process(cnt_in, clk)
	begin
		if(clk'event and clk='1') then
			case cnt_in is
				when "00"=>code_out<="1110";
				when "01"=>code_out<="1101";
				when "10"=>code_out<="1011";
				when "11"=>code_out<="0111";
				when others=>code_out<="0000";
			end case;
		end if;
	end process;
end behave;