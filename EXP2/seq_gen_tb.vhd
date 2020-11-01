library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seq_gen_tb is
end seq_gen_tb;

architecture arch_tb of seq_gen_tb is
	component seq_gen2 is 
	port(
		reset,clk: in std_logic;
		seq: buffer std_logic
	);
	end component;

	signal clk, reset:std_logic;
	signal seq: std_logic;

begin
	u_tb :seq_gen2 port map(reset, clk, seq);
	
	init_stimulus:process
	begin
		reset<='1';
		wait for 50 ns;
		reset<='0';
		wait for 900 ns;
	end process init_stimulus;
		
	clk_stimulus:process
	begin	
		clk <= '1';
		wait for 10 ns;
		clk <= '0';	
		wait for 10 ns;
	end process clk_stimulus;
end arch_tb;
		
