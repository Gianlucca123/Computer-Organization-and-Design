-- LAB 5 ARQUITETURA E ORGANIZACAO DE COMPUTADOR
-- GIANLUCCA FIORI OLIVEIRA E PABLO RODRIGUES SENE

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is 
    port (
        clk: in std_logic;
        adress: in unsigned(15 downto 0);
        data: out unsigned(7 downto 0)
    );
end entity;

architecture a_rom of rom is 
    type mem is array (0 to 127) of unsigned(7 downto 0);
    constant content_rom: mem := (
        0 => "00000000",
        1 => "11100101",
        2 => "00000101",
        3 => "00000100",
        4 => "10000101",
        5 => "00000110",
        6 => "11000011",
        7 => "00000010",
        8 => "11100110",
        9 => "00000000",
        10 => "00000000",

        others => (others=>'0')
    );

    begin 
        process(clk)
        begin
            if(rising_edge(clk)) then
                data <= content_rom(to_integer(adress));
            end if;
        end process;
end architecture;
