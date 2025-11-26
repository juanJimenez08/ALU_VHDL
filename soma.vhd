library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity soma is
    port(
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Z : out std_logic_vector(3 downto 0);
        C : out std_logic;
        O : out std_logic
    );
end entity soma;

architecture Behavioral of soma is
    signal op1_extended : unsigned(4 downto 0);
    signal op2_extended : unsigned(4 downto 0);
    signal resultado_5bits : unsigned(4 downto 0);
begin
    
    op1_extended <= unsigned('0' & A);
    op2_extended <= unsigned('0' & B);

  
    resultado_5bits <= op1_extended + op2_extended;

    Z <= std_logic_vector(resultado_5bits(3 downto 0)); 
    C <= std_logic(resultado_5bits(4));                 
    O <= '1' when (A(3) = B(3)) and (std_logic(resultado_5bits(3)) /= A(3)) else '0';

end architecture Behavioral;