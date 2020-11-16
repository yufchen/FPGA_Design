library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity EXP4_tb is
end entity EXP4_tb;

architecture behave of EXP4_tb is
	component FPGA_EXP4 is
	port(
		clk: in std_logic;
		cs,en: in std_logic;
		stcode: in std_logic_vector(3 downto 0);
		scancode: buffer std_logic_vector(3 downto 0);
		decode_out: out std_logic_vector(6 downto 0);
		enable_led: out std_logic
	);
	end component;
	
	signal clk,cs,en: std_logic;
	signal stcode: std_logic_vector(3 downto 0);
	signal scancode: std_logic_vector(3 downto 0);
	signal decode_out: std_logic_vector(6 downto 0);
	signal enable_led: std_logic;
			
begin
	u_tb: FPGA_EXP4 port map(clk, cs,en,stcode,scancode,decode_out,enable_led);
	cs<='1';

	process
	begin
		clk<='1';
		wait for 10 ns;
		clk<='0';
		wait for 10 ns;
	end process;
	
	process
	begin
		wait for 10 ns;
		stcode<="0111";
		wait for 300 ns;
		stcode<="1011";
		wait for 300 ns;
		stcode<="1101";
		wait for 300 ns;
		stcode<="1110";
		wait for 300 ns;
	end process;
end behave;