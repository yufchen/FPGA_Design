library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity encoder is 
	port(
		clk: in std_logic;
		scancode: in std_logic_vector(3 downto 0);
		stcode: in std_logic_vector(3 downto 0);
		encoder_out: out std_logic_vector(3 downto 0)
	);
end entity encoder;

architecture behave of encoder is
begin
	process(scancode, stcode, clk)
	begin
	if(clk'event and clk='1') then
		if(stcode="1110") then
			case scancode is
				when "1110"=>encoder_out<="0000";
				when "1101"=>encoder_out<="0001";
				when "1011"=>encoder_out<="0010";
				when "0111"=>encoder_out<="0011";
				when others=>null;
			end case;
		elsif(stcode="1101") then
			case scancode is
				when "1110"=>encoder_out<="0100";
				when "1101"=>encoder_out<="0101";
				when "1011"=>encoder_out<="0110";
				when "0111"=>encoder_out<="0111";
				when others=>null;
			end case;
		elsif(stcode="1011") then
			case scancode is
				when "1110"=>encoder_out<="1000";
				when "1101"=>encoder_out<="1001";
				when "1011"=>encoder_out<="1010";
				when "0111"=>encoder_out<="1011";
				when others=>null;
			end case;
		elsif(stcode="0111") then
			case scancode is
				when "1110"=>encoder_out<="1100";
				when "1101"=>encoder_out<="1101";
				when "1011"=>encoder_out<="1110";
				when "0111"=>encoder_out<="1111";
				when others=>null;
			end case;
		end if;
	end if;
	end process;
end behave;