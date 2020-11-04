library ieee;
use ieee.std_logic_1164.all;

entity part1 is
	port(
		sel: in std_logic_vector(2 downto 0);
		datain: in std_logic_vector(3 downto 0);
		en: in std_logic;
		d0,d1,d2,d3,d4,d5,d6,d7: out std_logic_vector(3 downto 0)
	);
end entity part1;

architecture behave of part1 is 
	component decoder38 is
	port(
		A: in std_logic_vector(2 downto 0); 
		Y: out std_logic_vector(7 downto 0)
	);
	end component;
	
	component dtrigger is
	port(
		D: in std_logic_vector(3 downto 0);
		cs,en: in std_logic; 
		Q: out std_logic_vector(3 downto 0)
	);
	end component;
	
	signal cs_vector: std_logic_vector(7 downto 0);
begin
	u_decoder38: decoder38 port map(sel, cs_vector);
	u_trigger0: dtrigger port map(datain, cs_vector(0), en, d0);
	u_trigger1: dtrigger port map(datain, cs_vector(1), en, d1);
	u_trigger2: dtrigger port map(datain, cs_vector(2), en, d2);
	u_trigger3: dtrigger port map(datain, cs_vector(3), en, d3);
	u_trigger4: dtrigger port map(datain, cs_vector(4), en, d4);
	u_trigger5: dtrigger port map(datain, cs_vector(5), en, d5);
	u_trigger6: dtrigger port map(datain, cs_vector(6), en, d6);
	u_trigger7: dtrigger port map(datain, cs_vector(7), en, d7);
end behave;