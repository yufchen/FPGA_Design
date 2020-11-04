library ieee;
use ieee.std_logic_1164.all;

entity selector81 is
	port(
		d0,d1,d2,d3,d4,d5,d6,d7: in std_logic_vector(3 downto 0);
		d_sel: in std_logic_vector(2 downto 0);
		d_out: out std_logic_vector(3 downto 0)
	);
end entity selector81;

architecture behave of selector81 is
begin

process(d_sel, d0,d1,d2,d3,d4,d5,d6,d7)
begin
	case d_sel is
		when "000"=>d_out<=d0;
		when "001"=>d_out<=d1;
		when "010"=>d_out<=d2;
		when "011"=>d_out<=d3;
		when "100"=>d_out<=d4;
		when "101"=>d_out<=d5;
		when "110"=>d_out<=d6;
		when "111"=>d_out<=d7;
	end case;
end process;
end behave;
