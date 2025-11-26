library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Porta_NOT is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC_VECTOR (3 downto 0));
end Porta_NOT;

architecture Behavioral of Porta_NOT is
begin
    Z <= not A;
end Behavioral;