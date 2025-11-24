library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL; -- Obrigatório para ler/escrever bits
use STD.TEXTIO.ALL;            -- Obrigatório para lidar com arquivos

entity ALU_TB_FILE is
end ALU_TB_FILE;

architecture Behavioral of ALU_TB_FILE is

    component ALU
        Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
               B : in  STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC_VECTOR (3 downto 0);
               Resultado : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- Sinais
    signal A_tb : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal B_tb : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Sel_tb : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Res_tb : STD_LOGIC_VECTOR (3 downto 0);

    -- 1. ARQUIVO DE ENTRADA (Leitura)
    file arquivo_entradas : text open read_mode is "C:/Users/juane/OneDrive/Documentos/QUARTUS/ALU/entradas.txt";
    
    -- 2. ARQUIVO DE SAÍDA (Escrita - Vai ser criado sozinho)
    file arquivo_saidas : text open write_mode is "saidas.txt";

begin

    UUT: ALU port map (A => A_tb, B => B_tb, Sel => Sel_tb, Resultado => Res_tb);

    process
        -- Variáveis para LEITURA
        variable linha_leitura : line;
        variable var_A, var_B : STD_LOGIC_VECTOR(3 downto 0);
        variable var_Sel : STD_LOGIC_VECTOR(3 downto 0);
        variable espaco : character;
        
        -- Variáveis para ESCRITA
        variable linha_escrita : line;
        
    begin
        
        while not endfile(arquivo_entradas) loop
            -- --- PASSO A: LER ENTRADAS ---
            readline(arquivo_entradas, linha_leitura);
            read(linha_leitura, var_A);
            read(linha_leitura, espaco); 
            read(linha_leitura, var_B);
            read(linha_leitura, espaco); 
            read(linha_leitura, var_Sel);

            -- Enviar para o circuito
            A_tb <= var_A;
            B_tb <= var_B;
            Sel_tb <= var_Sel;

            -- --- PASSO B: ESPERAR O CALCULO ---
            wait for 100 ns; 

            -- --- PASSO C: SALVAR O RESULTADO ---
            
            
            -- Escreve os bits do resultado na linha virtual
            write(linha_escrita, Res_tb);
            
            -- "Carimba" a linha no arquivo de texto fisico
            writeline(arquivo_saidas, linha_escrita);

        end loop;

        -- Fecha o arquivo (boa prática)
        file_close(arquivo_entradas);
        file_close(arquivo_saidas);

       assert false report "Simulacao Concluida! Verifique o arquivo saidas.txt" severity failure;
       wait; 
    end process;

end Behavioral;