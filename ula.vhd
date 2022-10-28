-- op="00" : SUM
-- op="01" : SUBTRACTION
-- op="11" : DIVISION

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is 
    port(
        in_A: in unsigned(15 downto 0);
        in_B: in unsigned(15 downto 0);
        op: in unsigned(1 downto 0);
        out_ULA: out unsigned(15 downto 0);
        division_by_zero: out std_logic;
        greater_or_equal_unsigned: out std_logic
    );
end entity;

architecture a_ula of ula is 
begin
    out_ULA <= in_A + in_B when op="00" else
               in_A - in_B when op="01" and in_A > in_B else
               in_A / in_B when op="11" and in_B /= "0000000000000000" else
               "0000000000000000";

    division_by_zero <= '1' when op="11" and in_B="0000000000000000"  else
                        '0';

    greater_or_equal_unsigned <= '1' when in_A <= in_B else
                                 '0';
end architecture;




