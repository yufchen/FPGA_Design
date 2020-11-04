library ieee;
use ieee.std_logic_1164.all;

entity decoder47 is
	port(
		d_in: in std_logic_vector(3 downto 0); 
		decode_out: out std_logic_vector(6 downto 0)
	);
end entity decoder47;

architecture behave of decoder47 is
begin

process(d_in)
begin
	case d_in is
		when "0000"=>decode_out<="0000001";
		when "0001"=>decode_out<="1001111";
		when "0010"=>decode_out<="0010010";
		when "0011"=>decode_out<="0000110";
		when "0100"=>decode_out<="1001100";
		when "0101"=>decode_out<="0100100";
		when "0110"=>decode_out<="0100000";
		when "0111"=>decode_out<="0001111";
		when "1000"=>decode_out<="0000000";
		when "1001"=>decode_out<="0000100";
		when others=>decode_out<="0000000";
	end case;
end process;
end behave;
