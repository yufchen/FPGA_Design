library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FPGA_EXP5 is
	port(
		clk: in std_logic;
		reset: in std_logic;
		output: out std_logic_vector(7 downto 0)
	);
end entity FPGA_EXP5;

architecture behave of FPGA_EXP5 is
	component mystorage is
		port(
		address		: in std_logic_vector (9 downto 0);
		clock		: in std_logic  := '1';
		q		: out std_logic_vector (7 downto 0)
	);
	end component;
	signal cnt: std_logic_vector (9 downto 0);
begin
	u_mystorage: mystorage port map(cnt, clk, output);
	
	process(clk, cnt)
	begin
		if(clk'event and clk='1') then
			if(reset='1') then
				cnt<="0000000000";
			else 
			
				if(cnt="1111111111") then
					cnt<="0000000000";
				else
					cnt<=cnt+1;
				end if;
				
			end if;
		end if;
	end process;
end behave;