library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity EXP3 is
	port(
		clk: in std_logic;
		sel: in std_logic_vector(2 downto 0);
		datain: in std_logic_vector(3 downto 0);
		en: in std_logic;
		decoder47_out: out std_logic_vector(6 downto 0);
		decoder38_out: out std_logic_vector(7 downto 0)
	);
end entity EXP3;

architecture behave of EXP3 is
	component part1 is
	port(
		sel: in std_logic_vector(2 downto 0);
		datain: in std_logic_vector(3 downto 0);
		en: in std_logic;
		d0,d1,d2,d3,d4,d5,d6,d7: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component clk_div is
	port(
		clk: in std_logic;
		clk_out: out std_logic
	);
	end component;
	
	component counter8 is 
	port(
		clk: in std_logic;
		counter_out: out std_logic_vector(2 downto 0)
	);
	end component;
	
	component selector81 is
	port(
		d0,d1,d2,d3,d4,d5,d6,d7: in std_logic_vector(3 downto 0);
		d_sel: in std_logic_vector(2 downto 0);
		d_out: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component decoder47 is 
	port(
		d_in: in std_logic_vector(3 downto 0); 
		decode_out: out std_logic_vector(6 downto 0)
	);
	end component;
	
	component decoder38 is
	port(
		A: in std_logic_vector(2 downto 0); 
		Y: out std_logic_vector(7 downto 0)
	);
	end component;
	
	signal d0,d1,d2,d3,d4,d5,d6,d7: std_logic_vector(3 downto 0);
	signal clk_out: std_logic;
	signal counter_out: std_logic_vector(2 downto 0);
	signal decoder47_in: std_logic_vector(3 downto 0);
begin
	u_part1: part1 port map(sel, datain, en, d0,d1,d2,d3,d4,d5,d6,d7);
	u_clk_div: clk_div port map(clk, clk_out);
	u_counter8: counter8 port map(clk_out, counter_out);
	
	u_decoder38: decoder38 port map(counter_out, decoder38_out);
	
	u_selector: selector81 port map(d0,d1,d2,d3,d4,d5,d6,d7, counter_out, decoder47_in);
	
	u_decoder47: decoder47 port map(decoder47_in, decoder47_out);

end behave;
