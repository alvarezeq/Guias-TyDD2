--Ej Parte A Guia 5

library ieee;
use ieee.std_logic_1164.all;

entity ej_combinacional is
	port(
		sw1: in std_logic;
		sw2: in std_logic;
		led: out std_logic
		);
end ej_combinacional;

architecture behavioral of ej_combinacional is
begin
	led <= not (sw1 and sw2);
end behavioral;
