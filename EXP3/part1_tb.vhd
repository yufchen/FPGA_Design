library ieee;
use ieee.std_logic_1164.all;

entity part1_tb is
end part1_tb;

architecture behave of part1_tb is
	component part1 is
	port(
		sel: in std_logic_vector(2 downto 0);
		datain: in std_logic_vector(3 downto 0);
		en: in std_logic;
		d0,d1,d2,d3,d4,d5,d6,d7: out std_logic_vector(3 downto 0)
	);
	end component;
	
	signal sel: std_logic_vector(2 downto 0);
	signal datain: std_logic_vector(3 downto 0);
	signal en: std_logic;
	signal d0,d1,d2,d3,d4,d5,d6,d7: std_logic_vector(3 downto 0);
	
begin
	u_tb: part1 port map(sel, datain, en, d0,d1,d2,d3,d4,d5,d6,d7);
	process
	begin
		sel<="000";
		datain<="0001";
		wait for 100 ns;
		sel<="001";
		datain<="0010";
		wait for 100 ns;
		sel<="010";
		datain<="0011";
		wait for 100 ns;
		sel<="011";
		datain<="0100";
		wait for 100 ns;
		sel<="100";
		datain<="0101";
		wait for 100 ns;
		sel<="101";
		datain<="0110";
		wait for 100 ns;
		sel<="110";
		datain<="0111";
		wait for 100 ns;
		sel<="111";
		datain<="1000";
		wait for 100 ns;
		
		sel<="000";
		wait for 100 ns;
		sel<="001";
		wait for 100 ns;
		sel<="010";
		wait for 100 ns;
		sel<="011";
		wait for 100 ns;
		sel<="100";
		wait for 100 ns;
		sel<="101";
		wait for 100 ns;
		sel<="110";
		wait;
	end process;
	
	process
	begin
		en<='0';
		wait for 40 ns;
		en<='1';
		wait for 20 ns;
		en<='0';
		wait for 40 ns;
	end process;
end behave;