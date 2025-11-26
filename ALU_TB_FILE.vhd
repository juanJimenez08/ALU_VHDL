library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

entity ALU_TB_FILE is
end ALU_TB_FILE;

architecture Behavioral of ALU_TB_FILE is

    component ALU
        Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
               B : in  STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC_VECTOR (3 downto 0);
               Resultado : out STD_LOGIC_VECTOR (3 downto 0);
               C : out STD_LOGIC;
               O : out STD_LOGIC);
    end component;

    -- Sinais
    signal A_tb : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal B_tb : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Sel_tb : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Res_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal C_tb, O_tb : STD_LOGIC;

    -- Arquivos
    file arquivo_entradas : text open read_mode is "C:/Users/juane/OneDrive/Documentos/QUARTUS/ALU/entradas.txt";
    file arquivo_saidas : text open write_mode is "saidas.txt";

begin

    UUT: ALU port map (A => A_tb, B => B_tb, Sel => Sel_tb, Resultado => Res_tb, O => O_tb, C => C_tb);

    process
        variable linha_leitura : line;
        variable var_A, var_B : STD_LOGIC_VECTOR(3 downto 0);
        variable var_Sel : STD_LOGIC_VECTOR(3 downto 0);
        variable espaco : character;
        variable linha_escrita : line;
        
    begin
        
        while not endfile(arquivo_entradas) loop
            readline(arquivo_entradas, linha_leitura);

            
            if linha_leitura'length > 0 and linha_leitura(1) /= ' ' then

                -- Passo A: Ler
                read(linha_leitura, var_A);
                read(linha_leitura, espaco); 
                read(linha_leitura, var_B);
                read(linha_leitura, espaco); 
                read(linha_leitura, var_Sel);

                -- Enviar para o circuito
                A_tb <= var_A;
                B_tb <= var_B;
                Sel_tb <= var_Sel;

                -- Passo B: Esperar
                wait for 100 ns; 

                -- Passo C: Escrever TUDO 
                
               
                write(linha_escrita, Res_tb);
                
                
                write(linha_escrita, string'(" C:")); 
                
               
                write(linha_escrita, C_tb);
                
               
                write(linha_escrita, string'(" O:")); 
                
               
                write(linha_escrita, O_tb);

                
                writeline(arquivo_saidas, linha_escrita);

            end if;
        end loop;

        file_close(arquivo_entradas);
        file_close(arquivo_saidas);

        assert false report "Simulacao Concluida! Verifique saidas.txt" severity failure;
        wait; 
    end process;

end Behavioral;