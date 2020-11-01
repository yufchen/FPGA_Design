library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity EXP2_tb is
end EXP2_tb;

architecture arch_tb of EXP2_tb is
	component EXP2 is 
	port(
		clk, reset_gen, reset_det,option: in std_logic;
		detector_out: buffer std_logic
	);
	end component;

	signal clk, reset_gen, reset_det,option:std_logic;
	signal detector_out: std_logic;

begin
	u_tb : EXP2 port map(clk, reset_gen, reset_det,option, detector_out);
	
	
	init_stimulus:process
	begin
		option<='0';
		reset_det<='1';
		reset_gen<='1';
		wait for 100 ns;
		reset_det<='0';
		reset_gen<='0';
		option<='0';
		wait for 900 ns;
		option<='1';
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
		
