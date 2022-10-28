-- LAB 5 ARQUITETURA E ORGANIZACAO DE COMPUTADOR
-- GIANLUCCA FIORI OLIVEIRA E PABLO RODRIGUES SENE

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_PC_UC_tb is
end entity;

architecture a_ROM_PC_UC_tb of ROM_PC_UC_tb is
    component ROM_PC_UC is
        port(
            clk: in std_logic;
            rst: in std_logic
        );
    end component;

    signal s_clk, s_rst: std_logic := '0';

    begin

        uut: ROM_PC_UC port map(clk => s_clk, rst => s_rst);

        process 
        begin
            s_clk <= '0';
            wait for 50 ns;
            s_clk <= '1';
            wait for 50 ns;
        end process;

        process 
        begin
            s_rst <= '1';
            wait for 100 ns;
            s_rst <= '0';
            wait;
        end process;

end architecture;
