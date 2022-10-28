-- LAB 5 ARQUITETURA E ORGANIZACAO DE COMPUTADOR
-- GIANLUCCA FIORI OLIVEIRA E PABLO RODRIGUES SENE

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ROM_PC_UC is
    port (
        clk: in std_logic;
        rst: in std_logic
    );
end entity;

architecture a_ROM_PC_UC of ROM_PC_UC is
    component state_machine is
        port (
            clk: in std_logic;
            state_in: in std_logic;
            rst: in std_logic;
            state_out: out std_logic
        );
    end component;

    component rom is 
        port (
            clk: in std_logic;
            adress: in unsigned(15 downto 0);
            data: out unsigned(7 downto 0)
        );
    end component;

    component program_counter is 
        port(
            clk: in std_logic;
            rst: in std_logic;
            wr_en: in std_logic;
            data_in: in unsigned(15 downto 0);
            data_out: out unsigned(15 downto 0)
        );
    end component;

    component sum_pc is
        port (
            data_in: in unsigned(15 downto 0);
            data_out: out unsigned(15 downto 0)
        );
    end component;

    component control_unit is
        port(
            instruction: in unsigned(7 downto 0);
            adress: out unsigned(4 downto 0);
            jump_en: out std_logic
        );
    end component;

    --Program counter signals 
    signal pc_data_in, pc_data_out: unsigned(15 downto 0);

    --Rom signals
    signal rom_data: unsigned(7 downto 0);

    --Control Unit signals
    signal cu_instruction: unsigned(7 downto 0);
    signal cu_jump_en: std_logic;
    signal cu_adress: unsigned(4 downto 0);

    --Sum program counter signals
    signal sp_data_out: unsigned(15 downto 0);

    --State machine signals
    signal sm_state_out, sm_state_in: std_logic;


    begin 
        state_machine1: state_machine port map(clk => clk, state_in => sm_state_in, rst => rst, state_out => sm_state_out);

        rom1: rom port map(clk => clk, adress => pc_data_out, data => rom_data);

        program_coounter1: program_counter port map(clk => clk, rst => rst, wr_en => sm_state_out, data_in => pc_data_in, data_out => pc_data_out);

        sum_pc1: sum_pc port map(data_in => pc_data_out, data_out => sp_data_out);

        control_unit1: control_unit port map(instruction => cu_instruction, adress => cu_adress ,jump_en => cu_jump_en);

        pc_data_in <= sp_data_out when cu_jump_en='0' else --sum 1 to PC
                      "00000000000" & cu_adress; --Jump to cu_adress

        
        cu_instruction <= rom_data ;--nop
        
        sm_state_in <= sm_state_out;

end architecture;