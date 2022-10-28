library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is 
 port ( 
 	RW: in unsigned(3 downto 0);
 	reg_0: out std_logic;
 	reg_1: out std_logic;
 	reg_2: out std_logic;
 	reg_3: out std_logic;
 	reg_4: out std_logic;
 	reg_5: out std_logic;
 	reg_6: out std_logic;
 	reg_7: out std_logic;
    reg_8: out std_logic;
    reg_9: out std_logic;
    reg_10: out std_logic;
    reg_11: out std_logic;
    reg_12: out std_logic;
    reg_13: out std_logic;
    reg_14: out std_logic;
    reg_15: out std_logic
 );
 end entity;
 
 architecture a_decoder of decoder is 
 	begin
 		reg_0 <= not RW(3) and not RW(2) and not RW(1) and not RW(0); --0000
 		reg_1 <= not RW(3) and not RW(2) and not RW(1) and RW(0); --0001
 		reg_2 <= not RW(3) and not RW(2) and RW(1) and not RW(0); --0010
 		reg_3 <= not RW(3) and not RW(2) and RW(1) and RW(0); --0011
 		reg_4 <= not RW(3) and RW(2) and not RW(1) and not RW(0); --0100
 		reg_5 <= not RW(3) and RW(2) and not RW(1) and RW(0); --0101
 		reg_6 <= not RW(3) and RW(2) and RW(1) and not RW(0); -- 0110
 		reg_7 <= not RW(3) and RW(2) and RW(1) and RW(0); --0111
        reg_8 <= RW(3) and not RW(2) and not RW(1) and not RW(0); --1000
        reg_9 <= RW(3) and not RW(2) and not RW(1) and RW(0); --1001
        reg_10 <= RW(3) and not RW(2) and RW(1) and not RW(0); --1010
        reg_11 <= RW(3) and not RW(2) and RW(1) and RW(0); --1011
        reg_12 <= RW(3) and RW(2) and not RW(1) and not RW(0); --1100
        reg_13 <= RW(3) and RW(2) and not RW(1) and RW(0); --1101
        reg_14 <= RW(3) and RW(2) and RW(1) and not RW(0); --1110
        reg_15 <= RW(3) and RW(2) and RW(1) and RW(0); --1111
 end architecture;