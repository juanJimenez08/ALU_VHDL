library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity Incremento is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC_VECTOR (3 downto 0));
end Incremento;

architecture Behavioral of Incremento is
begin
    Z <= A + 1; 
    -- Alternativa: Saida_Inc <= A + "0001";
end Behavioral;