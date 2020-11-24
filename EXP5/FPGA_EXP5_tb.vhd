library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FPGA_EXP5_tb is
end entity FPGA_EXP5_tb;

architecture behave of FPGA_EXP5_tb is
	component FPGA_EXP5 is
	port(
		clk: in std_logic;
		reset: in std_logic;
		output: out std_logic_vector(7 downto 0)
	);
	end component;
	
	signal clk: std_logic;
	signal reset: std_logic;
	signal output: std_logic_vector(7 downto 0);
		
	
begin
	u_EXP: FPGA_EXP5 port map(clk, reset, output);
	
	process
	begin
		clk<='1';
		wait for 10 ns;
		clk<='0';
		wait for 10 ns;
	end process;
	
	process
	begin
		reset<='1';
		wait for 100 ns;
		reset<='0';
		wait for 10 us;
		reset<='1';
		wait for 100 ns;
		reset<='0';
		wait for 25 us;
		
	end process;
end behave;
