library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sub_1 is
  port(
    A : in std_logic_vector(3 downto 0);
    Z : out std_logic_vector(3 downto 0)
);

end entity sub_1;

architecture Behavioral of sub_1 is
begin
  Z<= a-1;
end architecture Behavioral;
