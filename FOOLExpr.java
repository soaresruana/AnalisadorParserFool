import java.io.FileReader;
import java_cup.runtime.Symbol;

/*
Autor: Ruana Boeira Soares
*/

public class FOOLExpr {
    public static void main(String[] args) {
        try {           
            // Executar a análise léxica
            Scanner scanner = new Scanner(new FileReader("entrada.txt"));
            System.out.println("Analise Lexica: Lista de Tokens:");
            Symbol s = scanner.next_token();
            while(s.sym != Tokens.EOF){
                System.out.printf("<%d, %s>\n", s.sym, s.value);
                s = scanner.next_token();
            }
            
            // Executar a análise sintática
            scanner = new Scanner(new FileReader("entrada.txt"));
            System.out.println("Analise Parser: Resultado:");
            Parser parser = new Parser(scanner);

            // Obter o resultado do parser
            Symbol parseResult = parser.parse();

            // Verifique se o resultado é nulo antes de exibir
            if (parseResult.value != null) {
                System.out.println("Resultado final: " + parseResult.value);
            }
        }
        catch(Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}

