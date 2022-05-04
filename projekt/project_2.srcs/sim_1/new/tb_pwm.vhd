--|-----------------------------------|
--|--TESTBENCH-FOR-PWM-MODULATOR------|
--|-----------------------------------|

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---ENTITY-------------------------------------------------
entity tb_pwm is
end entity tb_pwm;

---ARCHITECTURE-------------------------------------------
architecture testbench of tb_pwm is

signal s_clk : std_logic;  --clock signal
signal s_en  : std_logic;  --enable signal
signal s_reset : std_logic;  --reset signal
signal s_duty : unsigned(9 downto 0);  --duty signal
signal s_pwm  :std_logic; --pwm output
        
begin

uut_pwm : entity work.pwm
        port map(
            clk     => s_clk,
            en_i    => s_en,
            reset   => s_reset,        	
            duty    => s_duty,
            pwm_o   => s_pwm
        );
        
--------CLOCK-GENERATOR-----------------------------------
	p_clk_gen : process
 		begin
          while now < 1 ms loop 
            	s_clk <= '0';
            	wait for 10 ns/ 2;
            	s_clk <= '1';
            	wait for 10 ns / 2;
        	end loop;
        	wait;
    end process p_clk_gen;

--------STIMULUS------------------------------------------
	p_stimulus : process
	    begin
    	    report "Stimulus process started" severity note;
            
        	s_en <= '1';
        	s_reset <= '0';            
            s_duty <= to_unsigned(500,10);            
            wait for 200 us;
            s_duty <= to_unsigned(250,10);            
            wait for 200 us;
            s_duty <= to_unsigned(800,10); 
        	
        	report "Stimulus process finished" severity note;
        	wait;
    end process p_stimulus;

end architecture testbench;