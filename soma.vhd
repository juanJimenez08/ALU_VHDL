-- Exemplo de uma operação de soma 4 bits em VHDL
-- Autor: Israel
-- Data: 2025-11-21

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity soma is
    port(
        A : in std_logic_vector(3 downto 0); -- Primeiro operando de 4 bits
        B : in std_logic_vector(3 downto 0); -- Segundo operando de 4 bits
        Z : out std_logic_vector(3 downto 0) -- Resultado da soma de 4 bits
    );
end entity soma;
architecture main of soma is
begin
    -- 1. Converte 'a' e 'b' para signed (número com sinal)
    -- 2. Soma os dois
    -- 3. Converte o resultado de volta para std_logic_vector (bits) para a saída
   Z <= std_logic_vector(unsigned(a) + unsigned(b)); -- Realiza a soma
end architecture main;