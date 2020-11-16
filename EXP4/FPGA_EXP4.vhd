library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FPGA_EXP4 is 
	port(
		clk: in std_logic;
		cs,en: in std_logic;
		stcode: in std_logic_vector(3 downto 0);
		scancode: buffer std_logic_vector(3 downto 0);
		decode_out: out std_logic_vector(6 downto 0);
		enable_led: out std_logic
	);
end entity FPGA_EXP4;

architecture behave of FPGA_EXP4 is
	component counter03 is
	port(
		clk_in: in std_logic;
		counter_out: out std_logic_vector(1 downto 0)
	);
	end component;
	
	component scancode_out is
	port(
		clk: in std_logic;
		cnt_in: in std_logic_vector(1 downto 0);
		code_out: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component encoder is
	port(
		clk: in std_logic;
		scancode: in std_logic_vector(3 downto 0);
		stcode: in std_logic_vector(3 downto 0);
		encoder_out: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component decoder47 is
	port(
		clk: in std_logic;
		d_in: in std_logic_vector(3 downto 0);
		decode_out: out std_logic_vector(6 downto 0)
	);
	end component;
	
	component dtrigger is
	port(
		clk: in std_logic;
		D: in std_logic_vector(3 downto 0);
		cs,en: in std_logic; 
		Q: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component clk_div is
	port(
		clk: in std_logic;
		clk_out: out std_logic
	);
	end component;
	
	signal clk_out: std_logic;
	signal counter_out: std_logic_vector(1 downto 0);
	signal dtrigger_out: std_logic_vector(3 downto 0);
	signal encoder_out: std_logic_vector(3 downto 0);
	
	
begin
	enable_led<='1';
	u_clk_div: clk_div port map(clk, clk_out);
	u_counter03: counter03 port map(clk_out, counter_out);
	u_scancode_out: scancode_out port map(clk_out, counter_out, scancode);
	u_encoder: encoder port map(clk_out, scancode, stcode, encoder_out);
	u_drigger: dtrigger port map(clk_out, encoder_out, cs, en, dtrigger_out);
	u_decoder47: decoder47 port map(clk_out, dtrigger_out, decode_out);
	
end behave;