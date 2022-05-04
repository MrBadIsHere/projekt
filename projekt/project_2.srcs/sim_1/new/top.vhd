----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 11:06:48 AM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
Port ( 
  CLK100MHZ : in STD_LOGIC;
  BTNC  : in std_logic;  
  SW0: in std_logic;
  SW1: in std_logic;
  AUD_PWM: out std_logic;
  SW: in std_logic_vector (11 downto 0)
  
  );
end top;

architecture Behavioral of top is

begin
pwm : entity work.pwm
        port map(
            clk   => CLK100MHZ,
            reset => BTNC,
            en_i => SW0,
            pwm_o => AUD_PWM,           
            duty_sw => SW1,
            period =>unsigned (SW)
        );




end Behavioral;
