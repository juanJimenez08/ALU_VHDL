library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Subtrator is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC_VECTOR (3 downto 0);
	   C : out STD_LOGIC;
           O : out STD_LOGIC );        

end Subtrator;

architecture Behavioral of Subtrator is
          signal sub_temp : unsigned(4 downto 0);
begin
    sub_temp <= resize(unsigned(A), 5) - resize(unsigned(B), 5);

    Z <= std_logic_vector(sub_temp(3 downto 0));
    C <= sub_temp(4);
    O <= '1' when (A(3) /= B(3)) and (std_logic(sub_temp(3)) /= A(3)) else '0';



end Behavioral;