library ieee;
use ieee.std_logic_1164.all;

entity seq_gen2 is
	port(
		reset,clk: in std_logic;
		seq: buffer std_logic
	);
end seq_gen2;

architecture behave of seq_gen2 is
	type states is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9);
	signal st: states;
	
begin
	process(clk, reset)
	begin
		if(reset='1') then
			st<=s9;		
		elsif(clk'event and clk='1') then
			case st is
				when s0=>st<=s1;
				when s1=>st<=s2;
				when s2=>st<=s3;
				when s3=>st<=s4;
				when s4=>st<=s5;
				when s5=>st<=s6;
				when s6=>st<=s7;
				when s7=>st<=s8;
				when s8=>st<=s9;
				when s9=>st<=s0;
			end case;
		end if;
	end process;
	
	process(st,seq)
	begin
		case st is 
			when s0=>seq<='1';
			when s1=>seq<='0';
			when s2=>seq<='1';
			when s3=>seq<='0';
			when s4=>seq<='1';
			when s5=>seq<='0';
			when s6=>seq<='1';
			when s7=>seq<='1';
			when s8=>seq<='0';
			when s9=>seq<='0';
		end case;
	end process;	
end behave;
