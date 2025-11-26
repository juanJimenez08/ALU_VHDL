library ieee;
use ieee.std_logic_1164.all;

entity shift_l_op is
    port(
        A : in std_logic_vector(3 downto 0);
        Z : out std_logic_vector(3 downto 0);
        C : out std_logic;
        O : out std_logic
    );
end entity shift_l_op;

architecture Behavioral of shift_l_op is
begin
    
    Z <= A(2 downto 0) & '0';
    C <= A(3);
    O <= '1' when A(3) /= A(2) else '0';
end architecture Behavioral;