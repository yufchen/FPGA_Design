library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity clk_div_tb is
end clk_div_tb;

architecture arch_tb of clk_div_tb is
	component clk_div is 
	port(
		clk: in std_logic;
		clk_a: out std_logic
	);
	end component;

	signal clk,clk_a:std_logic;
	
begin
	u_tb :clk_div port map(clk, clk_a);

	clk_stimulus:process
	begin	
		clk <= '1';
		wait for 10 ns;
		clk <= '0';	
		wait for 10 ns;
	end process clk_stimulus;
end arch_tb;
		
