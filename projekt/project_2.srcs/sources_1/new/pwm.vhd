--|------------------------------------------|
--|------------------------------------------|
--|SIMPLE-10-bit-PWM-MODULATOR-ARCHITECTURE--|
--|------------------------------------------|
--|----------------By-Benjamin-Nimmerrichter-|

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
---ENTITY-------------------------------------------------------
entity pwm is
port(
  clk   	: in std_logic;  --clock input
  en_i  	: in std_logic;  --input from clock enable module
  reset 	: in std_logic;  --synychronous reset input
  --duty  	: in unsigned(9 downto 0);  --10 bit duty cycle resolution
  duty_sw   : in std_logic; --switch between 25% and 50% duty cycle
  period   	: in unsigned(11 downto 0); --12 bit period time
  pwm_o 	: out std_logic
);
end entity pwm;

---ARCHITECTURE--------------------------------------------------
architecture Behavioral of pwm is
--Internal signals
signal fill : natural := 0;  --amount of filled time
signal cycles : integer := 0;  --amount of filled time
signal duty_int: natural;  --duty cycle converted to a comparable value

begin
	p_pwm : process(clk)
	begin
		if rising_edge(clk) then --start on rising edge
        	if (en_i = '1') then --check if the enable signal is on
				if (reset='1') then --synchronous active high reset
                	cycles <= 0;
                    fill <= 0;
        		else  -- if reset is turned off
                    if (duty_sw = '1') then
                        duty_int <= 750;
                    else
                      duty_int <= 500;
                    end if;    
                	if (cycles < to_integer(period)*5) then  --period*5 for sound (starts at 20 kHz with 1, ends at 50Hz with 4000)
                    	cycles <= cycles+1;
                    else --when desired number of periods hits
                        cycles <= 1;  
            			if (fill < duty_int) then --checks if the fill level is larger than the duty cycle
                			pwm_o <= '1'; 
                        	fill <= fill+1; 
                		elsif (fill >= 1000) then --if the period finishes, then start again
                        	fill <= 0;                        
                    	else            -- when period is continuing and the output should be off
                    	pwm_o<='0';
                        fill <= fill+1; 
                        end if;
                                            
                	end if;  
                    
            	end if;        
        	end if;
		end if;
	end process p_pwm;

end architecture Behavioral;