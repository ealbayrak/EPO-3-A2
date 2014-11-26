library IEEE;
use IEEE.std_logic_1164.all;

entity nes_driver_tb is
end nes_driver_tb;

architecture behaviour of nes_driver_tb is

component nesdriver is
port
(
				clk:	in std_logic;
				reset: 	in std_logic;
				pulse : in std_logic;
				latch: 	in std_logic;
				data: 	out std_logic;
				button_in : in std_logic_vector (7 downto 0)
);
end component;

signal clk, reset, pulse, latch,data : std_logic;
signal button_in : std_logic_vector (7 downto 0);

begin

clk <= '1' after 0 ns, '0' after 10 ns when clk /= '0' else '1' after 10 ns;

 pulse   <=   
	    '0' after 0 us,
	    '0' after 23 us,
            '1' after 29 us,
            '0' after 35 us,
            '1' after 41 us,
            '0' after 47 us,
            '1' after 53 us,
            '0' after 59 us,
            '1' after 65 us,
            '0' after 71 us,
            '1' after 77 us,
            '0' after 83 us,
            '1' after 89 us,
            '0' after 95 us,
            '1' after 101 us,
            '0' after 107 us,
            '1' after 113 us,
            '0' after 119 us;

 reset <=   '1' after 0 us,
            '0' after 1 us;	
 latch <=  '0' after 0 us, '1' after 5 us, '0' after 17 us;	

 button_in <=	"10010010" after 0 us;



lbl: nesdriver port map (

		clk => clk,
		reset => reset,
		pulse => pulse,
		latch => latch,
		data => data,
		button_in => button_in);

end behaviour;
