-- LAB 5 ARQUITETURA E ORGANIZACAO DE COMPUTADOR
-- GIANLUCCA FIORI OLIVEIRA E PABLO RODRIGUES SENE

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum_pc is
    port (
        data_in: in unsigned(15 downto 0);
        data_out: out unsigned(15 downto 0)
    );
end entity;

architecture a_sum_pc of sum_pc is
    begin 
        data_out <= data_in + "0000000000000001";
end architecture;
