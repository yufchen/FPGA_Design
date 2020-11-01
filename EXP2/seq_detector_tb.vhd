library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seq_detector_tb is
end seq_detector_tb;

architecture arch_tb of seq_detector_tb is
	component seq_detector is 
	port(
		clk,reset: in std_logic;
		datainput: in std_logic;
		detector_out: buffer std_logic
	);
	end component;

	signal clk, reset, datainput:std_logic;
	signal detector_out: std_logic;

begin
	u_tb :seq_detector port map(clk, reset, datainput, detector_out);
	
	init_stimulus:process
	begin
		reset<='1';
		datainput<='1';
		wait for 50 ns;
		reset<='0';
		wait for 20 ns;
		datainput<='1';
		wait for 20 ns;
		datainput<='1';
		wait for 20 ns;
		datainput<='1';
		wait for 20 ns;
		datainput<='0';
		wait for 20 ns;
		datainput<='1';
		wait for 20 ns;
		datainput<='0';
		wait for 20 ns;
		datainput<='0';
		wait for 20 ns;
		datainput<='1';
		wait for 20 ns;
		datainput<='1';
		wait for 20 ns;
		datainput<='1';
		wait for 20 ns;
	end process init_stimulus;
		
	clk_stimulus:process
	begin	
		clk <= '1';
		wait for 10 ns;
		clk <= '0';	
		wait for 10 ns;
	end process clk_stimulus;
end arch_tb;
		
