library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity EXP2 is
	port(
		clk, reset_gen, reset_det,option: in std_logic;
		detector_out: buffer std_logic
	);
end EXP2;

architecture arch_tb of EXP2 is
	component seq_detector is 
	port(
		clk,reset: in std_logic;
		datainput: in std_logic;
		detector_out: buffer std_logic
	);
	end component;
	
	component seq_gen is 
	port(
		reset,clk: in std_logic;
		seq: buffer std_logic
	);
	end component;

	component seq_gen2 is 
	port(
		reset,clk: in std_logic;
		seq: buffer std_logic
	);
	end component;
	
	component selector is 
	port(
		seq1: in std_logic;
		seq2: in std_logic;
		option: in std_logic;
		datainput: buffer std_logic
	);
	end component;
	
	component clk_div is 
	port(
		clk: in std_logic;
		clk_a: out std_logic
	);
	end component;
	
	signal seq1, seq2, datainput, clk_a: std_logic;

begin
	u_clk: clk_div port map(clk,clk_a);
	detector_tb :seq_detector port map(clk_a, reset_det, datainput, detector_out);
	gen1_tb: seq_gen port map(reset_gen, clk_a, seq1);
	gen2_tb: seq_gen2 port map(reset_gen, clk_a, seq2);
	selector_tb: selector port map(seq1,seq2,option,datainput);

end arch_tb;
		
