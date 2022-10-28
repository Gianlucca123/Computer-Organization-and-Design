-- LAB 5 ARQUITETURA E ORGANIZACAO DE COMPUTADOR
-- GIANLUCCA FIORI OLIVEIRA E PABLO RODRIGUES SENE

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity state_machine is
    port (
        clk: in std_logic;
        state_in: in std_logic;
        rst: in std_logic;
        state_out: out std_logic
    );
end entity;

architecture a_state_machine of state_machine is
    signal reset: std_logic;
    begin
        process(clk,rst)
        begin
            if rst='1' then 
                reset <= '0';
            elsif rising_edge(clk) then 
                reset <= not state_in;
            end if;
        end process;

        state_out <= reset;
end architecture;
