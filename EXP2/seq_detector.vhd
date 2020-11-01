library ieee;
use ieee.std_logic_1164.all;

entity seq_detector is
	port(
		clk,reset: in std_logic;
		datainput: in std_logic;
		detector_out: buffer std_logic
	);
end seq_detector;

architecture behave of seq_detector is
	type states is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9);
	signal present_state, next_state: states;
	
begin
	state_comb: process(detector_out, datainput, present_state)
	begin
		case present_state is
			when s0=>detector_out<='0';
				if(datainput='1') then
					next_state<=s1;
				else
					next_state<=s0;
				end if;
			when s1=>detector_out<='0';
				if(datainput='1') then
					next_state<=s2;
				else
					next_state<=s0;
				end if;
			when s2=>detector_out<='0';
				if(datainput='1') then
					next_state<=s3;
				else
					next_state<=s0;
				end if;
			when s3=>detector_out<='0';
				if(datainput='1') then
					next_state<=s3;
				else
					next_state<=s4;
				end if;
			when s4=>detector_out<='0';
				if(datainput='1') then
					next_state<=s5;
				else
					next_state<=s0;
				end if;
			when s5=>detector_out<='0';
				if(datainput='1') then
					next_state<=s1;
				else
					next_state<=s6;
				end if;
			when s6=>detector_out<='0';
				if(datainput='1') then
					next_state<=s1;
				else
					next_state<=s7;
				end if;
			when s7=>detector_out<='0';
				if(datainput='1') then
					next_state<=s8;
				else
					next_state<=s0;
				end if;
			when s8=>detector_out<='0';
				if(datainput='1') then
					next_state<=s9;
				else
					next_state<=s0;
				end if;
			when s9=>detector_out<='1';
				if(datainput='1') then
					next_state<=s1;
				else
					next_state<=s0;
				end if;
		end case;
	end process state_comb;
	
	state_clocked: process(clk, reset)
	begin
		if(reset='1') then
			present_state<=s0;
		elsif(clk'event and clk='1') then
			present_state <= next_state;
		end if;
	end process state_clocked;
end behave;
