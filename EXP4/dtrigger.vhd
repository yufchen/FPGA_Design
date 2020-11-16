library ieee;
use ieee.std_logic_1164.all;

entity dtrigger is
	port(
		clk: in std_logic;
		D: in std_logic_vector(3 downto 0);
		cs,en: in std_logic; 
		Q: out std_logic_vector(3 downto 0)
	);
end entity dtrigger;

architecture behave of dtrigger is
begin

process(D,cs,en,clk)
begin
if(clk'event and clk='1') then
	if(cs='1' AND en='1') then
		Q<=D;
	end if;
end if;
end process;
end behave;
