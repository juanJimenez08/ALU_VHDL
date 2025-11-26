library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Incremento is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC_VECTOR (3 downto 0);
           C, O : out STD_LOGIC);
end Incremento;

architecture Behavioral of Incremento is
    
    signal temp : unsigned(4 downto 0);
begin
    
   
   
    temp <= resize(unsigned(A), 5) + 1;

   
    Z <= std_logic_vector(temp(3 downto 0));
    C <= std_logic(temp(4));
    O <= '1' when A = "0111" else '0';

end Behavioral;