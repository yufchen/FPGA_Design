library ieee;
use ieee.std_logic_1164.all;

entity selector is
	port(
		seq1: in std_logic;
		seq2: in std_logic;
		option: in std_logic;
		datainput: buffer std_logic
	);
end selector;

architecture behave of selector is

begin
	process(option,seq1,seq2,datainput)
	begin
		if(option='0') then
			datainput<=seq1;
		else
			datainput<=seq2;
		end if;
	end process;	
end behave;
