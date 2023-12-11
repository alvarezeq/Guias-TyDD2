library ieee;
use ieee.std_logic_1164;

entity tb_sumador_completo is
end tb_sumador_completo;

architecture behavioral of tb_sumador_completo is

--Declaro el componente
	component sumador_completo_ffD
		port(
			in_a, in_b, in_cin,clk: in std_logic;
			out_suma, out_cout: out std_logic
		);
	end component;
	
	--Inputs
	signal in_a: std_logic:= '0';
	signal in_b: std_logic:= '0';
	signal in_cin: std_logic:= '0';
	signal clk: std_logic:= '0';
	--Outputs
	signal out_suma: std_logic;
	signal out_cout: std_logic;
	
	--Definicion del periodo de clk
	constant clk_period: time:= 20ns;
	
Begin	
	--Instanciacion (UUT o DUT)
	uut: sumador_completo_ffD port map(
	in_a => in_a,
	in_b => in_b,
	in_cin => in_cin,
	clk => clk,
	out_suma => out_suma,
	out_cout => out_cout
	);
	
	--Definicion del proceso CLK
	clk_process: process
		begin
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
	end process;
	
	--Proceso de estimulos
	stim_process: process
		begin
			--Estimulos (todas las combianciones posibles)
			in_a <= '0'; in_b <= '0'; in_cin <= '0'; wait for 30 ns;
			in_a <= '0'; in_b <= '0'; in_cin <= '1'; wait for 30 ns;
			in_a <= '0'; in_b <= '1'; in_cin <= '0'; wait for 30 ns;
			in_a <= '0'; in_b <= '1'; in_cin <= '1'; wait for 30 ns;
			in_a <= '1'; in_b <= '0'; in_cin <= '0'; wait for 30 ns;
			in_a <= '1'; in_b <= '0'; in_cin <= '1'; wait for 30 ns;
			in_a <= '1'; in_b <= '1'; in_cin <= '0'; wait for 30 ns;
			in_a <= '1'; in_b <= '1'; in_cin <= '1'; wait for 30 ns;
			wait;
		end process;
end behavioral;
	
	