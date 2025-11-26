library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (3 downto 0); 
           Resultado : out STD_LOGIC_VECTOR (3 downto 0);
			  C : out STD_LOGIC;
			  O : out STD_LOGIC);
end ALU;

architecture Structural of ALU is

    -- 1. COMPONENTES

    component soma 
	Port( A : in STD_LOGIC_VECTOR(3 downto 0);
	      B : in STD_LOGIC_VECTOR(3 downto 0);
              Z : out STD_LOGIC_VECTOR(3 downto 0);
	      C,O : out STD_LOGIC );
    end component;
              
    component Subtrator
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0);
	       C,O: out STD_LOGIC);
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
               Z : out STD_LOGIC_VECTOR(3 downto 0);
               C,O : out STD_LOGIC);
    end component;

     component shift_r_op
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0);
               C,O : out STD_LOGIC);
    end component;

    component Incremento
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0);
               C,O : out STD_LOGIC);
    end component;
     
    component sub_1
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(3 downto 0);
               C,O : out STD_LOGIC);
    end component;

    

    
    -- 2. SINAIS INTERNOS
    
    signal fio_sum : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_sub : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_and : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_or : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_not : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_shifL : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_shifR : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_inc : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_dec : STD_LOGIC_VECTOR(3 downto 0);
    signal fio_c_soma : STD_LOGIC;
    signal fio_o_soma : STD_LOGIC;
    signal fio_c_sub : STD_LOGIC;
    signal fio_o_sub : STD_LOGIC;
    signal fio_o_inc : STD_LOGIC;
    signal fio_c_inc : STD_LOGIC; 
    signal fio_o_dec : STD_LOGIC;
    signal fio_c_dec : STD_LOGIC;
    signal fio_o_shifL : STD_LOGIC;
    signal fio_c_shifL : STD_LOGIC;
    signal fio_o_shifR : STD_LOGIC;
    signal fio_c_shifR : STD_LOGIC;

begin

    
    -- 3. INSTANCIAÇÃO 
    

     U1: soma port map (

        A => A, 
        B => B, 
        Z => fio_sum,
        C => fio_c_soma,
	O => fio_o_soma
    );
 
    U2: Subtrator port map (
        A => A, 
        B => B, 
        Z => fio_sub,
        C => fio_c_sub,
        O => fio_o_sub
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
        Z => fio_shifL,
        C => fio_c_shifL,
        O => fio_o_shifL
    );
    
    U7: shift_r_op port map (
        A => A,  
        Z => fio_shifR,
        C => fio_c_shifR,
        O => fio_o_shifR
    );
 
    U8: Incremento port map (
        A => A,
        Z => fio_inc,
        C => fio_c_inc,
        O => fio_o_inc
    );
    
    U9: sub_1 port map (
        A => A, 
        Z => fio_dec,
        C => fio_c_dec,
        O => fio_o_dec
       
    );

   
    -- 4. MULTIPLEXADOR 
 process (Sel, fio_sum, fio_sub, fio_and, fio_or, fio_not, fio_shifL, fio_shifR, fio_inc, fio_dec, fio_c_soma, fio_o_soma, fio_c_sub, fio_o_sub, fio_o_inc, fio_c_inc, fio_o_dec, fio_c_dec, fio_o_shifL, fio_c_shifL)
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

	if sel = "0000" then
	    C<=fio_c_soma;
	    O <= fio_o_soma;
        elsif sel ="0001" then
            C<=fio_c_sub;
	    O <= fio_o_sub;
        elsif sel ="0111" then
            C <= fio_c_inc;
            O <= fio_o_inc;
        elsif sel ="1000" then
            C <= fio_c_dec;
            O <= fio_o_dec;
        elsif sel ="0101" then
            C <= fio_c_shifL;
            O <= fio_o_shifL;
        elsif sel ="0110" then 
            C <= fio_c_shifR;
            O <= fio_o_shifR;
	else 
	    C<= '0';
	    O<= '0';
	end if;

    end process;

end Structural;