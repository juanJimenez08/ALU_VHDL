-- Arquivo: shift_right.vhd
-- Descrição: Deslocamento lógico de 1 bit para a direita
-- Autor: Israel
-- Data: 2025-11-21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity shift_r_op is
    port(
        A : in std_logic_vector(3 downto 0);
        Z : out std_logic_vector(3 downto 0)
    );
end entity shift_r_op;

architecture Behavioral of shift_r_op is
begin
    
    Z <= std_logic_vector(shift_right(unsigned(a), 1));
end architecture Behavioral;