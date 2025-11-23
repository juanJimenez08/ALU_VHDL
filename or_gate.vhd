-- Exemplo de uma porta or 4 bits em VHDL
-- Autor: Israel
-- Data: 2025-11-21

library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
    port(
        A : in std_logic_vector(3 downto 0); -- Vetor de 4 bits
        B : in std_logic_vector(3 downto 0);
        Z : out std_logic_vector(3 downto 0) -- Saída de 4 bits
    );
end entity or_gate;

architecture Behavioral of or_gate is
begin
    Z <= a or b; -- Faz a operação bit a bit
end architecture Behavioral;