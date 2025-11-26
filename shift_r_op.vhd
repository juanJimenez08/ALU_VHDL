library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_r_op is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC_VECTOR (3 downto 0);
           C : out STD_LOGIC;
           O : out STD_LOGIC);
end shift_r_op;

architecture Behavioral of shift_r_op is
begin
 
    Z <= '0' & A(3 downto 1);
    C <= A(0);
    O <= A(3); 

end Behavioral;