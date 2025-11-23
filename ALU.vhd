library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (3 downto 0); 
           Resultado : out STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Structural of ALU is

    -- 1. COMPONENTES

    component soma 
	Port( A : in STD_LOGIC_VECTOR(3 downto 0);
	      B : in STD_LOGIC_VECTOR(3 downto 0);
              Z : out STD_LOGIC_VECTOR(3 downto 0) );
    end component;
              
    component Subtrator
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component and_gate
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component or_gate
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component Porta_NOT
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
 
    component shift_l_op
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

     component shift_r_op
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component Incremento
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
     
    component sub_1
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    

    
    -- 2. SINAIS INTERNOS (OS FIOS)
    
    signal fio_sum : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_sub : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_and : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_or : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_not : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_shifL : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_shifR : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_inc : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_dec : STD_LOGIC_VECTOR(3 downto 0);

begin

    
    -- 3. INSTANCIAÇÃO 
    

     U1: soma port map (
        A => A, 
        B => B, 
        Z => fio_sum
    );
 
    U2: Subtrator port map (
        A => A, 
        B => B, 
        Z => fio_sub
    );
    
    U3: and_gate port map (
        A => A, 
        B => B, 
        Z => fio_and
    );

     U4: or_gate port map (
        A => A, 
        B => B, 
        Z => fio_or
    );
  
    U5: Porta_NOT port map (
        A => A,  
        Z => fio_not
    );
  
    U6: shift_l_op port map (
        A => A, 
        Z => fio_shifL
    );
    
    U7: shift_r_op port map (
        A => A,  
        Z => fio_shifR
    );
 
    U8: Incremento port map (
        A => A,
        Z => fio_inc
    );
    
    U9: sub_1 port map (
        A => A, 
        Z => fio_dec
    );

   
    -- 4. MULTIPLEXADOR (SAÍDA)
    process (Sel,fio_sum ,fio_sub ,fio_and ,fio_or ,fio_not ,fio_shifL ,fio_shifR ,fio_inc ,fio_dec)
    begin
        case Sel is
            when "0000" => Resultado <= fio_sum;  
            when "0001" => Resultado <= fio_sub;  
            when "0010" => Resultado <= fio_and;
            when "0011" => Resultado <= fio_or;
            when "0100" => Resultado <= fio_not;
            when "0101" => Resultado <= fio_shifL;
            when "0110" => Resultado <= fio_shifR;
            when "0111" => Resultado <= fio_inc;
            when "1000" => Resultado <= fio_dec;  
            
            
            when others => Resultado <= "0000";  
        end case;
    end process;

end Structural;