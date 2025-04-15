Class User.Exercicio3
{

ClassMethod exercicio3(num1 As %Integer, num2 As %Integer, num3 As %Integer)
{
    // 1.1 Exibir e contar números entre num1 e num2 com resto 5 na divisão por 11
    Write "Números entre ", num1, " e ", num2, " com resto 5 na divisão por 11:", !
    Set count1 = 0
    For i = num1 + 1:1:num2 - 1 {
        If (i # 11) = 5 {
            Write i, " "
            Set count1 = count1 + 1
        }
    }
    Write !,"Total de números encontrados: ", count1, !

    // 1.2 Exibir e contar números múltiplos de 3 entre num2 e num3
    Write "Números múltiplos de 3 entre ", num2, " e ", num3, ":", !
    Set count2 = 0
    For i = num2 + 1:1:num3 - 1 {
        If (i # 3) = 0 {
            Write i, " "
            Set count2 = count2 + 1
        }
    }
    Write !,"Total de múltiplos de 3 encontrados: ", count2, !

    // 1.3 Exibir a soma de todos os números entre num1 e num2
    Set sum = 0
    For i = num1 + 1:1:num2 - 1 {
        Set sum = sum + i
    }
    Write "Soma de todos os números entre ", num1, " e ", num2, ": ", sum, !
}

}
