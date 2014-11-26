library IEEE;
use IEEE.std_logic_1164.all;

entity nesdriver is
port
(
				clk:	in std_logic;
				reset: 	in std_logic;
				pulse : in std_logic;
				latch: 	in std_logic;
				data: 	out std_logic;
				button_in : in std_logic_vector (7 downto 0)
);
end nesdriver;

architecture behaviour of nesdriver is

type state_type is (z,a,b,bs,st,stse,se,seu,u,ud,d,dl,l,lr,r,rz);
signal current_state : state_type;
signal next_state : state_type :=z;

begin



process(current_state,latch,pulse)
begin
case current_state is

	when z =>
		data <= '0';
		if latch = '0' then
			next_state <= z;
		else
			next_state <= a;		
		end if;

	when a =>
		data <= not(button_in(0));
		if pulse = '1' then
			next_state <=b;
		else
			next_state <=a;
		end if;
	when b =>
		data <= not(button_in(1));
		if pulse = '1' then
			next_state <=b;
		else
			next_state <=bs;
		end if;
	when bs =>
		data <= not(button_in(1));
		if pulse = '1' then
			next_state <=st;
		else
			next_state <=bs;
		end if;
	when st =>
		data <= not(button_in(2));
		if pulse = '1' then
			next_state <=st;
		else
			next_state <=stse;
		end if;
	when stse =>
		data <= not(button_in(2));
		if pulse = '1' then
			next_state <=se;
		else
			next_state <=stse;
		end if;
	when se =>
		data <= not(button_in(3));
		if pulse = '1' then
			next_state <=se;
		else
			next_state <=seu;
		end if;
	when seu =>
		data <= not(button_in(3));
		if pulse = '1' then
			next_state <=u;
		else
			next_state <=seu;
		end if;
	when u =>
		data <= not(button_in(4));
		if pulse = '1' then
			next_state <=u;
		else
			next_state <=ud;
		end if;
	when ud =>
		data <= not(button_in(4));
		if pulse = '1' then
			next_state <=d;
		else
			next_state <=ud;
		end if;
	when d =>
		data <= not(button_in(5));
		if pulse = '1' then
			next_state <=d;
		else
			next_state <=dl;
		end if;
	when dl =>
		data <= not(button_in(5));
		if pulse = '1' then
			next_state <=l;
		else
			next_state <=dl;
		end if;
	when l =>
		data <= not(button_in(6));
		if pulse = '1' then
			next_state <=l;
		else
			next_state <=lr;
		end if;
	when lr =>
		data <= not(button_in(6));
		if pulse = '1' then
			next_state <=r;
		else
			next_state <=lr;
		end if;
	when r =>
		data <= not(button_in(7));
		if pulse = '1' then
			next_state <=r;
		else
			next_state <=rz;
		end if;
	when rz =>
		data <= not(button_in(7));
		if pulse = '1' then
			next_state <=z;
		else
			next_state <=rz;
		end if;
end case;
end process;



process(clk, reset)
begin
if (reset='1') then

current_state <= z;

elsif rising_edge(clk) then
  current_state <= next_state; 
end if;
end process;

end behaviour;
		
			