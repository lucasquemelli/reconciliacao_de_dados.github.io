# reconciliacao_de_dados.github.io
Este é um projeto de reconciliação de dados de vazão volumétrica de uma planta química industrial. 

A reconciliação de dados é necessária quando algum tipo de erro é detecado em um conjunto de dados. O objetivo da reconciliação de dados é - após a detecção e correção do erro - obter os valores reais do conjunto, ou seja, os valores dos dados sem o erro.

# Identificação e limpeza de outliers 6 sigma

Inicialmente, foi feita a limpeza de dados do DataFrame no próprio Excel, excluindo linhas em branco. Em seguida, foi avaliada a presença de outliers em cada variável – pelo desvio 6 σ – utilizando o software R. O comando do R para limpeza de variável está localizado abaixo: 

![image](https://user-images.githubusercontent.com/81119854/124486313-d8a3cd80-dd83-11eb-85bb-8214c190f29d.png)

Repare que, ao compilar o comando para exibição dos outliers, o retorno no 'Console' foi 'numeric(0)'. A confirmação desse cálculo pode ser confirmada pelo gráfico abaixo, em que não há outliers, embora haja pontos próximos ao limite superior e sobre a reta do limite inferior.

![image](https://user-images.githubusercontent.com/81119854/124486764-4d770780-dd84-11eb-94bf-3242c54af358.png)

Os comandos para a limpeza das outras variáveis e seus respectivos gráficos são vistos abaixo: 

![image](https://user-images.githubusercontent.com/81119854/124487364-fcb3de80-dd84-11eb-9e14-be1d40e468b0.png)

![image](https://user-images.githubusercontent.com/81119854/124487420-148b6280-dd85-11eb-8ab7-0203ae3f2c8a.png)

![image](https://user-images.githubusercontent.com/81119854/124487710-6d5afb00-dd85-11eb-94ea-2bcab61285fc.png)

![image](https://user-images.githubusercontent.com/81119854/124487591-4ac8e200-dd85-11eb-9d14-0d77d9ca8554.png)

![image](https://user-images.githubusercontent.com/81119854/124487845-8fed1400-dd85-11eb-93a1-103ce7ef4a50.png)

![image](https://user-images.githubusercontent.com/81119854/124487984-b57a1d80-dd85-11eb-84c6-da3f9d6b45f1.png)

# Histogramas

Após a limpeza individual e multivariada dos outliers, foram construídos histogramas com os dados das variáveis para verificar se alguma possuía distribuição diferente da normal. Uma distribuição normal apresenta eventos aleatórios. Uma distribuição diferente da normal, apresenta uma tendência em um determinado evento. Esse método estatístico permite a identificação de algum erro em um sistema/conjunto de dados.

A seguir, o comando no R para os histogramas de cada variável: 

![image](https://user-images.githubusercontent.com/81119854/124498171-4ce56d80-dd92-11eb-990f-6971ec6fb3d9.png)
![image](https://user-images.githubusercontent.com/81119854/124498228-62f32e00-dd92-11eb-9ce5-f10e3c82f4fc.png)

![image](https://user-images.githubusercontent.com/81119854/124498322-861ddd80-dd92-11eb-9b50-99b669301079.png)
![image](https://user-images.githubusercontent.com/81119854/124498375-9c2b9e00-dd92-11eb-8e36-e9a04604c8b2.png)

![image](https://user-images.githubusercontent.com/81119854/124498446-ba919980-dd92-11eb-9203-88b6f2d3111c.png)
![image](https://user-images.githubusercontent.com/81119854/124498491-ce3d0000-dd92-11eb-90d3-5143005947f2.png)

![image](https://user-images.githubusercontent.com/81119854/124498543-e876de00-dd92-11eb-8fea-143d5c74e718.png)
![image](https://user-images.githubusercontent.com/81119854/124498588-f9bfea80-dd92-11eb-8a2b-e235e8a47b2c.png)

O único histograma que não apresentou uma distribuição normal foi o da variável F2. Portanto, essa é a variável com erro sistemático. 

# Gráfico de dispersão

Após a confirmação da presença do erro sistemático na variável F2, foi feito um gráfico de dispersão com os pontos da vazão F2 pelo tempo (n° de observações) para verificar seu comportamento. 

![image](https://user-images.githubusercontent.com/81119854/124499096-d184bb80-dd93-11eb-9479-5eab0dd24ac0.png)
![image](https://user-images.githubusercontent.com/81119854/124499038-bca82800-dd93-11eb-9342-7ef8480797e5.png)

Pelo comportamento da variável F2, foi possível identificar que após a observação de número 24031 a curva apresenta uma descontinuidade. Isso pode ter ocorrido após a calibração do medidor de vazão quando descobriram o erro sistemático, confirmando a hipótese de ser a variável F2 aquela que apresenta erro. 

# Processo de reconciliação dos dados

Identificada a variável com erro sistemático, efetua-se a reconciliação de dados a partir da minimização do somatório do erro quadrático, considerando o valor medido menos o valor reconciliado, conforme a Equação abaixo: 

![image](https://user-images.githubusercontent.com/81119854/124499471-6f788600-dd94-11eb-81a6-1732774af428.png)

em que F1R, F2R, F1AR e F3R são os valores reconciliados de F1, F2, F1A e F3, respectivamente.

O comando no RStudio para a reconciliação dos dados está abaixo:

