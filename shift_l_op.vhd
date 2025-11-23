library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_l_op is
  port(
    A : in std_logic_vector(3 downto 0);
    Z : out std_logic_vector(3 downto 0)
  );
end entity shift_l_op;

architecture Behavioral of shift_l_op is
begin

  Z<= std_logic_vector(shift_left(unsigned(a), 1));
  --z<= std_logic_vector(unsigned(A) sll 1);

end architecture Behavioral;

